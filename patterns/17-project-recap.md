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
5. Classify generated local artifacts separately from repo/product files. Do not make local HTML outputs the main risk unless they are tracked, published, or blocking the user's goal.
6. Verify CI, tags, dirty files, examples, and validation scripts before calling them missing.

The HTML must help a user or agent re-enter the project and decide the next safe action.

Write for a reader who may not remember the repo. Explain the project in plain language before listing files.
```

## Minimum HTML structure

Use a dashboard-like but compact layout:

```text
<header>
  Project name, plain-language purpose, confidence level, recommended next action, reader contract

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

- orientation map;
- repo map;
- entry-point cards;
- recent activity timeline;
- risk/constraint board;
- next-action checklist;
- verified vs inferred badges.
- local artifact hygiene strip only when generated files affect the current decision.

## Quality checklist

- Not README-only.
- Recent activity is considered when available.
- Entry points are concrete.
- Risks are operational.
- Next action is specific and low ambiguity.
- The recap distinguishes current facts from stale/inferred context.
- Local generated artifacts are classified without exaggerating their product risk.
- Claims about CI, tags, examples, and validation are checked against live files or marked as unverified.
- The first screen answers "what is this, why does it matter, and what should I do next?"
- It includes at least one visual orientation model: system map, workflow map, risk map, or reentry path.

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
- Creating a technical inventory instead of a reentry explanation.
- Treating session-generated HTML as the repo's highest risk.
- Claiming CI or versioning gaps without inspecting `.github/workflows/`, `git tag --list`, or the README.

## Acceptance criteria

The user can resume work without re-exploring the repo from zero.

A strong recap answers: what this is, how it works, what changed recently, what is risky, what is unknown, and what to do next.

## Human interface contract

Apply `docs/HUMAN_INTERFACE.md`. The artifact must recommend one best next move while keeping optional actions visible: continue, revise, compare, think this through, save for later, or stop when enough. Any interaction must give the user real control, not decoration.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
