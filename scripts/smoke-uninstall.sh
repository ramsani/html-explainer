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
assert_absent "$TMP_HOME/commands/open-html-explainer-memory.md"
assert_absent "$TMP_HOME/html-explainer/docs"
assert_absent "$TMP_HOME/html-explainer/patterns"
assert_absent "$TMP_HOME/html-explainer/scripts"
assert_absent "$TMP_HOME/html-explainer/local-examples"
if grep -qF "<!-- html-explainer:start -->" "$TMP_HOME/CLAUDE.md" 2>/dev/null; then
  fail "CLAUDE.md guide block should have been removed"
fi

# Existing installs should restore old files and remove newly added managed files
# that were not present in the backup.
rm -rf "$TMP_HOME"
mkdir -p "$TMP_HOME/commands" "$TMP_HOME/html-explainer/scripts"
printf '# /make-the-right-html\nold command\n' > "$TMP_HOME/commands/make-the-right-html.md"
printf 'old script\n' > "$TMP_HOME/html-explainer/scripts/old-helper.py"

echo "[smoke-uninstall] Restoring previous install state"
CLAUDE_HOME="$TMP_HOME" INSTALL_UPSTREAM=0 FETCH_EXAMPLES=0 bash install.sh >/dev/null
CLAUDE_HOME="$TMP_HOME" RESTORE_BACKUP=1 KEEP_BACKUPS=1 bash uninstall.sh >/dev/null

grep -q "old command" "$TMP_HOME/commands/make-the-right-html.md" || fail "previous command was not restored"
grep -q "old script" "$TMP_HOME/html-explainer/scripts/old-helper.py" || fail "previous scripts directory was not restored"
assert_absent "$TMP_HOME/commands/open-html-explainer-memory.md"

echo "[smoke-uninstall] OK: uninstall smoke test passed"
