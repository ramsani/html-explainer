#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d)"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

fail() {
  echo "[smoke-artifact-memory] ERROR: $*" >&2
  exit 1
}

cd "$ROOT_DIR"

ARTIFACT="tests/artifacts/good/decision-ready.html"
OUTPUT_ROOT="$TMP_DIR/outputs"

python3 scripts/audit-artifact.py "$ARTIFACT" --min-score 90 >/dev/null || fail "audit did not approve fixture"

python3 scripts/deliver-artifact.py "$ARTIFACT" \
  --min-score 90 \
  --save \
  --output-root "$OUTPUT_ROOT" \
  --title "Artifact Memory Smoke" \
  --intent "Verify artifact memory end to end" \
  --pattern "16-audit-report" \
  --validity "replaceable" \
  --freshness-risk "medium" \
  --privacy "local" \
  --project "html-explainer" \
  --summary "End-to-end memory smoke fixture." \
  --find-it-fast "ask for artifact memory smoke" \
  --next-action "Use this fixture to verify the local memory path." \
  --knowledge-type "review" \
  --topic "artifact memory" \
  --recommended-action "inspect" \
  --confidence "high" \
  --tag smoke >/dev/null || fail "deliver-and-save failed"

python3 scripts/rebuild-knowledge-base.py --output-root "$OUTPUT_ROOT" >/dev/null || fail "knowledge base rebuild failed"

[ -f "$OUTPUT_ROOT/index.json" ] || fail "missing outputs/index.json"
[ -f "$OUTPUT_ROOT/index.html" ] || fail "missing outputs/index.html"
find "$OUTPUT_ROOT/artifacts" -type f -name '*.html' | grep -q . || fail "missing saved artifact"
find "$OUTPUT_ROOT/metadata" -type f -name '*.json' | grep -q . || fail "missing metadata"
find "$OUTPUT_ROOT/annotations" -type f -name '*.json' | grep -q . || fail "missing annotations"
grep -q "Artifact Memory Smoke" "$OUTPUT_ROOT/index.json" || fail "index missing saved artifact"
grep -q "Tu conocimiento útil" "$OUTPUT_ROOT/index.html" || fail "knowledge base HTML missing title"

echo "[smoke-artifact-memory] OK: artifact memory flow validated"
