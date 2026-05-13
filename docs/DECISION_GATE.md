# Decision Gate

Use this before creating any HTML artifact.

## Core Question

Create HTML only when it makes the user's work easier than Markdown.

```text
intent -> evidence -> visual understanding -> decision -> next action -> reusable memory
```

## Use HTML When

- The user must compare options, risks, files, states, timelines, or workflows.
- The decision cost is high: plan, architecture, PR, design direction, deploy, auth, data, automation, or prompt behavior.
- A first screen can make the recommendation, risk, and next action obvious.
- Interaction removes real work: filter, sort, tune, drag, preview, validate, copy, or export.
- The artifact becomes useful input for the next agent step.

## Prefer Markdown When

- The answer fits in a few clear sentences.
- The user asked for one command, one fact, or a tiny fix.
- HTML would only restyle a normal explanation.
- The artifact would cost more attention than it saves.

## Required Intake

Before selecting a pattern, write this internally:

```text
Primary intent:
Obvious secondary intents:
Base concept:
Decision the user needs:
Evidence needed:
Markdown cost:
HTML advantage:
Smallest useful budget:
Archive value:
Not doing:
```

## Budget

- `compact`: quick orientation, small review, narrow decision.
- `standard`: evidence, risk, map, comparison, or handoff matters.
- `interactive`: controls change the decision or produce exportable output.

Default to `compact`. Upgrade only when the decision needs it.

## Context Rule

Read the smallest useful context:

- Routing: request, repo shape, relevant commands/docs.
- Plan review: plan, affected files, contracts, tests.
- Diff review: git diff, changed files, tests, risks.
- Reentry: README, changelog, entry points, CI, scripts, recent commits.
- Editor/tuner: source data, constraints, invalid states, desired export.

Stop when more reading will not change the decision.

## Hard Stops

Do not generate HTML if:

- evidence cannot be inspected and the task depends on evidence;
- the primary intent is unclear;
- no browser advantage can be named;
- the artifact would hide uncertainty;
- the next action would remain vague.

## Memory Gate

Before delivery, decide whether the artifact should be saved, refreshed later, kept private, or discarded.

Use `docs/ARTIFACT_MEMORY.md` when the artifact has future value.

Do not preserve low-confidence scratch work as reusable knowledge.
