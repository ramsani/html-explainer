# 09 — Architecture Diagram

Intent: make system structure, boundaries, data flow, and operational risk visible.

Use when services, APIs, agents, queues, auth, data flow, databases, external dependencies, deployment, or trust boundaries are involved.

Do not use for simple one-file changes unless the change crosses boundaries or affects runtime flow.

## What to inspect

Minimum inspection set:

- source tree and entry points;
- package/build config;
- framework routing conventions;
- API handlers/endpoints;
- database/schema/migration files if present;
- auth/session/middleware files if present;
- env/config files and documented variables;
- background jobs, queues, workflows, n8n files, or agent orchestration files;
- deployment config when available;
- README/docs, but never README only.

## Evidence required

- real components and where they live;
- data flow between components;
- trust boundaries and external systems;
- stateful dependencies;
- failure points;
- operational risks;
- unknowns or unverified boundaries.

## Prompt template

```text
Generate a self-contained HTML architecture diagram.

Before generating HTML:
1. Inspect the real repo structure, entry points, configs, APIs, data/storage files, auth/middleware, and deployment clues.
2. Identify components that actually exist.
3. Map data flow and trust boundaries.
4. Mark inferred or unverified edges as uncertain.
5. Identify failure points and operational risks.

The HTML must include a component map, data flow, trust boundaries, external dependencies, failure points, evidence inspected, assumptions, unknowns, and next safest action.
```

## Minimum HTML structure

Use a visual layout with these sections:

```text
<header>
  System name, intent, confidence level

<section id="evidence">
  Files/configs/docs inspected

<section id="component-map">
  Component boxes grouped by frontend/backend/storage/external/agent/workflow

<section id="data-flow">
  Arrows showing request/data/event flow

<section id="trust-boundaries">
  User/browser/server/database/external service boundaries

<section id="failure-points">
  What can fail, symptoms, detection, mitigation

<section id="change-risk">
  Which areas are safe, risky, or forbidden to modify

<section id="unknowns">
  Unverified edges, missing docs, assumptions

<section id="next-action">
  Recommended next inspection or implementation step
```

Good visual forms:

- grouped component cards;
- arrows for data flow;
- boundary lanes;
- risk heat map;
- failure-point table;
- legend for verified vs inferred connections.

## Quality checklist

- Every component shown maps to a real file, config, service, or documented dependency.
- Boundaries are meaningful, not decorative.
- Data flow distinguishes request, event, job, and storage flow when relevant.
- Inferred edges are labeled as inferred.
- Failure points include symptoms or detection signals.
- The map helps identify where changes may break behavior.

## Bad artifact examples

Bad example 1:

```text
Frontend -> Backend -> Database
```

Why bad: too generic; no real components, boundaries, failure points, or evidence.

Bad example 2:

```text
The architecture is simple and low risk.
```

Why bad: architecture risk must be tied to evidence and boundaries.

Bad example 3:

```text
Auth service handles authentication.
```

Why bad: invalid if no auth service was actually found or verified.

## Tie-breakers

- If the user needs step-by-step runtime behavior, use `10-process-workflow-flowchart.md`.
- If the task is about a specific repo area, use `04-module-map.md`.
- If the artifact is for returning to project context, use `17-project-recap.md`.
- If evaluating change risk after a diff, combine with `03-annotated-pr-diff-review.md`.
- If architecture choices must be compared, combine with `01-code-approach-comparison.md`.

## Failure modes

- README-only architecture.
- Decorative boxes with no operational meaning.
- No trust boundaries.
- No failure points.
- Invented services or dependencies.
- Treating folder structure as runtime architecture.
- Not distinguishing verified facts from inferred relationships.

## Acceptance criteria

The user can see how the system works, what depends on what, where trust/data boundaries exist, and where a proposed change may break behavior.

A strong artifact lets the user identify safe zones, risky zones, and unknown zones quickly.

## Human interface contract

Apply `docs/HUMAN_INTERFACE.md`. The artifact must recommend one best next move while keeping optional actions visible: continue, revise, compare, think this through, save for later, or stop when enough. Any interaction must give the user real control, not decoration.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
