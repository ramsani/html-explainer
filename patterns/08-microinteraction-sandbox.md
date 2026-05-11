# 08 — Microinteraction Sandbox

Intent: evaluate motion, timing, feedback, and perceived responsiveness.

Use when loading states, confirmations, onboarding, drag/drop, collapse/expand, or feedback loops matter.

Evidence required: UI context, existing animation/style rules, accessibility constraints, desired behavior.

Prompt template:
```text
Generate a self-contained HTML microinteraction sandbox. Show before/after, timing controls when useful, reduced-motion consideration, implementation notes, and whether the motion improves task completion.
```

HTML structure: intent, evidence, before/after demo, controls, reduced-motion notes, implementation notes, recommendation.

Quality checklist: motion has purpose, timing is inspectable, accessibility is considered.

Failure modes: decorative animation, slow interactions, no reduced-motion path.

Acceptance criteria: the user can decide whether the interaction improves usability.
