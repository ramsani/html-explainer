# 09 — Architecture Diagram

Intent: make system structure, boundaries, and risk visible.

Use when services, APIs, agents, queues, auth, data flow, databases, or external dependencies are involved.

Evidence required: source tree, configs, API boundaries, workflow files, env usage, docs, deployment clues.

Prompt template:
```text
Generate a self-contained HTML architecture diagram. Inspect real repo evidence first. Show components, data flow, trust boundaries, dependencies, failure points, and operational risks.
```

HTML structure: intent, evidence, component map, data flow, trust boundaries, dependencies, failure points, risks, next action.

Quality checklist: boxes represent real components, boundaries are meaningful, risks are operational.

Failure modes: README-only architecture, decorative boxes, no failure points, no ownership boundaries.

Acceptance criteria: the user can see how the system works and where changes may break it.
