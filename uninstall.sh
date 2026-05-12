#!/usr/bin/env bash
set -euo pipefail

CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"
KEEP_BACKUPS="${KEEP_BACKUPS:-1}"
RESTORE_BACKUP="${RESTORE_BACKUP:-1}"
DRY_RUN="${DRY_RUN:-0}"
BACKUPS_DIR="$CLAUDE_HOME/html-explainer/backups"
COMMANDS=(
  pick-the-right-html
  make-the-right-html
  check-the-plan
  check-the-diff
  reenter-project
  build-decision-tool
  audit-html
)
LEGACY_COMMANDS=(
  html-effectiveness
  html-pattern-select
  html-plan-review-plus
  html-diff-review-plus
  html-project-recap-plus
  html-custom-editor-plus
  html-audit-artifact
)

say() { printf '\n[html-explainer uninstall] %s\n' "$1"; }
run() {
  if [ "$DRY_RUN" = "1" ]; then
    printf '[dry-run] %s\n' "$*"
  else
    "$@"
  fi
}

latest_backup() {
  if [ -d "$BACKUPS_DIR" ]; then
    find "$BACKUPS_DIR" -mindepth 1 -maxdepth 1 -type d | sort | tail -n 1
  fi
}

restore_path() {
  local backup="$1"
  local rel="$2"
  local dst="$3"
  local src="$backup/$rel"
  if [ -e "$src" ]; then
    say "Restoring $dst from backup"
    run rm -rf "$dst"
    run mkdir -p "$(dirname "$dst")"
    run cp -R "$src" "$dst"
  fi
}

remove_path() {
  local path="$1"
  if [ -e "$path" ]; then
    say "Removing $path"
    run rm -rf "$path"
  fi
}

say "Using CLAUDE_HOME=$CLAUDE_HOME"

BACKUP="$(latest_backup || true)"

if [ "$RESTORE_BACKUP" = "1" ] && [ -n "${BACKUP:-}" ]; then
  say "Latest backup found: $BACKUP"
  restore_path "$BACKUP" "skills/thariq-html-effectiveness" "$CLAUDE_HOME/skills/thariq-html-effectiveness"
  restore_path "$BACKUP" "skills/visual-explainer" "$CLAUDE_HOME/skills/visual-explainer"
  restore_path "$BACKUP" "docs" "$CLAUDE_HOME/html-explainer/docs"
  restore_path "$BACKUP" "patterns" "$CLAUDE_HOME/html-explainer/patterns"
  restore_path "$BACKUP" "local-examples" "$CLAUDE_HOME/html-explainer/local-examples"

  for cmd in "${COMMANDS[@]}"; do
    restore_path "$BACKUP" "commands/$cmd.md" "$CLAUDE_HOME/commands/$cmd.md"
  done
  for cmd in "${LEGACY_COMMANDS[@]}"; do
    restore_path "$BACKUP" "commands/legacy/$cmd.md" "$CLAUDE_HOME/commands/$cmd.md"
  done
else
  if [ "$RESTORE_BACKUP" = "1" ]; then
    say "No backup found. Removing html-explainer installed files."
  else
    say "Skipping backup restore because RESTORE_BACKUP=0"
  fi

  remove_path "$CLAUDE_HOME/skills/thariq-html-effectiveness"
  remove_path "$CLAUDE_HOME/html-explainer/docs"
  remove_path "$CLAUDE_HOME/html-explainer/patterns"
  remove_path "$CLAUDE_HOME/html-explainer/local-examples"

  for cmd in "${COMMANDS[@]}" "${LEGACY_COMMANDS[@]}"; do
    remove_path "$CLAUDE_HOME/commands/$cmd.md"
  done
fi

if [ "$KEEP_BACKUPS" = "0" ]; then
  remove_path "$BACKUPS_DIR"
else
  say "Keeping backups under $BACKUPS_DIR"
fi

# Remove empty html-explainer directory if possible, but keep if backups or examples remain.
if [ "$DRY_RUN" = "0" ] && [ -d "$CLAUDE_HOME/html-explainer" ]; then
  rmdir "$CLAUDE_HOME/html-explainer" 2>/dev/null || true
fi

say "Uninstall complete. Restart Claude Code if it was open."
