# /open-html-explainer-memory

Open the local html-explainer knowledge base.

## Process

1. Apply `docs/LANGUAGE_POLICY.md`.
2. Run `python3 ~/.claude/html-explainer/scripts/rebuild-knowledge-base.py`.
3. Return the direct file link to `~/.claude/html-explainer/outputs/index.html`.
4. If the file cannot be rebuilt, explain the missing file or folder in the user's language.

## Output

```text
Knowledge base:
Open:
What you can do there:
- search saved artifacts;
- browse topics and Maps of Content;
- review resurfacing suggestions;
- open related pages and metadata;
- copy re-entry prompts;
- add local annotations.
```

Keep the answer short. Do not explain JSON, scripts, or internal folders unless the user asks.
