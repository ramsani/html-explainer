#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GOALS_DIR="$ROOT_DIR/goals"

expected=(
  artifact-ready.goal.md
  plan-review-complete.goal.md
  diff-review-complete.goal.md
  memory-ready.goal.md
  docs-coherent.goal.md
  repo-v1-complete.goal.md
  pattern-package-complete.goal.md
)

fail() {
  echo "[validate-goals] ERROR: $*" >&2
  exit 1
}

[ -d "$GOALS_DIR" ] || fail "missing goals directory"

count="$(find "$GOALS_DIR" -maxdepth 1 -type f -name '*.goal.md' | wc -l | tr -d ' ')"
[ "$count" = "${#expected[@]}" ] || fail "expected ${#expected[@]} goal contracts, found $count"

for file_name in "${expected[@]}"; do
  file="$GOALS_DIR/$file_name"
  [ -f "$file" ] || fail "missing goal contract: goals/$file_name"
  grep -q '^# ' "$file" || fail "goal contract needs heading: goals/$file_name"
  grep -q '/goal ' "$file" || fail "goal contract must include copy-ready /goal: goals/$file_name"
  grep -Eqi 'do not finish|when ' "$file" || fail "goal contract must define completion boundary: goals/$file_name"
done

echo "[validate-goals] OK: $count goal contracts validated"
