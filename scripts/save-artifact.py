#!/usr/bin/env python3
"""Save a generated HTML artifact into local artifact memory."""

from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path


VALIDITY = {"temporal", "replaceable", "evergreen", "superseded", "private", "do-not-reuse"}


def slugify(value: str) -> str:
    slug = re.sub(r"[^a-z0-9]+", "-", value.lower()).strip("-")
    return slug[:72] or "artifact"


def read_index(path: Path) -> dict:
    if not path.exists():
        return {
            "schema_version": "0.1.0",
            "generated_at": datetime.now(timezone.utc).isoformat(),
            "output_root": str(path.parent),
            "artifacts": [],
        }
    return json.loads(path.read_text(encoding="utf-8"))


def write_json(path: Path, data: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(description="Save an HTML artifact into local artifact memory.")
    parser.add_argument("artifact", type=Path)
    parser.add_argument("--output-root", type=Path, default=Path.home() / ".claude/html-explainer/outputs")
    parser.add_argument("--title", required=True)
    parser.add_argument("--intent", required=True)
    parser.add_argument("--pattern", default="unknown")
    parser.add_argument("--validity", choices=sorted(VALIDITY), default="replaceable")
    parser.add_argument("--freshness-risk", choices=["low", "medium", "high"], default="medium")
    parser.add_argument("--privacy", choices=["local", "private", "shareable"], default="local")
    parser.add_argument("--project", default="")
    parser.add_argument("--summary", default="")
    parser.add_argument("--find-it-fast", required=True)
    parser.add_argument("--next-action", default="")
    parser.add_argument("--knowledge-type", default="")
    parser.add_argument("--topic", action="append", default=[])
    parser.add_argument("--alias", action="append", default=[])
    parser.add_argument("--recommended-action", default="")
    parser.add_argument("--confidence", choices=["low", "medium", "high", "unknown"], default="unknown")
    parser.add_argument("--no-rebuild", action="store_true")
    parser.add_argument("--score", type=int, default=None)
    parser.add_argument("--tag", action="append", default=[])
    args = parser.parse_args()

    if not args.artifact.is_file():
        raise SystemExit(f"Artifact not found: {args.artifact}")

    now = datetime.now(timezone.utc).replace(microsecond=0).isoformat()
    artifact_id = f"{slugify(args.title)}-{datetime.now(timezone.utc).strftime('%Y%m%d-%H%M%S')}"
    output_root = args.output_root.expanduser()
    artifact_rel = Path("artifacts") / args.validity / f"{artifact_id}.html"
    metadata_rel = Path("metadata") / args.validity / f"{artifact_id}.json"
    artifact_path = output_root / artifact_rel
    metadata_path = output_root / metadata_rel

    artifact_path.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(args.artifact, artifact_path)

    metadata = {
        "schema_version": "0.1.0",
        "id": artifact_id,
        "title": args.title,
        "created_at": now,
        "updated_at": now,
        "artifact_path": str(artifact_rel),
        "metadata_path": str(metadata_rel),
        "intent": args.intent,
        "pattern": args.pattern,
        "validity": args.validity,
        "freshness_risk": args.freshness_risk,
        "privacy": args.privacy,
        "project": args.project,
        "summary": args.summary,
        "find_it_fast": args.find_it_fast,
        "next_action": args.next_action,
        "knowledge_type": args.knowledge_type,
        "topics": args.topic or args.tag[:4],
        "aliases": args.alias,
        "recommended_action": args.recommended_action,
        "confidence": args.confidence,
        "resurface_count": 0,
        "last_resurfaced_at": "",
        "annotations_path": f"annotations/{artifact_id}.json",
        "score": args.score,
        "tags": args.tag,
    }
    write_json(metadata_path, metadata)
    write_json(output_root / "annotations" / f"{artifact_id}.json", {"artifact_id": artifact_id, "notes": [], "highlights": []})

    index_path = output_root / "index.json"
    index = read_index(index_path)
    index["generated_at"] = now
    index["output_root"] = str(output_root)
    index["artifacts"] = [item for item in index.get("artifacts", []) if item.get("id") != artifact_id]
    index["artifacts"].insert(
        0,
        {
            "id": artifact_id,
            "title": args.title,
            "created_at": now,
            "artifact_path": str(artifact_rel),
            "metadata_path": str(metadata_rel),
            "pattern": args.pattern,
            "validity": args.validity,
            "freshness_risk": args.freshness_risk,
            "privacy": args.privacy,
            "project": args.project,
            "summary": args.summary,
            "find_it_fast": args.find_it_fast,
            "knowledge_type": args.knowledge_type,
            "topics": args.topic or args.tag[:4],
            "aliases": args.alias,
            "recommended_action": args.recommended_action,
            "confidence": args.confidence,
            "tags": args.tag,
        },
    )
    write_json(index_path, index)

    if not args.no_rebuild:
        rebuild = Path(__file__).with_name("rebuild-knowledge-base.py")
        subprocess.run([sys.executable, str(rebuild), "--output-root", str(output_root)], check=True)

    print(f"saved: {artifact_path}")
    print(f"metadata: {metadata_path}")
    print(f"knowledge base: {output_root / 'index.html'}")
    print(f"find it fast: {args.find_it_fast}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
