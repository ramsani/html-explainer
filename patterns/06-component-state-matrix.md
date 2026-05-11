# 06 — Component State Matrix

Intent: review UI components across variants and states.

Use when buttons, cards, forms, empty states, dashboards, navigation, or responsive UI are involved.

Evidence required: component files, storybook/examples if present, CSS/classes, accessibility cues, existing states.

Prompt template:
```text
Generate a self-contained HTML component state matrix. Inspect real components first. Show variants, normal/hover/disabled/loading/error/empty states, responsive notes, accessibility concerns, and implementation references.
```

HTML structure: intent, evidence, component inventory, state matrix, responsive notes, accessibility notes, gaps, recommendation.

Quality checklist: states are real or clearly proposed, gaps are visible, accessibility is considered.

Failure modes: static-only mockups, invented states, pretty UI that ignores product constraints.

Acceptance criteria: the user can judge UI completeness before implementation.
