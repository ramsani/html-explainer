# 05 — Design Token Reference Sheet

Intent: expose the real visual language of a project before UI changes and create a reusable taste reference for future HTML artifacts.

Use when colors, typography, spacing, radii, shadows, component styling, or visual consistency matter.

Evidence required: theme files, CSS/Tailwind config, component styles, existing screens/components, design docs if present.

Prompt template:
```text
Generate a self-contained HTML design token reference sheet. Inspect the real styling sources first. Show tokens, usage examples, component examples, inconsistencies, accessibility notes, and safe UI recommendations. Make it usable as a reference for future HTML artifacts.
```

HTML structure: intent, evidence, token groups, usage samples, component examples, do/don't examples, inconsistencies, accessibility notes, future-artifact guidance, recommendation.

Quality checklist: tokens are real, examples map to components, inconsistencies are actionable, future artifact guidance is concrete, and the sheet does not invent a new visual language.

Failure modes: inventing a design system, proposing new style before reading existing style, ignoring accessibility, producing only swatches with no usage guidance.

Acceptance criteria: the user and a future agent can see the existing visual system and avoid inconsistent UI changes.
