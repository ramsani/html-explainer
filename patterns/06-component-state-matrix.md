# 06 — Component State Matrix

Intent: review UI components across variants and states.

Use when buttons, cards, forms, empty states, dashboards, navigation, or responsive UI are involved.

Evidence required: component files, storybook/examples if present, CSS/classes, accessibility cues, existing states.

Prompt template:
```text
Generate a self-contained HTML component state matrix. Inspect real components first. Show variants, normal/hover/disabled/loading/error/empty states, responsive notes, accessibility concerns, and implementation references.
```

HTML structure: intent, evidence, component inventory, state matrix, responsive notes, accessibility notes, gaps, recommendation.

Quality checklist: states are real or clearly proposed, gaps are visible, accessibility is considered, responsive behavior is covered, and implementation references are present.

Failure modes: static-only mockups, invented states, pretty UI that ignores product constraints, missing empty/loading/error states, ignoring keyboard or screen-reader behavior.

Acceptance criteria: the user can judge UI completeness before implementation.

## Tie-breakers

Use component state matrix when completeness across states matters. Use visual direction explorer when the real question is choosing visual tone.

## Human interface contract

Apply `docs/HUMAN_INTERFACE.md`. The artifact must recommend one best next move while keeping optional actions visible: continue, revise, compare, think this through, save for later, or stop when enough. Any interaction must give the user real control, not decoration.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
