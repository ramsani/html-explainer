# Thariq HTML Effectiveness

Use this skill when HTML would help the user inspect, compare, verify, decide, tune, share, or re-enter work better than Markdown.

This skill extends visual-explainer with an evidence-first operating model. The intent is not decoration. The intent is cognition.

```text
intent -> evidence -> visual understanding -> decision -> expert next prompt
```

## Operating Model

Before generating HTML:

1. Apply `docs/DECISION_GATE.md`.
2. Apply `docs/PATTERN_GUIDE.md`.
3. Open the selected file in `patterns/`.
4. Apply `docs/FACT_SHEET.md`.
5. Apply `docs/STYLE.md`.
6. Apply `docs/QUALITY_BAR.md`.
7. Apply `docs/CHAIN.md` when follow-up work is likely.
8. Apply `docs/DELIVERY.md`.

Use the old detailed docs only when needed from `docs/reference/`. They are reference material, not the default path.

## When To Use HTML

Use for:

- architecture maps;
- implementation plans;
- plan review;
- diff or PR review;
- repo recap;
- module exploration;
- design system inspection;
- visual direction exploration;
- interactive prototypes;
- diagrams and workflows;
- decks;
- research explainers;
- incident reports;
- status reports;
- ticket triage;
- custom editors;
- prompt tuning.

Do not use for:

- simple answers;
- tiny bug fixes;
- one-command replies;
- questions that fit clearly in a short response;
- anything where HTML would only make the answer look more impressive.

## Pattern Files

There are 21 operational pattern files under `patterns/`.

Do not rely on the general list. Select and apply one primary pattern file.

## Required Artifact Qualities

Every serious artifact must show:

- primary intent;
- useful secondary intents;
- selected pattern;
- why HTML beats Markdown;
- artifact budget;
- evidence inspected;
- facts, inferences, assumptions, and unknowns;
- visual model;
- risks;
- recommendation;
- success criteria;
- next action handoff.

Interactive artifacts must export something usable.

## Failure Modes To Avoid

- Beautiful but unverifiable output.
- Generic dashboards with no decision value.
- Spending more attention than the artifact saves.
- Missing why HTML is better than Markdown.
- Choosing interactive when compact is enough.
- Answering adjacent needs while missing the main intent.
- Hiding uncertainty.
- Inventing files, behavior, tests, routes, or dependencies.
- Creating controls that do not affect a decision.
- Creating editors without exportable output.
- Leaving the user to invent the next command.

## Final Response After HTML

Keep the chat short:

```text
Created:
Open:
Pattern:
Budget:
Decision supported:
Quality result:
Main uncertainty:
Next command:
```

Do not rewrite the artifact in chat.
