# Delivery

Use this after generating an artifact.

## Save Location

For generated working artifacts inside a repo, prefer:

```text
<repo>/.html-explainer/artifacts/<clear-name>.html
```

If the user provided another path, use that path.

For reusable artifact memory, follow `docs/ARTIFACT_MEMORY.md` and use the local output root:

```text
~/.claude/html-explainer/outputs/
```

Do not commit generated user artifact history into this repository.

## Browser

Open the HTML in the browser when the environment allows it.

Always return a clickable absolute path.

## Final Chat Response

Keep it short:

```text
Created:
Open:
Pattern:
Budget:
Decision supported:
Quality result:
Main uncertainty:
Next command:
Archive recommendation:
```

Do not paste the full HTML into chat unless requested.
