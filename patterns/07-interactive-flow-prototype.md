# 07 — Interactive Flow Prototype

Intent: let the user feel a UX flow before implementation.

Use when the decision depends on clicks, sequence, progressive disclosure, form flow, or friction.

Evidence required: user goal, existing routes/components, product constraints, target flow, edge states.

Prompt template:
```text
Generate a self-contained HTML interactive flow prototype. Inspect relevant UI constraints first. Include clickable states, transitions, edge cases, implementation cost notes, and a final recommendation.
```

HTML structure: intent, evidence, flow map, clickable prototype, states, edge cases, implementation notes, risks.

Quality checklist: prototype is scoped, interaction clarifies the decision, not presented as final UI.

Failure modes: over-polished fake app, interactions outside scope, no implementation grounding.

Acceptance criteria: the user can validate whether the flow reduces friction before code is changed.
