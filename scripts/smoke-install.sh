#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_HOME="$(mktemp -d)"

cleanup() {
  rm -rf "$TMP_HOME"
}
trap cleanup EXIT

fail() {
  echo "[smoke-install] ERROR: $*" >&2
  exit 1
}

assert_file() {
  local path="$1"
  [ -f "$path" ] || fail "missing file: $path"
}

assert_dir() {
  local path="$1"
  [ -d "$path" ] || fail "missing directory: $path"
}

cd "$ROOT_DIR"

echo "[smoke-install] Using temporary CLAUDE_HOME=$TMP_HOME"
CLAUDE_HOME="$TMP_HOME" INSTALL_UPSTREAM=0 FETCH_EXAMPLES=0 bash install.sh

assert_file "$TMP_HOME/skills/thariq-html-effectiveness/SKILL.md"
assert_file "$TMP_HOME/commands/html-effectiveness.md"
assert_file "$TMP_HOME/commands/html-pattern-select.md"
assert_file "$TMP_HOME/commands/html-plan-review-plus.md"
assert_file "$TMP_HOME/commands/html-diff-review-plus.md"
assert_file "$TMP_HOME/commands/html-project-recap-plus.md"
assert_file "$TMP_HOME/commands/html-custom-editor-plus.md"
assert_file "$TMP_HOME/commands/html-audit-artifact.md"

assert_dir "$TMP_HOME/html-explainer/docs"
assert_dir "$TMP_HOME/html-explainer/patterns"
assert_dir "$TMP_HOME/html-explainer/local-examples"

assert_file "$TMP_HOME/html-explainer/docs/pattern-router.md"
assert_file "$TMP_HOME/html-explainer/docs/QUALITY_BAR.md"
assert_file "$TMP_HOME/html-explainer/docs/HTML_UX_STANDARD.md"
assert_file "$TMP_HOME/html-explainer/docs/fact-sheet-protocol.md"
assert_file "$TMP_HOME/html-explainer/patterns/01-code-approach-comparison.md"
assert_file "$TMP_HOME/html-explainer/patterns/20-prompt-agent-behavior-tuner.md"
assert_file "$TMP_HOME/html-explainer/local-examples/plan-review-minimal.example.html"
assert_file "$TMP_HOME/html-explainer/local-examples/diff-review-minimal.example.html"
assert_file "$TMP_HOME/html-explainer/local-examples/prompt-tuner-minimal.example.html"

pattern_count="$(find "$TMP_HOME/html-explainer/patterns" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')"
[ "$pattern_count" = "20" ] || fail "expected 20 installed pattern files, found $pattern_count"

echo "[smoke-install] OK: installer smoke test passed"
