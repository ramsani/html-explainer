# 05 — Design Token Contact Sheet

Intent: expose the real visual language of a project before UI changes.

Use when colors, typography, spacing, radii, shadows, or visual consistency matter.

Evidence required: theme files, CSS/Tailwind config, component styles, design docs if present.

Prompt template:
```text
Generate a self-contained HTML design token contact sheet. Inspect the real styling sources first. Show tokens, usage examples, inconsistencies, and safe UI recommendations.
```

HTML structure: intent, evidence, token groups, usage samples, inconsistencies, accessibility notes, recommendation.

Quality checklist: tokens are real, examples map to components, inconsistencies are actionable.

Failure modes: inventing a design system, proposing new style before reading existing style, ignoring accessibility.

Acceptance criteria: the user can see the existing visual system and avoid inconsistent UI changes.
