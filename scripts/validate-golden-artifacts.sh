#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
AUDIT="$ROOT_DIR/scripts/audit-artifact.py"
GOOD_DIR="$ROOT_DIR/tests/artifacts/good"
BAD_DIR="$ROOT_DIR/tests/artifacts/bad"

fail() {
  echo "[validate-golden-artifacts] ERROR: $*" >&2
  exit 1
}

[ -x "$AUDIT" ] || fail "missing executable auditor: scripts/audit-artifact.py"
[ -d "$GOOD_DIR" ] || fail "missing good artifact fixtures"
[ -d "$BAD_DIR" ] || fail "missing bad artifact fixtures"

good_count="$(find "$GOOD_DIR" -type f -name '*.html' | wc -l | tr -d ' ')"
bad_count="$(find "$BAD_DIR" -type f -name '*.html' | wc -l | tr -d ' ')"
[ "$good_count" -ge 3 ] || fail "expected at least 3 good fixtures, found $good_count"
[ "$bad_count" -ge 3 ] || fail "expected at least 3 bad fixtures, found $bad_count"

for file in "$GOOD_DIR"/*.html; do
  "$AUDIT" "$file" --min-score 90 >/dev/null || fail "good fixture did not pass at 90+: ${file#$ROOT_DIR/}"
done

for file in "$BAD_DIR"/*.html; do
  if "$AUDIT" "$file" --min-score 75 >/dev/null 2>&1; then
    fail "bad fixture unexpectedly passed: ${file#$ROOT_DIR/}"
  fi
done

echo "[validate-golden-artifacts] OK: $good_count good and $bad_count bad fixtures validated"
