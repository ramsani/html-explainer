#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PATTERN_DIR="$ROOT_DIR/patterns"
EXPECTED_COUNT=20

required_sections=(
  "Intent"
  "Use"
  "Evidence required"
  "Prompt template"
  "HTML structure"
  "Quality checklist"
  "Failure modes"
  "Acceptance criteria"
)

fail() {
  echo "[validate-patterns] ERROR: $*" >&2
  exit 1
}

[ -d "$PATTERN_DIR" ] || fail "patterns directory not found: $PATTERN_DIR"

count="$(find "$PATTERN_DIR" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')"
[ "$count" = "$EXPECTED_COUNT" ] || fail "expected $EXPECTED_COUNT pattern files, found $count"

for n in $(seq -w 1 20); do
  matches=("$PATTERN_DIR/$n-"*.md)
  [ -f "${matches[0]}" ] || fail "missing pattern file for number $n"
  [ "${#matches[@]}" -eq 1 ] || fail "expected exactly one pattern file for number $n, found ${#matches[@]}"
done

for file in "$PATTERN_DIR"/*.md; do
  for section in "${required_sections[@]}"; do
    if ! grep -Eiq "(^|[#[:space:]-])${section}(:|$|[[:space:]])" "$file"; then
      fail "missing required section '$section' in ${file#$ROOT_DIR/}"
    fi
  done

  if ! grep -Eq '^# [0-9]{2} .+' "$file"; then
    fail "pattern title must start with '# NN — ...' or '# NN - ...': ${file#$ROOT_DIR/}"
  fi

  if ! grep -q '```text' "$file"; then
    fail "pattern must include a text prompt template code fence: ${file#$ROOT_DIR/}"
  fi

done

echo "[validate-patterns] OK: $count pattern files validated"
