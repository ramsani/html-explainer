#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/ramsani/html-explainer.git"
VISUAL_EXPLAINER_URL="https://github.com/nicobailon/visual-explainer.git"
CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"
INSTALL_UPSTREAM="${INSTALL_UPSTREAM:-1}"
FETCH_EXAMPLES="${FETCH_EXAMPLES:-1}"
DRY_RUN="${DRY_RUN:-0}"
TMP_DIR="$(mktemp -d)"
STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$CLAUDE_HOME/html-explainer/backups/$STAMP"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

say() { printf '\n[html-explainer] %s\n' "$1"; }
run() {
  if [ "$DRY_RUN" = "1" ]; then
    printf '[dry-run] %s\n' "$*"
  else
    "$@"
  fi
}

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Missing required command: $1" >&2
    exit 1
  }
}

backup_path() {
  local src="$1"
  local rel="$2"
  if [ -e "$src" ]; then
    say "Backing up $src"
    run mkdir -p "$BACKUP_DIR/$(dirname "$rel")"
    run cp -R "$src" "$BACKUP_DIR/$rel"
  fi
}

copy_dir_clean() {
  local src="$1"
  local dst="$2"
  if [ ! -d "$src" ]; then
    echo "Source directory missing: $src" >&2
    exit 1
  fi
  run rm -rf "$dst"
  run mkdir -p "$(dirname "$dst")"
  run cp -R "$src" "$dst"
}

copy_files() {
  local src_dir="$1"
  local dst_dir="$2"
  if [ ! -d "$src_dir" ]; then
    echo "Source directory missing: $src_dir" >&2
    exit 1
  fi
  run mkdir -p "$dst_dir"
  if [ "$DRY_RUN" = "1" ]; then
    printf '[dry-run] cp %s/*.md %s/\n' "$src_dir" "$dst_dir"
  else
    find "$src_dir" -maxdepth 1 -type f -name '*.md' -exec cp {} "$dst_dir" \;
  fi
}

verify_file() {
  local file="$1"
  if [ ! -f "$file" ]; then
    echo "Verification failed. Missing file: $file" >&2
    exit 1
  fi
}

say "Installing into $CLAUDE_HOME"
require_cmd git
run mkdir -p "$CLAUDE_HOME/skills" "$CLAUDE_HOME/commands" "$CLAUDE_HOME/html-explainer"

say "Fetching html-explainer package"
if [ -f "./skills/thariq-html-effectiveness/SKILL.md" ] && [ -d "./commands" ] && [ -d "./docs" ]; then
  say "Using current directory as package source"
  PACKAGE_DIR="$(pwd)"
else
  git clone --depth 1 "$REPO_URL" "$TMP_DIR/html-explainer" >/dev/null 2>&1 || {
    echo "Could not clone $REPO_URL" >&2
    exit 1
  }
  PACKAGE_DIR="$TMP_DIR/html-explainer"
fi

backup_path "$CLAUDE_HOME/skills/thariq-html-effectiveness" "skills/thariq-html-effectiveness"
for cmd in html-effectiveness html-pattern-select html-plan-review-plus html-diff-review-plus html-project-recap-plus html-custom-editor-plus html-audit-artifact; do
  backup_path "$CLAUDE_HOME/commands/$cmd.md" "commands/$cmd.md"
done
backup_path "$CLAUDE_HOME/html-explainer/docs" "docs"
backup_path "$CLAUDE_HOME/html-explainer/patterns" "patterns"
backup_path "$CLAUDE_HOME/html-explainer/local-examples" "local-examples"

if [ "$INSTALL_UPSTREAM" = "1" ]; then
  say "Installing upstream visual-explainer when available"
  if git clone --depth 1 "$VISUAL_EXPLAINER_URL" "$TMP_DIR/visual-explainer" >/dev/null 2>&1; then
    if [ -d "$TMP_DIR/visual-explainer/plugins/visual-explainer" ]; then
      backup_path "$CLAUDE_HOME/skills/visual-explainer" "skills/visual-explainer"
      copy_dir_clean "$TMP_DIR/visual-explainer/plugins/visual-explainer" "$CLAUDE_HOME/skills/visual-explainer"
    fi
    if [ -d "$TMP_DIR/visual-explainer/plugins/visual-explainer/commands" ]; then
      copy_files "$TMP_DIR/visual-explainer/plugins/visual-explainer/commands" "$CLAUDE_HOME/commands"
    fi
  else
    say "Skipping upstream visual-explainer: clone failed. Thariq layer will still install."
  fi
