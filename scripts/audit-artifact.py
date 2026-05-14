#!/usr/bin/env python3
"""Score an HTML artifact against the invisible quality gate."""

from __future__ import annotations

import argparse
import json
import re
import sys
from html.parser import HTMLParser
from pathlib import Path


class TextExtractor(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self.parts: list[str] = []

    def handle_data(self, data: str) -> None:
        if data.strip():
            self.parts.append(data.strip())


def normalize(html: str) -> str:
    parser = TextExtractor()
    parser.feed(html)
    text = " ".join(parser.parts)
    return re.sub(r"\s+", " ", text).strip().lower()


def has_any(text: str, patterns: list[str]) -> bool:
    return any(re.search(pattern, text, re.IGNORECASE) for pattern in patterns)


def word_count(text: str) -> int:
    return len(re.findall(r"[a-z0-9]+", text, re.IGNORECASE))


def has_thin_keyword_stuffing(html: str, text: str) -> bool:
    if word_count(text) >= 170:
        return False
    matched = 0
    for check in CHECKS:
        source = html.lower() if check.get("html") else text
        if has_any(source, check["patterns"]):
            matched += 1
    return matched >= 9


def has_generic_next_action(html: str, text: str) -> bool:
    return bool(
        re.search(
            r"\b(best next move|next action|recommendation)\s*:\s*(decide|continue|approve it|do it|proceed|next prompt)\b",
            text,
            re.IGNORECASE,
        )
    )


CHECKS = [
    {
        "id": "intent",
        "points": 15,
        "label": "Clear user intent",
        "patterns": [r"\bwhat you need\b", r"\bprimary intent\b", r"\bintent\b", r"\bqu[eé] necesitas\b", r"\bintenci[oó]n\b"],
    },
    {
        "id": "secondary",
        "points": 8,
        "label": "Useful secondary needs",
        "patterns": [r"\balso handled\b", r"\bsecondary\b", r"\balso needs\b", r"\bcovered\b", r"\btambi[eé]n cubre\b", r"\bnecesidades secundarias\b", r"\bcubierto\b"],
    },
    {
        "id": "evidence",
        "points": 12,
        "label": "Evidence visible",
        "patterns": [r"\bwhat i checked\b", r"\bevidence\b", r"\binspected\b", r"\bsources?\b", r"\blo que revis[eé]\b", r"\bevidencia\b", r"\binspeccionad[oa]\b", r"\bfuentes?\b"],
    },
    {
        "id": "separation",
        "points": 10,
        "label": "Known/suggested/assumed/unclear separated",
        "patterns": [
            r"\bwhat we know\b",
            r"\bwhat this suggests\b",
            r"\bwhat i am assuming\b",
            r"\bwhat is still unclear\b",
            r"\bfacts?\b.*\binferences?\b",
            r"\blo que sabemos\b",
            r"\blo que esto sugiere\b",
            r"\blo que asumo\b",
            r"\blo que sigue incierto\b",
            r"\bhechos?\b.*\binferencias?\b",
        ],
    },
    {
        "id": "html_advantage",
        "points": 12,
        "label": "HTML advantage is real",
        "patterns": [r"\bwhy this helps\b", r"\bhtml advantage\b", r"\bbrowser view\b", r"\bwork this saves\b", r"\bpor qu[eé] ayuda\b", r"\bventaja html\b", r"\bvista en navegador\b", r"\btrabajo que ahorra\b"],
    },
    {
        "id": "budget",
        "points": 6,
        "label": "Smallest useful size",
        "patterns": [r"\bsize\b", r"\bbudget\b", r"\bcompact\b", r"\bstandard\b", r"\binteractive\b", r"\btama[nñ]o\b", r"\bpresupuesto\b", r"\bcompacto\b", r"\best[aá]ndar\b", r"\binteractivo\b"],
    },
    {
        "id": "first_screen_decision",
        "points": 12,
        "label": "Decision, risk, and next action",
        "patterns": [r"\bbest next move\b", r"\brecommendation\b", r"\bnext action\b", r"\bdecision\b", r"\bmejor siguiente paso\b", r"\brecomendaci[oó]n\b", r"\bsiguiente acci[oó]n\b", r"\bdecisi[oó]n\b"],
    },
    {
        "id": "visual_model",
        "points": 6,
        "label": "Visual structure clarifies the work",
        "patterns": [r"<table\b", r"\bgrid\b", r"\btimeline\b", r"\bmatrix\b", r"\bmap\b", r"\bcompare\b"],
        "html": True,
    },
    {
        "id": "interaction_export",
        "points": 7,
        "label": "Interaction/export useful when present",
        "patterns": [r"\bcopy\b", r"\bexport\b", r"<textarea\b", r"<button\b", r"\bdownload\b", r"\bcopiar\b", r"\bexportar\b", r"\bdescargar\b"],
        "html": True,
    },
    {
        "id": "next_prompt",
        "points": 5,
        "label": "Copy-ready continuation",
        "patterns": [r"\bcontinue from here\b", r"\bnext prompt\b", r"\bcopy prompt\b", r"\bready-to-run\b", r"\bcontin[uú]a desde aqu[ií]\b", r"\bprompt para continuar\b", r"\bcomando listo\b"],
    },
    {
        "id": "memory_decision",
        "points": 3,
        "label": "Memory decision",
        "patterns": [r"\bsave this\?\b", r"\bsave decision\b", r"\bmemory label\b", r"\barchive recommendation\b", r"\bguardar esto\?\b", r"\brecomendaci[oó]n de archivo\b", r"\betiqueta de memoria\b", r"\bvalidez sugerida\b"],
    },
    {
        "id": "memory_access",
        "points": 2,
        "label": "Quiet memory access",
        "patterns": [r"\bsaved for later\b", r"\bfind it fast\b", r"\bnot saved\b", r"\bguardado para despu[eé]s\b", r"\bencu[eé]ntralo r[aá]pido\b", r"\bno guardado\b"],
    },
    {
        "id": "user_agency",
        "points": 2,
        "label": "User agency visible",
        "patterns": [r"\bcompare\b", r"\brevise\b", r"\bthink this through\b", r"\bsave for later\b", r"\bstop\b", r"\bcomparar\b", r"\brevisar\b", r"\bpensar\b", r"\bguardar\b", r"\bdetener\b"],
    },
]

HARD_FAILS = [
    ("missing_doctype", "Missing full HTML doctype", lambda html, text: "<!doctype html" not in html.lower()),
    ("missing_viewport", "Missing responsive viewport", lambda html, text: 'name="viewport"' not in html.lower()),
    ("no_dark_mode", "Missing system dark mode", lambda html, text: "prefers-color-scheme" not in html.lower()),
    (
        "internal_heading",
        "Visible heading exposes internal process language",
        lambda html, text: bool(
            re.search(
                r"<h[1-6][^>]*>(primary intent|secondary intents|base concept|artifact budget|html advantage|evidence inspected|fact sheet|quality gate|output contract|failure mode|scenario tests|behavior dimensions|intent distillation)</h[1-6]>",
                html,
                re.IGNORECASE,
            )
        ),
    ),
    (
        "unsupported_test_claim",
        "Claims tests passed without visible proof",
        lambda html, text: bool(re.search(r"\btests? pass(?:ed)?\b", text)) and not bool(re.search(r"\b(command output|what i checked|evidence)\b", text)),
    ),
    (
        "pushy_language",
        "Uses pushy next-step language",
        lambda html, text: bool(re.search(r"\byou must\b|\brequired next step\b|\bclick here to proceed\b", text)),
    ),
    (
        "thin_keyword_stuffing",
        "Contains quality keywords without enough useful substance",
        has_thin_keyword_stuffing,
    ),
    (
        "generic_next_action",
        "Next action is too generic to be useful",
        has_generic_next_action,
    ),
]


def score_file(path: Path) -> dict:
    html = path.read_text(encoding="utf-8")
    text = normalize(html)
    checks = []
    total = 0

    for check in CHECKS:
        source = html.lower() if check.get("html") else text
        passed = has_any(source, check["patterns"])
        points = check["points"] if passed else 0
        total += points
        checks.append(
            {
                "id": check["id"],
                "label": check["label"],
                "passed": passed,
                "points": points,
                "max_points": check["points"],
            }
        )

    hard_fails = [
        {"id": fail_id, "message": message}
        for fail_id, message, predicate in HARD_FAILS
        if predicate(html, text)
    ]

    status = "decision-ready" if total >= 90 else "useful-revise" if total >= 75 else "block"
    if hard_fails:
        status = "block"

    return {
        "artifact": str(path),
        "score": total,
        "status": status,
        "hard_fails": hard_fails,
        "checks": checks,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Audit one HTML artifact against the invisible quality gate.")
    parser.add_argument("artifact", type=Path)
    parser.add_argument("--min-score", type=int, default=75)
    parser.add_argument("--json", action="store_true", help="Print JSON output.")
    args = parser.parse_args()

    result = score_file(args.artifact)
    passed = result["score"] >= args.min_score and not result["hard_fails"]

    if args.json:
        print(json.dumps(result, indent=2))
    else:
        print(f"{result['status']}: {result['score']}/100 {result['artifact']}")
        for fail in result["hard_fails"]:
            print(f"FAIL {fail['id']}: {fail['message']}")
        for check in result["checks"]:
            marker = "OK" if check["passed"] else "MISS"
            print(f"{marker} {check['id']}: {check['points']}/{check['max_points']} - {check['label']}")

    return 0 if passed else 1


if __name__ == "__main__":
    sys.exit(main())
