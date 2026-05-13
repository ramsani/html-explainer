# Delivery

Use this after generating an artifact.

## Language

Match the user's language unless the user requests another language or the artifact is for a different audience.

Apply `docs/LANGUAGE_POLICY.md` before final delivery.

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

## Memory Receipt

Apply `docs/MEMORY_ACCESS.md`.

If the artifact was saved or should be saved, show one quiet line that tells the user where it belongs and how to ask for it later.

If it should not be saved, say so in one short line.

## Browser

Open the HTML in the browser when the environment allows it.

Always return a clickable absolute path.

## Completion Before Delivery

Confirm `docs/INVISIBLE_QUALITY.md` before final delivery.

The artifact should already contain the required user-facing parts before the user sees it. Delivery confirms completeness; it does not ask the user to discover missing pieces.

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
Saved for later:
```

Do not paste the full HTML into chat unless requested.

The final response should feel simple. The user should see what was created, where it is, what decision it supports, what remains uncertain, and what to do next.
