# 08 — Microinteraction Sandbox

Intent: evaluate motion, timing, feedback, and perceived responsiveness.

Use when loading states, confirmations, onboarding, drag/drop, collapse/expand, or feedback loops matter.

Evidence required: UI context, existing animation/style rules, accessibility constraints, desired behavior.

Prompt template:
```text
Generate a self-contained HTML microinteraction sandbox. Show before/after, timing controls when useful, reduced-motion consideration, implementation notes, and whether the motion improves task completion.
```

HTML structure: intent, evidence, before/after demo, controls, reduced-motion notes, implementation notes, recommendation.

Quality checklist: motion has purpose, timing is inspectable, accessibility is considered, reduced-motion behavior exists, and selected parameters can be copied or described.

Failure modes: decorative animation, slow interactions, no reduced-motion path, hidden timing choices, animation that distracts from the primary action.

Acceptance criteria: the user can decide whether the interaction improves usability.

## Tie-breakers

Use this pattern when timing or feedback changes the decision. Use visual direction explorer when layout/tone is the main decision.

## Human interface contract

Apply `docs/HUMAN_INTERFACE.md`. The artifact must recommend one best next move while keeping optional actions visible: continue, revise, compare, think this through, save for later, or stop when enough. Any interaction must give the user real control, not decoration.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
