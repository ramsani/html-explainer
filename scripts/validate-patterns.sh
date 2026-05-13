#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PATTERN_DIR="$ROOT_DIR/patterns"
EXPECTED_COUNT=22

required_sections=(
  "Intent"
  "Use"
  "Evidence required"
  "Prompt template"
  "HTML structure"
  "Quality checklist"
  "Failure modes"
  "Tie-breakers"
  "Acceptance criteria"
  "Human interface contract"
  "Visual explainer contract"
)

fail() {
  echo "[validate-patterns] ERROR: $*" >&2
  exit 1
}

section_word_count() {
  local section="$1"
  local file="$2"
  awk -v section="$section" '
    BEGIN { in_section = 0 }
    {
      line = tolower($0)
      target = tolower(section)
      if (line ~ "^#+[[:space:]]*" target || line ~ "^" target ":") {
        in_section = 1
        sub(/^[^:]*:/, "", $0)
        print
        next
      }
      if (in_section && line ~ "^#+[[:space:]]+") {
        exit
      }
      if (in_section) {
        print
      }
    }
  ' "$file" | wc -w | tr -d ' '
}

[ -d "$PATTERN_DIR" ] || fail "patterns directory not found: $PATTERN_DIR"

count="$(find "$PATTERN_DIR" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')"
[ "$count" = "$EXPECTED_COUNT" ] || fail "expected $EXPECTED_COUNT pattern files, found $count"

for n in $(seq -w 1 "$EXPECTED_COUNT"); do
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

  quality_words="$(section_word_count "Quality checklist" "$file")"
  failure_words="$(section_word_count "Failure modes" "$file")"
  tie_words="$(section_word_count "Tie-breakers" "$file")"
  human_words="$(section_word_count "Human interface contract" "$file")"

  [ "$quality_words" -ge 14 ] || fail "quality checklist is too thin in ${file#$ROOT_DIR/}"
  [ "$failure_words" -ge 12 ] || fail "failure modes are too thin in ${file#$ROOT_DIR/}"
  [ "$tie_words" -ge 10 ] || fail "tie-breakers are missing or too thin in ${file#$ROOT_DIR/}"
  [ "$human_words" -ge 18 ] || fail "human interface contract is too thin in ${file#$ROOT_DIR/}"
done

echo "[validate-patterns] OK: $count pattern files validated"
