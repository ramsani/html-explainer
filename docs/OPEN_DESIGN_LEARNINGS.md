# Open Design Learnings

This repo borrows protocols, not product shape.

The useful lesson is that strong visual artifacts need a production process. They do not become valuable because they are rendered in HTML. They become valuable because the process forces discovery, evidence, constraints, quality gates, export, and re-entry before the artifact is trusted.

## What Transfers

- Start with intent discovery before choosing a format.
- Treat recurring outputs as small packages with docs, examples, checks, and failure modes.
- Use templates for repeated artifact types so structure is not reinvented each time.
- Split quality into P0, P1, and P2 so blocking requirements are explicit.
- Prefer honest placeholders over fake confidence.
- Keep local generated outputs outside the repo.
- Make preview, export, archive recommendation, and next prompt part of delivery.

## What Does Not Transfer

- No daemon.
- No cloud sync.
- No hosted service.
- No database.
- No desktop app.
- No design-system catalog.
- No media pipeline.

## Repo Adaptation

For `html-explainer`, the extracted protocol is:

```text
discovery -> direction -> pattern package -> evidence -> artifact -> quality gate -> archive decision -> re-entry prompt
```

This is the manufacturing line. Validation confirms that line produced a useful artifact. It does not replace the line.
