#!/usr/bin/env python3
"""Audit, optionally save, and approve an HTML artifact for delivery."""

from __future__ import annotations

import argparse
import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
AUDIT = ROOT / "scripts/audit-artifact.py"
SAVE = ROOT / "scripts/save-artifact.py"


def run_json(command: list[str]) -> dict:
    completed = subprocess.run(command, check=False, capture_output=True, text=True)
    if completed.returncode not in (0, 1):
        sys.stderr.write(completed.stderr)
        raise SystemExit(completed.returncode)
    return json.loads(completed.stdout)


def main() -> int:
    parser = argparse.ArgumentParser(description="Approve an HTML artifact only after the quality gate passes.")
    parser.add_argument("artifact", type=Path)
    parser.add_argument("--min-score", type=int, default=90)
    parser.add_argument("--save", action="store_true")
    parser.add_argument("--output-root", type=Path, default=Path.home() / ".claude/html-explainer/outputs")
    parser.add_argument("--title", default="")
    parser.add_argument("--intent", default="")
    parser.add_argument("--pattern", default="unknown")
    parser.add_argument("--validity", choices=["temporal", "replaceable", "evergreen", "superseded", "private", "do-not-reuse"], default="replaceable")
    parser.add_argument("--freshness-risk", choices=["low", "medium", "high"], default="medium")
    parser.add_argument("--privacy", choices=["local", "private", "shareable"], default="local")
    parser.add_argument("--project", default="")
    parser.add_argument("--summary", default="")
    parser.add_argument("--find-it-fast", default="")
    parser.add_argument("--next-action", default="")
    parser.add_argument("--knowledge-type", default="")
    parser.add_argument("--topic", action="append", default=[])
    parser.add_argument("--alias", action="append", default=[])
    parser.add_argument("--recommended-action", default="")
    parser.add_argument("--confidence", choices=["low", "medium", "high", "unknown"], default="unknown")
    parser.add_argument("--tag", action="append", default=[])
    args = parser.parse_args()

    result = run_json([sys.executable, str(AUDIT), str(args.artifact), "--min-score", str(args.min_score), "--json"])
    score = result["score"]
    hard_fails = result["hard_fails"]
    missing = [check["id"] for check in result["checks"] if not check["passed"]]

    if hard_fails or score < args.min_score:
        print(f"blocked: {score}/100 {args.artifact}")
        if hard_fails:
            for fail in hard_fails:
                print(f"hard fail: {fail['message']}")
        if missing:
            print(f"missing: {', '.join(missing)}")
        print("next: revise the artifact, then run deliver-artifact.py again")
        return 1

    print(f"approved: {score}/100 {args.artifact}")

    if args.save:
        required = {
            "--title": args.title,
            "--intent": args.intent,
            "--find-it-fast": args.find_it_fast,
        }
        missing_required = [name for name, value in required.items() if not value]
        if missing_required:
            print(f"save blocked: missing {', '.join(missing_required)}")
            return 1
        save_command = [
            sys.executable,
            str(SAVE),
            str(args.artifact),
            "--output-root",
            str(args.output_root),
            "--title",
            args.title,
            "--intent",
            args.intent,
            "--pattern",
            args.pattern,
            "--validity",
            args.validity,
            "--freshness-risk",
            args.freshness_risk,
            "--privacy",
            args.privacy,
            "--find-it-fast",
            args.find_it_fast,
            "--score",
            str(score),
        ]
        if args.project:
            save_command.extend(["--project", args.project])
        if args.summary:
            save_command.extend(["--summary", args.summary])
        if args.next_action:
            save_command.extend(["--next-action", args.next_action])
        if args.knowledge_type:
            save_command.extend(["--knowledge-type", args.knowledge_type])
        if args.recommended_action:
            save_command.extend(["--recommended-action", args.recommended_action])
        if args.confidence:
            save_command.extend(["--confidence", args.confidence])
        for topic in args.topic:
            save_command.extend(["--topic", topic])
        for alias in args.alias:
            save_command.extend(["--alias", alias])
        for tag in args.tag:
            save_command.extend(["--tag", tag])
        completed = subprocess.run(save_command, check=False, text=True)
        if completed.returncode != 0:
            return completed.returncode

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
