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
  grep -Eqi 'artifact budget|budget|compact|standard|interactive' "$file" || fail "$rel must expose artifact budget"
  grep -Eqi 'mental work|work removed|wall of text|markdown cost|html benefit' "$file" || fail "$rel must expose the mental work HTML removes"
  grep -Eqi 'evidence|inspected|sources' "$file" || fail "$rel must expose inspected evidence or sources"
  grep -Eqi 'decision|recommendation|next action|next safest action' "$file" || fail "$rel must expose a decision, recommendation, or next action"
  grep -Eqi 'risk|unknown|uncertainty|assumption|not verified' "$file" || fail "$rel must expose risk, uncertainty, assumptions, or unverified claims"

  if grep -Eqi 'tuner|editor|triage|feature flag|copy|export' "$file"; then
    grep -Eqi 'copy|export|textarea|download' "$file" || fail "$rel is editor-like and must include copy/export output"
  fi

  if grep -Eqi 'Inter,|#8b5cf6|#7c3aed|#a78bfa|#d946ef|gradient text' "$file"; then
    fail "$rel uses a generic visual-explainer anti-pattern"
  fi
done

echo "[validate-examples] OK: $example_count HTML examples validated"
