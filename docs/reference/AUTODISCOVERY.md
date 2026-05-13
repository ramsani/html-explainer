# Autodiscovery

Intent: make `html-explainer` easy for agents to discover without making every answer become HTML.

Use this when the user did not explicitly call a slash command but the task may benefit from an HTML artifact.

## Core rule

Do not generate HTML by reflex.

Do consider HTML when the user's intent involves complex inspection, comparison, planning, review, explanation, tuning, or handoff.

Apply `docs/DECISION_COST_GATE.md` when the task is a plan, architecture choice, PR review, design direction, or implementation approach.

## Strong HTML signals

Consider `html-explainer` when the user asks for:

- implementation plan;
- plan review;
- plan mode with options or trade-offs;
- PR or diff review;
- architecture explanation;
- module map;
- repo recap;
- workflow/process explanation;
- incident report;
- visual design options;
- prototype or animation tuning;
- issue/ticket triage;
- feature flag or config editor;
- prompt or agent instruction tuning;
- research comparison;
- shareable report;
- handoff to another person or agent.

The strongest signal is a human decision crossroads: the user must pick a path and the cost of picking wrong is meaningful.

## Fast Markdown signals

Prefer a direct Markdown answer when:

- the answer fits in 10 lines;
- the user asks for one command;
- the user asks for a small fact;
- there is no visual structure to reveal;
- there is no decision to compare;
- there is no useful interaction or export;
- the user explicitly asks not to create files.

## Autodiscovery flow

```text
1. Identify primary intent.
2. If simple, answer directly.
3. If complex, apply decision cost gate.
4. Apply HTML advantage gate.
5. If HTML wins, use /pick-the-right-html logic.
6. If the pattern is obvious and the user asked for an artifact, use /make-the-right-html logic.
7. If unsure, recommend the next command instead of generating.
```

## Token guard

Autodiscovery must save the user effort, not spend tokens to feel clever.

Use the smallest useful path:

- direct answer for simple tasks;
- `/pick-the-right-html` style recommendation for ambiguous tasks;
- `/make-the-right-html` style generation for clear complex tasks.

## Final response when autodiscovery triggers

If HTML is generated without the user naming a command, briefly state:

```text
I used html-explainer because this needed <comparison / visual structure / interaction / handoff>.
```

If HTML is not generated, do not apologize. Just answer directly.

## Hard fails

Autodiscovery fails if:

- it creates HTML for a simple answer;
- it skips evidence for a serious artifact;
- it generates a dashboard when a compact answer would do;
- it hides the fact that HTML was chosen;
- it spends more user attention than it saves.
