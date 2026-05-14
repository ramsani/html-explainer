#!/usr/bin/env python3
"""Build the local HTML knowledge base explorer from index.json."""

from __future__ import annotations

import argparse
import html
import json
from collections import Counter, defaultdict
from datetime import datetime, timezone
from pathlib import Path


def read_json(path: Path) -> dict:
    if not path.exists():
        return {}
    return json.loads(path.read_text(encoding="utf-8"))


def norm_list(value) -> list[str]:
    if not value:
        return []
    if isinstance(value, list):
        return [str(item).strip() for item in value if str(item).strip()]
    return [str(value).strip()]


def enrich(output_root: Path, index: dict) -> dict:
    artifacts = []
    metadata_by_id = {}
    for item in index.get("artifacts", []):
        metadata = read_json(output_root / item.get("metadata_path", ""))
        merged = {**item, **metadata}
        merged["tags"] = sorted(set(norm_list(merged.get("tags"))))
        merged["topics"] = sorted(set(norm_list(merged.get("topics")) or merged["tags"][:4]))
        merged["aliases"] = sorted(set(norm_list(merged.get("aliases"))))
        merged["knowledge_type"] = merged.get("knowledge_type") or infer_knowledge_type(merged)
        merged["recommended_action"] = merged.get("recommended_action") or recommended_action(merged)
        merged["resurface_score"] = resurface_score(merged)
        artifacts.append(merged)
        metadata_by_id[merged.get("id")] = merged

    relations = list(index.get("relations", []))
    relations.extend(auto_relations(artifacts))
    backlinks = defaultdict(list)
    outgoing = defaultdict(list)
    for rel in relations:
        source = rel.get("from")
        target = rel.get("to")
        if source and target:
            outgoing[source].append(rel)
            backlinks[target].append(rel)
    for artifact in artifacts:
        artifact["backlinks"] = backlinks.get(artifact.get("id"), [])
        artifact["outgoing_links"] = outgoing.get(artifact.get("id"), [])

    facets = {
        "projects": sorted({a.get("project") for a in artifacts if a.get("project")}),
        "knowledge_types": sorted({a.get("knowledge_type") for a in artifacts if a.get("knowledge_type")}),
        "patterns": sorted({a.get("pattern") for a in artifacts if a.get("pattern")}),
        "tags": sorted({tag for a in artifacts for tag in a.get("tags", [])}),
        "topics": sorted({topic for a in artifacts for topic in a.get("topics", [])}),
        "actions": sorted({a.get("recommended_action") for a in artifacts if a.get("recommended_action")}),
        "freshness": sorted({a.get("freshness_risk") for a in artifacts if a.get("freshness_risk")}),
    }
    review_queue = sorted(
        [a for a in artifacts if a.get("validity") != "do-not-reuse"],
        key=lambda a: a.get("resurface_score", 0),
        reverse=True,
    )[:5]
    return {
        "schema_version": "0.2.0",
        "generated_at": datetime.now(timezone.utc).replace(microsecond=0).isoformat(),
        "output_root": str(output_root),
        "artifacts": artifacts,
        "relations": relations,
        "facets": facets,
        "review_queue": [a.get("id") for a in review_queue],
        "current_references": [
            a.get("id")
            for a in artifacts
            if a.get("validity") in {"evergreen", "replaceable"} and a.get("freshness_risk") != "high"
        ],
        "mocs": build_mocs(artifacts),
    }


def infer_knowledge_type(a: dict) -> str:
    text = " ".join([a.get("pattern", ""), a.get("title", ""), " ".join(a.get("tags", []))]).lower()
    if "audit" in text or "review" in text or "auditor" in text:
        return "review"
    if "decision" in text or "decisi" in text:
        return "decision"
    if "map" in text or "recap" in text:
        return "map"
    if "prompt" in text or "agent" in text:
        return "prompt"
    if "workflow" in text or "flow" in text:
        return "workflow"
    if "research" in text or "comparison" in text:
        return "research"
    if "design" in text or "visual" in text:
        return "design"
    return "status"


def recommended_action(a: dict) -> str:
    validity = a.get("validity")
    freshness = a.get("freshness_risk")
    if validity == "private":
        return "private-review"
    if validity == "superseded":
        return "ignore"
    if validity == "do-not-reuse":
        return "ignore"
    if validity == "temporal" or freshness == "high":
        return "refresh"
    if validity == "evergreen":
        return "reuse"
    if validity == "replaceable":
        return "inspect"
    return "open"


