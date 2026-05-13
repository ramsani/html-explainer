#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/ramsani/html-explainer.git"
VISUAL_EXPLAINER_URL="https://github.com/nicobailon/visual-explainer.git"
CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"
INSTALL_UPSTREAM="${INSTALL_UPSTREAM:-1}"
FETCH_EXAMPLES="${FETCH_EXAMPLES:-0}"
DRY_RUN="${DRY_RUN:-0}"
TMP_DIR="$(mktemp -d)"
STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$CLAUDE_HOME/html-explainer/backups/$STAMP"
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

write_claude_md_block() {
  local file="$1"
  cat > "$file" <<'EOF'
<!-- html-explainer:start -->
## html-explainer

Use html-explainer when the user asks for an HTML artifact, or when a complex plan, diff, PR, architecture, repo recap, workflow, design exploration, report, triage board, config editor, prompt-tuning task, or iterative thinking task would be easier to understand in a browser than in Markdown.

Repository docs are in English. Respond to the user in the language they use unless they ask for another language. Generated artifact copy should match the user's language unless the artifact is for a different audience.

Core operating path:

```text
intent -> evidence -> visual understanding -> decision -> next action -> reusable memory
```

Prefer these installed commands:

- `/pick-the-right-html` to decide whether HTML is justified and which artifact fits.
- `/make-the-right-html` to generate the smallest useful verified HTML artifact.
- `/check-the-plan` for implementation plans.
- `/check-the-diff` for diffs or PR review.
- `/reenter-project` for repo recaps and project reentry.
- `/build-decision-tool` for interactive editors, triage boards, or prompt/config tuners.
- `/audit-html` to score and improve an artifact.
- `/think-with-me-about` to think through a topic using an Insight Surface Loop.

Do not use HTML for simple answers, one commands, tiny facts, or low-consequence notes. Every artifact must preserve the user's primary intent, cover obvious secondary intents when they affect the decision, show evidence, separate facts/inferences/unknowns, use the smallest useful budget, use the user's language, end with a copy/edit next prompt, and recommend whether to save, refresh, keep private, supersede, or discard the artifact when it may become future context.

Reference docs live in `~/.claude/html-explainer/docs/`.
Runtime scripts live in `~/.claude/html-explainer/scripts/`. Generated HTML should pass `deliver-artifact.py` before final delivery.
<!-- html-explainer:end -->
EOF
}

