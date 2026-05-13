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
  grep -Eqi 'primary intent|intent' "$file" || fail "$rel must expose the primary intent"
  grep -Eqi 'secondary intent|secondary|also needs|covered' "$file" || fail "$rel must expose obvious secondary intent coverage"
  grep -Eqi 'base concept|simple model|core idea|model' "$file" || fail "$rel must expose the base concept or simple model"
  grep -Eqi 'html advantage|browser advantage|html benefit' "$file" || fail "$rel must expose why HTML beats Markdown"
  grep -Eqi 'artifact budget|budget|compact|standard|interactive' "$file" || fail "$rel must expose artifact budget"
  grep -Eqi 'mental work|work removed|wall of text|markdown cost|html benefit' "$file" || fail "$rel must expose the mental work HTML removes"
  grep -Eqi 'evidence|inspected|sources' "$file" || fail "$rel must expose inspected evidence or sources"
  grep -Eqi 'decision|recommendation|next action|next safest action' "$file" || fail "$rel must expose a decision, recommendation, or next action"
  grep -Eqi 'risk|unknown|uncertainty|assumption|not verified' "$file" || fail "$rel must expose risk, uncertainty, assumptions, or unverified claims"
  grep -Eqi 'next prompt|ready-to-run|copy prompt|copy-ready|exportable prompt|next command' "$file" || fail "$rel must expose a next prompt or copy-ready next command"

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
done

echo "[validate-examples] OK: $example_count HTML examples validated"
