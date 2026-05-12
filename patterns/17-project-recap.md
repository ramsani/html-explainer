# 17 — Project Recap

Intent: re-enter a repo or project quickly with operational context.

Use when returning to a project after time away, onboarding an agent/human, deciding the next task, or recovering context after multiple agent runs.

Do not use when the user only needs a README summary. A recap is operational, not promotional.

## What to inspect

Minimum inspection set:

- README and docs;
- package/config files;
- source tree at useful depth;
- entry points and main routes/commands;
- tests and scripts;
- recent git commits when available;
- open plans, issues, TODO/FIXME, changelog, or notes;
- CI/deploy config if present;
- domain-specific files: workflows, agents, prompts, schemas, migrations, env examples.

## Evidence required

- project identity;
- runtime/development entry points;
- architecture summary;
- main workflows;
- recent activity;
- important constraints;
- open risks;
- next recommended action;
- uncertainty about stale or missing context.

## Prompt template

```text
Generate a self-contained HTML project recap.

Before generating HTML:
1. Inspect README/docs, package/config files, source tree, entry points, tests, scripts, and recent git activity when available.
2. Identify project purpose, architecture, workflows, constraints, risks, and open questions.
3. Do not summarize README only.
4. Separate verified facts, inferences, and unknowns.

The HTML must help a user or agent re-enter the project and decide the next safe action.
```

## Minimum HTML structure

Use a dashboard-like but compact layout:

```text
<header>
  Project name, purpose, confidence level, recommended next action

<section id="evidence">
  Files, commands, docs, and git signals inspected

<section id="identity">
  What this project is and what problem it solves

<section id="architecture">
  High-level architecture map and entry points

<section id="workflows">
  Main user/dev/agent workflows

<section id="recent-activity">
  Recent commits, changes, plans, or TODOs

<section id="constraints">
  Do-not-touch zones, dependencies, conventions, risks

<section id="open-questions">
  Missing context and uncertainty

<section id="next-action">
  Best next step, why, validation, and rollback if applicable

<section id="reentry-checklist">
  Commands/files to inspect next time
```

Good visual forms:

- repo map;
- entry-point cards;
- recent activity timeline;
- risk/constraint board;
- next-action checklist;
- verified vs inferred badges.

## Quality checklist

- Not README-only.
- Recent activity is considered when available.
- Entry points are concrete.
- Risks are operational.
- Next action is specific and low ambiguity.
- The recap distinguishes current facts from stale/inferred context.

## Bad artifact examples

Bad example 1:

```text
This is a modern web application with components and utilities.
```

Why bad: generic, not operational, no evidence.

Bad example 2:

```text
Next step: improve UX.
```

Why bad: vague; no file, workflow, risk, or validation path.

Bad example 3:

```text
Architecture: frontend and backend.
```

Why bad: not enough to re-enter a real project.

## Tie-breakers

- If the user asks how a specific module works, use `04-module-map.md`.
- If the user asks whether a plan is safe, use `02-visual-implementation-plan.md` or plan review command.
- If there is a diff to accept, use `03-annotated-pr-diff-review.md`.
- If the project has many tasks/issues to prioritize, combine with `18-ticket-triage-board.md`.
- If the main concern is architecture risk, combine with `09-architecture-diagram.md`.

## Failure modes

- Marketing summary.
- README-only recap.
- Ignoring recent git activity.
- Ignoring tests/scripts.
- No next action.
- No uncertainty markers.
- Treating old docs as current without checking.

## Acceptance criteria

The user can resume work without re-exploring the repo from zero.

A strong recap answers: what this is, how it works, what changed recently, what is risky, what is unknown, and what to do next.
