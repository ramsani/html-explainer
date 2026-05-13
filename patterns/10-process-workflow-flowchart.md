# 10 — Process / Workflow Flowchart

Intent: explain a procedural system with success paths, failure paths, retries, and validation.

Use when n8n workflows, deploys, auth flows, payment flows, issue pipelines, or agent orchestration are involved.

Evidence required: workflow definitions, triggers, logs if available, configs, API calls, error handling, schedules.

Prompt template:
```text
Generate a self-contained HTML workflow flowchart. Inspect real workflow evidence first. Show trigger, steps, decisions, success path, failure path, retries, idempotency, logs, and validation points.
```

HTML structure: intent, evidence, trigger, flowchart, decision nodes, failure paths, retries/idempotency, validation, risks.

Quality checklist: error paths are visible, timing assumptions are clear, repeated side effects are addressed, validation points are explicit, and ownership/trigger boundaries are named.

Failure modes: happy-path-only diagram, no retry logic, no validation points, treating sequence as proof, hiding idempotency or duplicate-side-effect risk.

Acceptance criteria: the user can identify where the workflow succeeds, fails, repeats, or needs protection.

## Tie-breakers

Use workflow flowchart for operational sequence. Use architecture diagram when the main question is system boundaries and component relationships.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
