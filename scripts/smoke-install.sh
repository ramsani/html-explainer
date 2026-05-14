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

assert_contains() {
  local path="$1"
  local text="$2"
  grep -qF "$text" "$path" || fail "missing expected text in $path: $text"
}

cd "$ROOT_DIR"

echo "[smoke-install] Using temporary CLAUDE_HOME=$TMP_HOME"
CLAUDE_HOME="$TMP_HOME" INSTALL_UPSTREAM=0 FETCH_EXAMPLES=0 bash install.sh

assert_file "$TMP_HOME/skills/thariq-html-effectiveness/SKILL.md"
assert_file "$TMP_HOME/commands/pick-the-right-html.md"
assert_file "$TMP_HOME/commands/make-the-right-html.md"
assert_file "$TMP_HOME/commands/check-the-plan.md"
assert_file "$TMP_HOME/commands/check-the-diff.md"
assert_file "$TMP_HOME/commands/reenter-project.md"
assert_file "$TMP_HOME/commands/build-decision-tool.md"
assert_file "$TMP_HOME/commands/audit-html.md"
assert_file "$TMP_HOME/commands/think-with-me-about.md"
assert_file "$TMP_HOME/commands/open-html-explainer-memory.md"
assert_file "$TMP_HOME/CLAUDE.md"
assert_contains "$TMP_HOME/CLAUDE.md" "<!-- html-explainer:start -->"
assert_contains "$TMP_HOME/CLAUDE.md" "intent -> evidence -> visual understanding -> decision -> next action -> reusable memory"
assert_contains "$TMP_HOME/CLAUDE.md" "Respond to the user in the language they use"
assert_contains "$TMP_HOME/CLAUDE.md" "deliver-artifact.py"

assert_dir "$TMP_HOME/html-explainer/docs"
assert_dir "$TMP_HOME/html-explainer/patterns"
assert_dir "$TMP_HOME/html-explainer/scripts"
assert_dir "$TMP_HOME/html-explainer/local-examples"

assert_file "$TMP_HOME/html-explainer/docs/DECISION_GATE.md"
assert_file "$TMP_HOME/html-explainer/docs/PATTERN_GUIDE.md"
assert_file "$TMP_HOME/html-explainer/docs/QUALITY_BAR.md"
assert_file "$TMP_HOME/html-explainer/docs/STYLE.md"
assert_file "$TMP_HOME/html-explainer/docs/FACT_SHEET.md"
assert_file "$TMP_HOME/html-explainer/docs/CHAIN.md"
assert_file "$TMP_HOME/html-explainer/docs/DELIVERY.md"
assert_file "$TMP_HOME/html-explainer/docs/HUMAN_INTERFACE.md"
assert_file "$TMP_HOME/html-explainer/docs/INVISIBLE_QUALITY.md"
assert_file "$TMP_HOME/html-explainer/docs/LANGUAGE_POLICY.md"
assert_file "$TMP_HOME/html-explainer/docs/USER_VALUE.md"
assert_file "$TMP_HOME/html-explainer/docs/USER_FACING_COPY.md"
assert_file "$TMP_HOME/html-explainer/docs/MEMORY_ACCESS.md"
assert_file "$TMP_HOME/html-explainer/docs/QUALITY_CLAIMS.md"
assert_file "$TMP_HOME/html-explainer/docs/DOCS_MAP.md"
assert_file "$TMP_HOME/html-explainer/docs/INSIGHT_SURFACE_LOOP.md"
assert_file "$TMP_HOME/html-explainer/docs/V1_FUNCTION_AUDIT.md"
assert_file "$TMP_HOME/html-explainer/scripts/audit-artifact.py"
assert_file "$TMP_HOME/html-explainer/scripts/deliver-artifact.py"
assert_file "$TMP_HOME/html-explainer/scripts/rebuild-knowledge-base.py"
assert_file "$TMP_HOME/html-explainer/scripts/save-artifact.py"
assert_file "$TMP_HOME/html-explainer/docs/reference/INTENT_DISTILLATION.md"
assert_file "$TMP_HOME/html-explainer/patterns/01-code-approach-comparison.md"
assert_file "$TMP_HOME/html-explainer/patterns/20-prompt-agent-behavior-tuner.md"
assert_file "$TMP_HOME/html-explainer/patterns/21-visual-direction-explorer.md"
assert_file "$TMP_HOME/html-explainer/patterns/22-insight-surface-loop.md"
assert_file "$TMP_HOME/html-explainer/local-examples/plan-review-minimal.example.html"
assert_file "$TMP_HOME/html-explainer/local-examples/before-after-decision.example.html"
assert_file "$TMP_HOME/html-explainer/local-examples/diff-review-minimal.example.html"
assert_file "$TMP_HOME/html-explainer/local-examples/prompt-tuner-minimal.example.html"
assert_file "$TMP_HOME/html-explainer/local-examples/think-with-me-about.example.html"
assert_file "$TMP_HOME/html-explainer/local-examples/README.md"

pattern_count="$(find "$TMP_HOME/html-explainer/patterns" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')"
[ "$pattern_count" = "22" ] || fail "expected 22 installed pattern files, found $pattern_count"

echo "[smoke-install] OK: installer smoke test passed"
