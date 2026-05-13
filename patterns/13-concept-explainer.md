# 13 — Concept Explainer

Intent: teach a technical or product concept with visible structure.

Use when the user needs understanding, not only instructions.

Evidence required: user's question, relevant repo/project context if applicable, examples and counterexamples.

Prompt template:
```text
Generate a self-contained HTML concept explainer. Include a simple model, deeper model, examples, counterexamples, diagram, common mistakes, and practical application.
```

HTML structure: intent, simple model, deeper model, diagram, examples, counterexamples, mistakes, action checklist.

Quality checklist: explanation is contextual, visual structure clarifies relationships, examples are concrete, counterexamples are included, and practical mistakes are visible.

Failure modes: generic tutorial, no counterexamples, no practical use, too much terminology before the simple model, no connection to the user's task.

Acceptance criteria: the user can explain and apply the concept after reading the artifact.

## Tie-breakers

Use concept explainer when the user needs understanding. Use module map or architecture diagram when the user needs to change a specific system.

## Human interface contract

Apply `docs/HUMAN_INTERFACE.md`. The artifact must recommend one best next move while keeping optional actions visible: continue, revise, compare, think this through, save for later, or stop when enough. Any interaction must give the user real control, not decoration.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