install_claude_md_guide() {
  local block_file="$TMP_DIR/claude-md-html-explainer-block.md"
  local tmp_file="$TMP_DIR/CLAUDE.md"

  say "Installing short CLAUDE.md guide"
  write_claude_md_block "$block_file"
  backup_path "$CLAUDE_MD_FILE" "CLAUDE.md"

  if [ "$DRY_RUN" = "1" ]; then
    printf '[dry-run] update managed html-explainer block in %s\n' "$CLAUDE_MD_FILE"
    return
  fi

  mkdir -p "$CLAUDE_HOME"
  if [ -f "$CLAUDE_MD_FILE" ] && grep -qF "$HTML_EXPLAINER_BLOCK_START" "$CLAUDE_MD_FILE"; then
    if ! grep -qF "$HTML_EXPLAINER_BLOCK_END" "$CLAUDE_MD_FILE"; then
      echo "Found html-explainer start marker in $CLAUDE_MD_FILE, but missing end marker. Refusing to edit it." >&2
      exit 1
    fi
    awk -v start="$HTML_EXPLAINER_BLOCK_START" -v end="$HTML_EXPLAINER_BLOCK_END" -v block="$block_file" '
      BEGIN { in_block = 0 }
      index($0, start) {
        while ((getline line < block) > 0) print line
        close(block)
        in_block = 1
        next
      }
      index($0, end) {
        in_block = 0
        next
      }
      !in_block { print }
    ' "$CLAUDE_MD_FILE" > "$tmp_file"
    mv "$tmp_file" "$CLAUDE_MD_FILE"
  elif [ -f "$CLAUDE_MD_FILE" ]; then
    {
      printf '\n\n'
      cat "$block_file"
    } >> "$CLAUDE_MD_FILE"
  else
    cp "$block_file" "$CLAUDE_MD_FILE"
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
for cmd in "${COMMANDS[@]}"; do
  backup_path "$CLAUDE_HOME/commands/$cmd.md" "commands/$cmd.md"
done
for cmd in "${LEGACY_COMMANDS[@]}"; do
  backup_path "$CLAUDE_HOME/commands/$cmd.md" "commands/legacy/$cmd.md"
done
backup_path "$CLAUDE_HOME/html-explainer/docs" "docs"
backup_path "$CLAUDE_HOME/html-explainer/patterns" "patterns"
backup_path "$CLAUDE_HOME/html-explainer/scripts" "scripts"
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
for cmd in "${LEGACY_COMMANDS[@]}"; do
  run rm -f "$CLAUDE_HOME/commands/$cmd.md"
done
copy_files "$PACKAGE_DIR/commands" "$CLAUDE_HOME/commands"
copy_dir_clean "$PACKAGE_DIR/docs" "$CLAUDE_HOME/html-explainer/docs"
copy_dir_clean "$PACKAGE_DIR/patterns" "$CLAUDE_HOME/html-explainer/patterns"
copy_dir_clean "$PACKAGE_DIR/scripts" "$CLAUDE_HOME/html-explainer/scripts"
if [ -d "$PACKAGE_DIR/examples" ]; then
  copy_dir_clean "$PACKAGE_DIR/examples" "$CLAUDE_HOME/html-explainer/local-examples"
fi
install_claude_md_guide

if [ "$FETCH_EXAMPLES" = "1" ]; then
  say "Fetching Thariq HTML examples for optional local reference"
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
  say "Skipping external examples because FETCH_EXAMPLES=0"
fi

if [ "$DRY_RUN" = "0" ]; then
  say "Verifying installation"
  verify_file "$CLAUDE_HOME/skills/thariq-html-effectiveness/SKILL.md"
  for cmd in "${COMMANDS[@]}"; do
    verify_file "$CLAUDE_HOME/commands/$cmd.md"
  done
  verify_file "$CLAUDE_HOME/html-explainer/docs/DECISION_GATE.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/PATTERN_GUIDE.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/QUALITY_BAR.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/STYLE.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/FACT_SHEET.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/CHAIN.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/DELIVERY.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/HUMAN_INTERFACE.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/INVISIBLE_QUALITY.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/LANGUAGE_POLICY.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/USER_VALUE.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/USER_FACING_COPY.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/MEMORY_ACCESS.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/QUALITY_CLAIMS.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/INSIGHT_SURFACE_LOOP.md"
  verify_file "$CLAUDE_HOME/html-explainer/docs/V1_FUNCTION_AUDIT.md"
  verify_file "$CLAUDE_HOME/html-explainer/scripts/audit-artifact.py"
  verify_file "$CLAUDE_HOME/html-explainer/scripts/deliver-artifact.py"
  verify_file "$CLAUDE_HOME/html-explainer/scripts/save-artifact.py"
  verify_file "$CLAUDE_HOME/html-explainer/docs/reference/INTENT_DISTILLATION.md"
  verify_file "$CLAUDE_HOME/html-explainer/patterns/01-code-approach-comparison.md"
  verify_file "$CLAUDE_HOME/html-explainer/patterns/20-prompt-agent-behavior-tuner.md"
  verify_file "$CLAUDE_HOME/html-explainer/patterns/21-visual-direction-explorer.md"
  verify_file "$CLAUDE_HOME/html-explainer/patterns/22-insight-surface-loop.md"
  grep -qF "$HTML_EXPLAINER_BLOCK_START" "$CLAUDE_MD_FILE" || {
    echo "Verification failed. Missing html-explainer guide in $CLAUDE_MD_FILE" >&2
    exit 1
  }
fi

say "Installed safely. Restart Claude Code if it was already open."
printf '\nAvailable commands:\n'
for cmd in "${COMMANDS[@]}"; do
  printf '  /%s\n' "$cmd"
done
printf '\nBackup directory, if anything was replaced:\n  %s\n' "$BACKUP_DIR"