else
  say "Skipping upstream visual-explainer because INSTALL_UPSTREAM=0"
fi

say "Installing Thariq HTML effectiveness skill"
copy_dir_clean "$PACKAGE_DIR/skills/thariq-html-effectiveness" "$CLAUDE_HOME/skills/thariq-html-effectiveness"
copy_files "$PACKAGE_DIR/commands" "$CLAUDE_HOME/commands"
copy_dir_clean "$PACKAGE_DIR/docs" "$CLAUDE_HOME/html-explainer/docs"
copy_dir_clean "$PACKAGE_DIR/patterns" "$CLAUDE_HOME/html-explainer/patterns"
if [ -d "$PACKAGE_DIR/examples" ]; then
  copy_dir_clean "$PACKAGE_DIR/examples" "$CLAUDE_HOME/html-explainer/local-examples"
fi

if [ "$FETCH_EXAMPLES" = "1" ]; then
  say "Optionally fetching Thariq HTML examples for local reference"
  if command -v curl >/dev/null 2>&1; then
    EXAMPLES_DIR="$CLAUDE_HOME/html-explainer/examples"
    run mkdir -p "$EXAMPLES_DIR"
    if [ "$DRY_RUN" = "0" ]; then
      curl -fsSL "https://thariqs.github.io/html-effectiveness/" -o "$EXAMPLES_DIR/index.html" || true
      grep -oE "[0-9]{2}-[^\"' >]+\.html" "$EXAMPLES_DIR/index.html" 2>/dev/null | sort -u > "$EXAMPLES_DIR/pages.txt" || true
      if [ -s "$EXAMPLES_DIR/pages.txt" ]; then
        while IFS= read -r page; do
          curl -fsSL "https://thariqs.github.io/html-effectiveness/$page" -o "$EXAMPLES_DIR/$page" || true
        done < "$EXAMPLES_DIR/pages.txt"
      fi
    fi
  else
    say "Skipping examples: curl not found"
  fi
else
  say "Skipping examples because FETCH_EXAMPLES=0"
fi

if [ "$DRY_RUN" = "0" ]; then
  say "Verifying installation"
  verify_file "$CLAUDE_HOME/skills/thariq-html-effectiveness/SKILL.md"
  verify_file "$CLAUDE_HOME/commands/html-effectiveness.md"
  verify_file "$CLAUDE_HOME/commands/html-pattern-select.md"
  verify_file "$CLAUDE_HOME/commands/html-plan-review-plus.md"
  verify_file "$CLAUDE_HOME/commands/html-diff-review-plus.md"
  verify_file "$CLAUDE_HOME/commands/html-project-recap-plus.md"
  verify_file "$CLAUDE_HOME/commands/html-custom-editor-plus.md"
  verify_file "$CLAUDE_HOME/commands/html-audit-artifact.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/thariq-20-case-library.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/html-artifact-selection-guide.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/fact-sheet-protocol.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/pattern-router.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/QUALITY_BAR.md"
  verify_file "$CLAUDE_HOME/html-explainer/patterns/01-code-approach-comparison.md"
  verify_file "$CLAUDE_HOME/html-explainer/patterns/20-prompt-agent-behavior-tuner.md"
fi

say "Installed safely. Restart Claude Code if it was already open."
printf '\nAvailable commands:\n'
printf '  /html-effectiveness\n'
printf '  /html-pattern-select\n'
printf '  /html-plan-review-plus\n'
printf '  /html-diff-review-plus\n'
printf '  /html-project-recap-plus\n'
printf '  /html-custom-editor-plus\n'
printf '  /html-audit-artifact\n'
printf '\nBackup directory, if anything was replaced:\n  %s\n' "$BACKUP_DIR"
