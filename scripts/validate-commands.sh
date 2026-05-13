#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMMAND_DIR="$ROOT_DIR/commands"

expected=(
  pick-the-right-html
  make-the-right-html
  check-the-plan
  check-the-diff
  reenter-project
  build-decision-tool
  audit-html
  think-with-me-about
)

legacy=(
  html-effectiveness
  html-pattern-select
  html-plan-review-plus
  html-diff-review-plus
  html-project-recap-plus
  html-custom-editor-plus
  html-audit-artifact
)

fail() {
  echo "[validate-commands] ERROR: $*" >&2
  exit 1
}

[ -d "$COMMAND_DIR" ] || fail "commands directory not found: $COMMAND_DIR"

count="$(find "$COMMAND_DIR" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')"
[ "$count" = "${#expected[@]}" ] || fail "expected ${#expected[@]} command files, found $count"

for cmd in "${expected[@]}"; do
  file="$COMMAND_DIR/$cmd.md"
  [ -f "$file" ] || fail "missing command file: commands/$cmd.md"
  grep -q "^# /$cmd$" "$file" || fail "command heading mismatch in commands/$cmd.md"
  grep -q "docs/DECISION_GATE.md" "$file" || fail "command must use consolidated decision gate: commands/$cmd.md"
  grep -q "docs/LANGUAGE_POLICY.md" "$file" || fail "command must use language policy: commands/$cmd.md"
  grep -q "docs/QUALITY_BAR.md" "$file" || fail "command must use quality bar: commands/$cmd.md"
  grep -Eqi "archive recommendation|save, refresh|saved, refreshed|memory" "$file" || fail "command must include archive or memory guidance: commands/$cmd.md"
done

for cmd in "${legacy[@]}"; do
  [ ! -f "$COMMAND_DIR/$cmd.md" ] || fail "legacy command file still present: commands/$cmd.md"
done

echo "[validate-commands] OK: $count intent-first command files validated"
