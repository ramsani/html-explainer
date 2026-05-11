#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/ramsani/html-explainer.git"
VISUAL_EXPLAINER_URL="https://github.com/nicobailon/visual-explainer.git"
CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"
TMP_DIR="$(mktemp -d)"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

say() { printf '\n[html-explainer] %s\n' "$1"; }

say "Installing into $CLAUDE_HOME"
mkdir -p "$CLAUDE_HOME/skills" "$CLAUDE_HOME/commands" "$CLAUDE_HOME/html-explainer"

if command -v git >/dev/null 2>&1; then
  say "Fetching html-explainer package"
  git clone --depth 1 "$REPO_URL" "$TMP_DIR/html-explainer" >/dev/null 2>&1 || {
    echo "Could not clone $REPO_URL. If you cloned manually, run this installer from the repo root." >&2
    exit 1
  }

  say "Installing upstream visual-explainer when available"
  if git clone --depth 1 "$VISUAL_EXPLAINER_URL" "$TMP_DIR/visual-explainer" >/dev/null 2>&1; then
    if [ -d "$TMP_DIR/visual-explainer/plugins/visual-explainer" ]; then
      rm -rf "$CLAUDE_HOME/skills/visual-explainer"
      cp -R "$TMP_DIR/visual-explainer/plugins/visual-explainer" "$CLAUDE_HOME/skills/visual-explainer"
    fi
    if [ -d "$TMP_DIR/visual-explainer/plugins/visual-explainer/commands" ]; then
      cp "$TMP_DIR/visual-explainer/plugins/visual-explainer/commands/"*.md "$CLAUDE_HOME/commands/" 2>/dev/null || true
    fi
  else
    say "Skipping upstream visual-explainer: clone failed. The Thariq layer will still install."
  fi
else
  echo "git is required for the one-line installer." >&2
  exit 1
fi

say "Installing Thariq HTML effectiveness skill"
rm -rf "$CLAUDE_HOME/skills/thariq-html-effectiveness"
cp -R "$TMP_DIR/html-explainer/skills/thariq-html-effectiveness" "$CLAUDE_HOME/skills/thariq-html-effectiveness"
cp "$TMP_DIR/html-explainer/commands/"*.md "$CLAUDE_HOME/commands/"
cp -R "$TMP_DIR/html-explainer/docs" "$CLAUDE_HOME/html-explainer/docs"

say "Optionally fetching Thariq HTML examples for local reference"
EXAMPLES_DIR="$CLAUDE_HOME/html-explainer/examples"
mkdir -p "$EXAMPLES_DIR"
if command -v curl >/dev/null 2>&1; then
  curl -fsSL "https://thariqs.github.io/html-effectiveness/" -o "$EXAMPLES_DIR/index.html" || true
  grep -oE '[0-9]{2}-[^"'\'' >]+\.html' "$EXAMPLES_DIR/index.html" 2>/dev/null | sort -u > "$EXAMPLES_DIR/pages.txt" || true
  if [ -s "$EXAMPLES_DIR/pages.txt" ]; then
    while IFS= read -r page; do
      curl -fsSL "https://thariqs.github.io/html-effectiveness/$page" -o "$EXAMPLES_DIR/$page" || true
    done < "$EXAMPLES_DIR/pages.txt"
  fi
fi

say "Installed. Restart Claude Code if it was already open."
printf '\nAvailable commands:\n'
printf '  /html-effectiveness\n'
printf '  /html-pattern-select\n'
printf '  /html-plan-review-plus\n'
printf '  /html-diff-review-plus\n'
printf '  /html-project-recap-plus\n'
printf '  /html-custom-editor-plus\n'
