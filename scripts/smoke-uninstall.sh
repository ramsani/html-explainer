#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_HOME="$(mktemp -d)"

cleanup() {
  rm -rf "$TMP_HOME"
}
trap cleanup EXIT

fail() {
  echo "[smoke-uninstall] ERROR: $*" >&2
  exit 1
}

assert_absent() {
  local path="$1"
  [ ! -e "$path" ] || fail "path should have been removed: $path"
}

cd "$ROOT_DIR"

echo "[smoke-uninstall] Installing into temporary CLAUDE_HOME=$TMP_HOME"
CLAUDE_HOME="$TMP_HOME" INSTALL_UPSTREAM=0 FETCH_EXAMPLES=0 bash install.sh >/dev/null

[ -f "$TMP_HOME/skills/thariq-html-effectiveness/SKILL.md" ] || fail "install did not create skill"
[ -f "$TMP_HOME/commands/make-the-right-html.md" ] || fail "install did not create command"
[ -f "$TMP_HOME/CLAUDE.md" ] || fail "install did not create CLAUDE.md guide"

# No previous backup exists on first install, so uninstall should remove managed files.
echo "[smoke-uninstall] Removing installed files"
CLAUDE_HOME="$TMP_HOME" RESTORE_BACKUP=1 KEEP_BACKUPS=1 bash uninstall.sh >/dev/null

assert_absent "$TMP_HOME/skills/thariq-html-effectiveness"
assert_absent "$TMP_HOME/commands/pick-the-right-html.md"
assert_absent "$TMP_HOME/commands/make-the-right-html.md"
assert_absent "$TMP_HOME/commands/audit-html.md"
assert_absent "$TMP_HOME/html-explainer/docs"
assert_absent "$TMP_HOME/html-explainer/patterns"
assert_absent "$TMP_HOME/html-explainer/local-examples"
if grep -qF "<!-- html-explainer:start -->" "$TMP_HOME/CLAUDE.md" 2>/dev/null; then
  fail "CLAUDE.md guide block should have been removed"
fi

echo "[smoke-uninstall] OK: uninstall smoke test passed"