def age_days(created_at: str) -> int:
    try:
        created = datetime.fromisoformat(str(created_at).replace("Z", "+00:00"))
        now = datetime.now(created.tzinfo or timezone.utc)
        return max(0, int((now - created).total_seconds() // 86400))
    except Exception:
        return 999


def resurface_score(a: dict) -> int:
    score = 0
    score += {"high": 30, "medium": 18, "low": 5}.get(a.get("freshness_risk"), 10)
    score += {"temporal": 26, "replaceable": 18, "evergreen": 7, "private": 4, "superseded": -20, "do-not-reuse": -50}.get(a.get("validity"), 0)
    score += min(age_days(a.get("created_at", "")) // 3, 20)
    score += 12 if a.get("next_action") else 0
    score += 8 if a.get("known_limits") else 0
    score -= int(a.get("resurface_count") or 0) * 6
    return score


def auto_relations(artifacts: list[dict]) -> list[dict]:
    relations = []
    by_tag = defaultdict(list)
    by_project = defaultdict(list)
    by_pattern = defaultdict(list)
    for artifact in artifacts:
        aid = artifact.get("id")
        if not aid:
            continue
        for tag in artifact.get("tags", []):
            by_tag[tag.lower()].append(aid)
        if artifact.get("project"):
            by_project[artifact["project"].lower()].append(aid)
        if artifact.get("pattern"):
            by_pattern[artifact["pattern"].lower()].append(aid)

    def connect(groups, rel_type, label):
        for key, ids in groups.items():
            if len(ids) < 2:
                continue
            for source in ids:
                for target in ids:
                    if source != target:
                        relations.append({"from": source, "to": target, "type": rel_type, "reason": f"Shared {label}: {key}"})

    connect(by_tag, "related_to", "tag")
    connect(by_project, "same_project", "project")
    connect(by_pattern, "same_pattern", "pattern")
    return relations


def build_mocs(artifacts: list[dict]) -> list[dict]:
    counter = Counter(topic for a in artifacts for topic in a.get("topics", []))
    return [
        {
            "topic": topic,
            "count": count,
            "artifact_ids": [a.get("id") for a in artifacts if topic in a.get("topics", [])],
        }
        for topic, count in counter.most_common()
    ]


def render_page(data: dict) -> str:
    payload = json.dumps(data, ensure_ascii=False)
    escaped_payload = payload.replace("</", "<\\/")
    return f"""<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Base de conocimiento html-explainer</title>
<style>
:root{{--bg:#f8fafc;--panel:#fff;--ink:#111827;--muted:#64748b;--line:#cbd5e1;--soft:#f1f5f9;--blue:#1d4ed8;--green:#166534;--amber:#92400e;--red:#991b1b;--purple:#6d28d9;--r:8px}}
@media(prefers-color-scheme:dark){{:root{{--bg:#0f172a;--panel:#111827;--ink:#e5e7eb;--muted:#94a3b8;--line:#334155;--soft:#1f2937;--blue:#93c5fd;--green:#86efac;--amber:#fcd34d;--red:#fca5a5;--purple:#c4b5fd}}}}
*{{box-sizing:border-box}}body{{margin:0;background:var(--bg);color:var(--ink);font-family:system-ui,-apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif;line-height:1.45}}.wrap{{max-width:1180px;margin:auto;padding:22px}}h1{{font-size:1.45rem;margin:.1rem 0}}h2{{font-size:.78rem;text-transform:uppercase;letter-spacing:.08em;color:var(--muted);margin:.1rem 0 .7rem}}.card{{background:var(--panel);border:1px solid var(--line);border-radius:var(--r);padding:16px;margin:12px 0}}.hero{{display:grid;grid-template-columns:1.3fr .7fr;gap:14px;align-items:start}}.grid{{display:grid;grid-template-columns:repeat(4,1fr);gap:10px}}.two{{display:grid;grid-template-columns:.8fr 1.2fr;gap:12px}}.metric{{font-size:2rem;font-weight:850}}.muted{{color:var(--muted)}}.small{{font-size:.83rem}}.badge{{display:inline-block;border-radius:999px;padding:4px 8px;font-size:.7rem;font-weight:750;background:var(--soft);color:var(--muted);margin:2px}}.good{{color:var(--green)}}.warn{{color:var(--amber)}}.bad{{color:var(--red)}}.blue{{color:var(--blue)}}.filters{{display:grid;grid-template-columns:2fr 1fr 1fr 1fr;gap:8px}}input,select,textarea{{width:100%;font:inherit;border:1px solid var(--line);background:var(--panel);color:var(--ink);border-radius:var(--r);padding:9px}}.artifact{{border:1px solid var(--line);border-radius:var(--r);padding:14px;background:var(--panel);margin:10px 0}}.artifact h3{{margin:.25rem 0;font-size:1rem}}.actions{{display:flex;flex-wrap:wrap;gap:8px;margin-top:10px}}.btn{{display:inline-flex;text-decoration:none;align-items:center;justify-content:center;border:0;border-radius:var(--r);padding:8px 10px;font-weight:750;background:var(--ink);color:var(--bg);cursor:pointer;font-size:.83rem}}.btn.secondary{{background:var(--soft);color:var(--ink);border:1px solid var(--line)}}.queue{{border-left:4px solid var(--blue)}}.stale{{border-left:4px solid var(--amber)}}.private{{border-left:4px solid var(--purple)}}.superseded{{opacity:.7}}.moc{{display:flex;justify-content:space-between;gap:8px;border-bottom:1px solid var(--line);padding:7px 0}}textarea{{min-height:92px;background:var(--soft);font:12px ui-monospace,SFMono-Regular,Menlo,monospace}}@media(max-width:800px){{.hero,.grid,.two,.filters{{grid-template-columns:1fr}}.wrap{{padding:14px}}}}
</style>
</head>
<body>
<main class="wrap">
<section class="card hero">
<div>
<span class="badge">local-first</span><span class="badge">PKM</span><span class="badge">resurfacing</span>
<h1>Tu conocimiento útil</h1>
<p class="muted">No es una carpeta de archivos. Es una base viva para abrir, reencontrar, conectar, anotar, refrescar y continuar desde los HTML que ya pagaste con tokens.</p>
</div>
<div class="card" style="margin:0">
<h2>Qué hacer ahora</h2>
<p id="top-action">Cargando recomendación...</p>
<a class="btn" href="#review">Revisar sugeridos</a>
</div>
</section>
<section class="grid">
<div class="card"><div class="metric" id="total">0</div><div class="muted">Páginas</div></div>
<div class="card"><div class="metric" id="topics">0</div><div class="muted">Temas</div></div>
<div class="card"><div class="metric" id="review-count">0</div><div class="muted">Para resurfacing</div></div>
<div class="card"><div class="metric" id="links-count">0</div><div class="muted">Conexiones</div></div>
</section>
<section class="two">
<aside class="card">
<h2>Maps of Content</h2>
<div id="mocs"></div>
</aside>
<section class="card" id="review">
<h2>Conviene revisar</h2>
<div id="review-list"></div>
</section>
</section>
<section class="card">
<h2>Buscar y filtrar</h2>
<div class="filters">
<input id="q" placeholder="Buscar tema, título, tag, proyecto...">
<select id="project"><option value="all">Proyecto</option></select>
<select id="type"><option value="all">Tipo</option></select>
<select id="action"><option value="all">Acción</option></select>
</div>
</section>
<section class="card">
<h2>Páginas</h2>
<div id="list"></div>
</section>
<section class="card">
<h2>Continuar desde aquí</h2>
<textarea id="prompt" readonly>Elige una página para generar un prompt de reentrada.</textarea>
<p><button class="btn" onclick="copyPrompt()">Copiar prompt</button></p>
</section>
</main>
<script type="application/json" id="kb-data">{escaped_payload}</script>
<script>
const kb=JSON.parse(document.getElementById('kb-data').textContent);const artifacts=kb.artifacts||[];let selected=null;
const $=id=>document.getElementById(id);
function cls(a){{if(a.validity==='private')return'private';if(a.validity==='superseded')return'superseded';if(a.freshness_risk==='high'||a.validity==='temporal')return'stale';return''}}
function actionLabel(a){{return {{refresh:'Refrescar',reuse:'Reusar',inspect:'Inspeccionar',ignore:'Histórico',open:'Abrir','private-review':'Privado'}}[a.recommended_action]||'Abrir'}}
function relCount(a){{return (a.backlinks||[]).length+(a.outgoing_links||[]).length}}
function prompt(a){{return a.handoff_prompt||`Usa el artefacto "${{a.title}}" (${{a.id}}) como contexto local. Revisa su metadata, decide si conviene reusar, refrescar, reemplazar o ignorar, y conserva intención, evidencia, límites, frescura y relaciones.`}}
function renderOptions(){{for(const [id,field] of [['project','project'],['type','knowledge_type'],['action','recommended_action']]){{const s=$(id);[...new Set(artifacts.map(a=>a[field]).filter(Boolean))].sort().forEach(v=>{{const o=document.createElement('option');o.value=v;o.textContent=v;s.appendChild(o)}})}}}}
function filtered(){{const q=$('q').value.toLowerCase();return artifacts.filter(a=>{{const hay=[a.title,a.summary,a.project,a.knowledge_type,a.pattern,(a.tags||[]).join(' '),(a.topics||[]).join(' '),(a.aliases||[]).join(' ')].join(' ').toLowerCase();return (!q||hay.includes(q))&&($('project').value==='all'||a.project===$('project').value)&&($('type').value==='all'||a.knowledge_type===$('type').value)&&($('action').value==='all'||a.recommended_action===$('action').value)}})}}
function card(a){{const note=localStorage.getItem('html-explainer-note:'+a.id)||'';return `<article class="artifact ${{cls(a)}}"><div><span class="badge">${{a.validity||'unknown'}}</span><span class="badge">${{a.knowledge_type||'status'}}</span><span class="badge">${{actionLabel(a)}}</span><span class="badge">${{relCount(a)}} links</span></div><h3>${{escapeHtml(a.title||a.id)}}</h3><p class="small muted">${{escapeHtml(a.summary||'Sin resumen')}}</p><p class="small"><strong>Temas:</strong> ${{(a.topics||a.tags||[]).slice(0,5).map(escapeHtml).join(', ')||'sin tema'}} · <strong>Proyecto:</strong> ${{escapeHtml(a.project||'sin proyecto')}}</p><div class="actions"><a class="btn" href="${{a.artifact_path}}">Abrir</a><a class="btn secondary" href="${{a.metadata_path}}">Metadata</a><button class="btn secondary" onclick="selectArtifact('${{a.id}}')">Continuar</button><button class="btn secondary" onclick="annotate('${{a.id}}')">${{note?'Editar nota':'Anotar'}}</button></div>${{note?`<p class="small"><strong>Nota:</strong> ${{escapeHtml(note)}}</p>`:''}}</article>`}}
function escapeHtml(s){{return String(s||'').replace(/[&<>"']/g,m=>({{'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#039;'}}[m]))}}
function selectArtifact(id){{selected=artifacts.find(a=>a.id===id);$('prompt').value=prompt(selected)}}
function annotate(id){{const current=localStorage.getItem('html-explainer-note:'+id)||'';const value=promptWindow('Anotación local para esta página:',current);if(value!==null){{if(value.trim())localStorage.setItem('html-explainer-note:'+id,value.trim());else localStorage.removeItem('html-explainer-note:'+id);render()}}}}
function promptWindow(label,value){{return window.prompt(label,value)}}
function render(){{$('total').textContent=artifacts.length;$('topics').textContent=(kb.facets?.topics||[]).length;$('review-count').textContent=(kb.review_queue||[]).length;$('links-count').textContent=(kb.relations||[]).length;const top=artifacts.find(a=>(kb.review_queue||[]).includes(a.id))||artifacts[0];$('top-action').textContent=top?`Abre "${{top.title}}" y decide si conviene ${{actionLabel(top).toLowerCase()}}.`:'Todavía no hay páginas guardadas.';$('mocs').innerHTML=(kb.mocs||[]).slice(0,12).map(m=>`<div class="moc"><a href="#" onclick="setSearch('${{escapeHtml(m.topic)}}')">${{escapeHtml(m.topic)}}</a><span class="badge">${{m.count}}</span></div>`).join('')||'<p class="muted">Sin temas todavía.</p>';$('review-list').innerHTML=(kb.review_queue||[]).map(id=>artifacts.find(a=>a.id===id)).filter(Boolean).map(card).join('')||'<p class="muted">Nada urgente por revisar.</p>';$('list').innerHTML=filtered().map(card).join('')||'<p class="muted">Sin resultados.</p>'}}
function setSearch(v){{$('q').value=v;render();return false}}
function copyPrompt(){{navigator.clipboard&&navigator.clipboard.writeText($('prompt').value)}}
['q','project','type','action'].forEach(id=>$(id).addEventListener('input',render));renderOptions();render();
</script>
</body>
</html>"""


def main() -> int:
    parser = argparse.ArgumentParser(description="Rebuild the local html-explainer knowledge base explorer.")
    parser.add_argument("--output-root", type=Path, default=Path.home() / ".claude/html-explainer/outputs")
    args = parser.parse_args()
    output_root = args.output_root.expanduser()
    index = read_json(output_root / "index.json") or {
        "schema_version": "0.1.0",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "output_root": str(output_root),
        "artifacts": [],
    }
    data = enrich(output_root, index)
    (output_root / "index.json").write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    (output_root / "index.html").write_text(render_page(data), encoding="utf-8")
    print(f"rebuilt: {output_root / 'index.html'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
