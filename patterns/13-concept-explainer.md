# 13 — Concept Explainer

Intent: teach a technical or product concept with visible structure.

Use when the user needs understanding, not only instructions.

Evidence required: user's question, relevant repo/project context if applicable, examples and counterexamples.

Prompt template:
```text
Generate a self-contained HTML concept explainer. Include a simple model, deeper model, examples, counterexamples, diagram, common mistakes, and practical application.
```

HTML structure: intent, simple model, deeper model, diagram, examples, counterexamples, mistakes, action checklist.

Quality checklist: explanation is contextual, visual structure clarifies relationships, examples are concrete.

Failure modes: generic tutorial, no counterexamples, no practical use.

Acceptance criteria: the user can explain and apply the concept after reading the artifact.

## Visual explainer contract

Apply `docs/VISUAL_EXPLAINER_PLAYBOOK.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
