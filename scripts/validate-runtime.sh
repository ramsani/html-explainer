#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d)"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

fail() {
  echo "[validate-runtime] ERROR: $*" >&2
  exit 1
}

cd "$ROOT_DIR"

python3 scripts/deliver-artifact.py tests/artifacts/good/decision-ready.html --min-score 90 >/dev/null || fail "good artifact should be approved"

if python3 scripts/deliver-artifact.py tests/artifacts/bad/keyword-stuffed.html --min-score 90 >/dev/null 2>&1; then
  fail "keyword-stuffed artifact should be blocked"
fi

python3 scripts/deliver-artifact.py tests/artifacts/good/decision-ready.html \
  --min-score 90 \
  --save \
  --output-root "$TMP_DIR/outputs" \
  --title "Decision Ready Fixture" \
  --intent "Verify runtime delivery path" \
  --pattern "16-audit-report" \
  --validity "replaceable" \
  --find-it-fast "ask for the decision ready fixture" \
  --tag runtime >/dev/null || fail "deliver-and-save should pass"

[ -f "$TMP_DIR/outputs/index.json" ] || fail "missing local memory index"
[ -f "$TMP_DIR/outputs/index.html" ] || fail "missing local knowledge base HTML"
find "$TMP_DIR/outputs/artifacts/replaceable" -type f -name '*.html' | grep -q . || fail "missing saved artifact"
find "$TMP_DIR/outputs/metadata/replaceable" -type f -name '*.json' | grep -q . || fail "missing saved metadata"
grep -q "Tu conocimiento útil" "$TMP_DIR/outputs/index.html" || fail "knowledge base HTML missing user-facing title"
grep -q "Maps of Content" "$TMP_DIR/outputs/index.html" || fail "knowledge base HTML missing MOC section"
grep -q "resurfacing" "$TMP_DIR/outputs/index.html" || fail "knowledge base HTML missing resurfacing signal"

echo "[validate-runtime] OK: runtime delivery and local memory validated"
