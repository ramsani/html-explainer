#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXAMPLES_DIR="$ROOT_DIR/examples"

fail() {
  echo "[validate-examples] ERROR: $*" >&2
  exit 1
}

[ -d "$EXAMPLES_DIR" ] || fail "examples directory not found: $EXAMPLES_DIR"

example_count="$(find "$EXAMPLES_DIR" -maxdepth 1 -type f -name '*.html' | wc -l | tr -d ' ')"
[ "$example_count" -ge 3 ] || fail "expected at least 3 HTML examples, found $example_count"

for file in "$EXAMPLES_DIR"/*.html; do
  rel="${file#$ROOT_DIR/}"

  grep -qi '<!doctype html' "$file" || fail "$rel must be a full HTML document"
  grep -qi 'name="viewport"' "$file" || fail "$rel must include a responsive viewport"
  grep -Eqi 'what you need|primary intent|intent' "$file" || fail "$rel must expose what the user needs"
  grep -Eqi 'also handled|secondary intent|secondary|also needs|covered' "$file" || fail "$rel must expose obvious secondary needs"
  grep -Eqi 'simple idea|base concept|simple model|core idea|model' "$file" || fail "$rel must expose the simple idea or model"
  grep -Eqi 'why this helps|html advantage|browser advantage|html benefit' "$file" || fail "$rel must expose why the browser view helps"
  grep -Eqi 'artifact language|output language|user language|audience language' "$file" || fail "$rel must expose artifact language or audience language"
  grep -Eqi 'size|artifact budget|budget|compact|standard|interactive' "$file" || fail "$rel must expose artifact size"
  grep -Eqi 'work this saves|mental work|work removed|wall of text|markdown cost|html benefit' "$file" || fail "$rel must expose the work the artifact saves"
  grep -Eqi 'what i checked|evidence|inspected|sources' "$file" || fail "$rel must expose what was checked"
  grep -Eqi 'best next move|decision|recommendation|next action|next safest action' "$file" || fail "$rel must expose a decision or next action"
  grep -Eqi 'what could go wrong|what is still unclear|risk|unknown|uncertainty|assumption|not verified' "$file" || fail "$rel must expose risk, uncertainty, assumptions, or unverified claims"
  grep -Eqi 'continue from here|next prompt|ready-to-run|copy prompt|copy-ready|exportable prompt|next command' "$file" || fail "$rel must expose a next prompt or copy-ready next command"
  grep -Eqi 'save this|save decision|memory label|archive recommendation|memory decision|suggested validity|do-not-reuse|reusable memory' "$file" || fail "$rel must expose archive or memory decision"
  grep -Eqi 'saved for later|find it fast|not saved' "$file" || fail "$rel must expose a quiet memory access receipt"

  if ! grep -Eqi 'prefers-color-scheme' "$file"; then
    fail "$rel must support system light/dark mode"
  fi
  grep -q '@media(prefers-color-scheme:dark)' "$file" || fail "$rel must use a valid dark-mode media query"
  if grep -Eq '@media@media|\}\(prefers-color-scheme:dark\)|[;{]\(prefers-color-scheme:dark\)' "$file"; then
    fail "$rel has a malformed dark-mode media query"
  fi

  next_prompt_count="$(grep -o '<h2>Next prompt</h2>' "$file" 2>/dev/null | wc -l | tr -d ' ' || true)"
  [ "$next_prompt_count" -le 1 ] || fail "$rel must not duplicate the Next prompt section"

  if grep -Eqi 'tuner|editor|triage|feature flag|copy|export' "$file"; then
    grep -Eqi 'copy|export|textarea|download' "$file" || fail "$rel is editor-like and must include copy/export output"
  fi

  if grep -Eqi 'Inter,|#8b5cf6|#7c3aed|#a78bfa|#d946ef|gradient text' "$file"; then
    fail "$rel uses a generic visual-explainer anti-pattern"
  fi

  if grep -Eqi '<h[1-6][^>]*>(Primary intent|Secondary intents|Base concept|Artifact budget|HTML advantage|Evidence inspected|Fact sheet|Quality gate|Output contract|Failure mode|Scenario tests|Behavior dimensions|Intent distillation)</h[1-6]>' "$file"; then
    fail "$rel exposes internal process labels in visible headings"
  fi
done

echo "[validate-examples] OK: $example_count HTML examples validated"
