#!/usr/bin/env bash
set -euo pipefail

CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"
KEEP_BACKUPS="${KEEP_BACKUPS:-1}"
RESTORE_BACKUP="${RESTORE_BACKUP:-1}"
DRY_RUN="${DRY_RUN:-0}"
BACKUPS_DIR="$CLAUDE_HOME/html-explainer/backups"
CLAUDE_MD_FILE="$CLAUDE_HOME/CLAUDE.md"
HTML_EXPLAINER_BLOCK_START="<!-- html-explainer:start -->"
HTML_EXPLAINER_BLOCK_END="<!-- html-explainer:end -->"
COMMANDS=(
  pick-the-right-html
  make-the-right-html
  check-the-plan
  check-the-diff
  reenter-project
  build-decision-tool
  audit-html
  think-with-me-about
  open-html-explainer-memory
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
  else
    remove_path "$dst"
  fi
}

remove_path() {
  local path="$1"
  if [ -e "$path" ]; then
    say "Removing $path"
    run rm -rf "$path"
  fi
}

remove_claude_md_guide() {
  local tmp_file
  tmp_file="$(mktemp)"

  if [ ! -f "$CLAUDE_MD_FILE" ]; then
    rm -f "$tmp_file"
    return
  fi

  if ! grep -qF "$HTML_EXPLAINER_BLOCK_START" "$CLAUDE_MD_FILE"; then
    rm -f "$tmp_file"
    return
  fi

  if ! grep -qF "$HTML_EXPLAINER_BLOCK_END" "$CLAUDE_MD_FILE"; then
    rm -f "$tmp_file"
    say "Skipping CLAUDE.md guide removal: start marker exists but end marker is missing."
    return
  fi

  say "Removing managed html-explainer guide from $CLAUDE_MD_FILE"
  if [ "$DRY_RUN" = "1" ]; then
    printf '[dry-run] remove managed html-explainer block from %s\n' "$CLAUDE_MD_FILE"
    rm -f "$tmp_file"
    return
  fi

  awk -v start="$HTML_EXPLAINER_BLOCK_START" -v end="$HTML_EXPLAINER_BLOCK_END" '
    index($0, start) { in_block = 1; next }
    index($0, end) { in_block = 0; next }
    !in_block { print }
  ' "$CLAUDE_MD_FILE" > "$tmp_file"
  mv "$tmp_file" "$CLAUDE_MD_FILE"
}

say "Using CLAUDE_HOME=$CLAUDE_HOME"

BACKUP="$(latest_backup || true)"

if [ "$RESTORE_BACKUP" = "1" ] && [ -n "${BACKUP:-}" ]; then
  say "Latest backup found: $BACKUP"
  restore_path "$BACKUP" "skills/thariq-html-effectiveness" "$CLAUDE_HOME/skills/thariq-html-effectiveness"
  restore_path "$BACKUP" "skills/visual-explainer" "$CLAUDE_HOME/skills/visual-explainer"
  restore_path "$BACKUP" "docs" "$CLAUDE_HOME/html-explainer/docs"
  restore_path "$BACKUP" "goals" "$CLAUDE_HOME/html-explainer/goals"
  restore_path "$BACKUP" "patterns" "$CLAUDE_HOME/html-explainer/patterns"
  restore_path "$BACKUP" "scripts" "$CLAUDE_HOME/html-explainer/scripts"
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
  remove_path "$CLAUDE_HOME/html-explainer/goals"
  remove_path "$CLAUDE_HOME/html-explainer/patterns"
  remove_path "$CLAUDE_HOME/html-explainer/scripts"
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

remove_claude_md_guide

# Remove empty html-explainer directory if possible, but keep if backups or examples remain.
if [ "$DRY_RUN" = "0" ] && [ -d "$CLAUDE_HOME/html-explainer" ]; then
  rmdir "$CLAUDE_HOME/html-explainer" 2>/dev/null || true
fi

say "Uninstall complete. Restart Claude Code if it was open."
