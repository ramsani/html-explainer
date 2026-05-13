#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCENARIO_FILE="$ROOT_DIR/tests/scenarios/pattern-routing.json"

fail() {
  echo "[validate-scenarios] ERROR: $*" >&2
  exit 1
}

[ -f "$SCENARIO_FILE" ] || fail "missing tests/scenarios/pattern-routing.json"

python3 - "$SCENARIO_FILE" <<'PY'
import json
import sys

path = sys.argv[1]
with open(path, "r", encoding="utf-8") as f:
    scenarios = json.load(f)

required = {
    "id",
    "category",
    "prompt",
    "expected_pattern",
    "acceptable_alternates",
    "expected_budget",
    "should_generate_html",
    "required_evidence",
    "reason",
}

if not isinstance(scenarios, list):
    raise SystemExit("scenario file must contain a list")
if len(scenarios) < 8:
    raise SystemExit(f"expected at least 8 scenarios, found {len(scenarios)}")

ids = set()
categories = set()
negative_count = 0
ambiguous_count = 0
valid_budgets = {"none", "compact", "standard", "interactive"}

for index, scenario in enumerate(scenarios, start=1):
    if not isinstance(scenario, dict):
        raise SystemExit(f"scenario {index} must be an object")
    missing = sorted(required - scenario.keys())
    if missing:
        raise SystemExit(f"scenario {index} missing fields: {', '.join(missing)}")
    sid = scenario["id"]
    if sid in ids:
        raise SystemExit(f"duplicate scenario id: {sid}")
    ids.add(sid)
    categories.add(scenario["category"])
    if scenario["expected_budget"] not in valid_budgets:
        raise SystemExit(f"{sid} has invalid expected_budget: {scenario['expected_budget']}")
    if not isinstance(scenario["acceptable_alternates"], list):
        raise SystemExit(f"{sid} acceptable_alternates must be a list")
    if not isinstance(scenario["required_evidence"], list):
        raise SystemExit(f"{sid} required_evidence must be a list")
    if not isinstance(scenario["should_generate_html"], bool):
        raise SystemExit(f"{sid} should_generate_html must be true or false")
    if scenario["should_generate_html"] and scenario["expected_pattern"] == "none":
        raise SystemExit(f"{sid} generates HTML but has no expected pattern")
    if not scenario["should_generate_html"]:
        negative_count += 1
    if scenario["acceptable_alternates"]:
        ambiguous_count += 1
    for text_field in ("prompt", "reason", "expected_pattern", "expected_budget"):
        if not str(scenario[text_field]).strip():
            raise SystemExit(f"{sid} has empty {text_field}")

if negative_count < 1:
    raise SystemExit("expected at least one negative no-HTML scenario")
if ambiguous_count < 1:
    raise SystemExit("expected at least one scenario with acceptable alternates")

print(f"[validate-scenarios] OK: {len(scenarios)} scenarios across {len(categories)} categories")
PY
