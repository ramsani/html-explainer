# 18 — Ticket Triage Board

Intent: sort many tasks, issues, bugs, or features by value, risk, urgency, dependency, and strategic fit.

Use when the user has a backlog, GitHub issues, candidate features, bugs, agent tasks, or multiple possible next actions.

Do not use when there is only one clear next task. Use a short recommendation instead.

## What to inspect

Minimum inspection set:

- issue/task titles and bodies;
- labels, status, assignees, milestones when available;
- related PRs or linked docs;
- user goal or business objective;
- dependencies between tasks;
- severity, urgency, user impact, revenue impact, risk, and effort signals;
- stale/duplicate/blocked status;
- repo context if tasks imply code changes.

## Evidence required

- task list source;
- scoring criteria;
- per-task evidence or rationale;
- dependency/blocker notes;
- recommended priority buckets;
- final exportable output.

## Prompt template

```text
Generate a self-contained HTML ticket triage board.

Before generating HTML:
1. Inspect the actual issue/task list and relevant context.
2. Define explicit scoring criteria: value, urgency, risk, effort, dependency, and strategic fit.
3. Score each item with short evidence.
4. Group into priority buckets.
5. Include filters or sorting if useful.
6. Include exportable output: Markdown issue list, next sprint plan, or agent task queue.

The HTML must help the user choose what to do next, not merely display a backlog.
```

## Minimum HTML structure

Use an interactive or semi-interactive board:

```text
<header>
  Board intent, source, decision needed

<section id="criteria">
  Scoring rubric and weights

<section id="filters">
  Filter/sort controls: priority, risk, effort, status, owner, dependency

<section id="board">
  Cards grouped into Now / Next / Later / Blocked / Drop

<section id="dependencies">
  Dependency map or blocked-by list

<section id="recommendation">
  Recommended next batch or sprint

<section id="export">
  Copy/export Markdown, JSON, issue checklist, or agent task queue

<section id="unknowns">
  Missing context and items requiring human decision
```

Good visual forms:

- priority buckets;
- score badges;
- sortable/filterable cards;
- dependency chips;
- effort/risk matrix;
- copy/export panel.

## Quality checklist

- Criteria are explicit before scoring.
- Each priority assignment has a rationale.
- Dependencies and blockers are visible.
- Output can be copied or exported.
- The board helps decide what not to do, not only what to do.
- The board avoids over-complexity for small backlogs.

## Bad artifact examples

Bad example 1:

```text
Here are all the issues in a nice grid.
```

Why bad: display is not triage; there is no decision rule.

Bad example 2:

```text
Priority: High for everything.
```

Why bad: no meaningful prioritization.

Bad example 3:

```text
Use this board, but no export is provided.
```

Why bad: the user cannot convert the decision into work.

## Tie-breakers

- If the task is a repo recap, use `17-project-recap.md` first.
- If items require technical review before prioritization, combine with `16-audit-report.md`.
- If items are mostly implementation options for one feature, use `01-code-approach-comparison.md`.
- If the output should become GitHub issues, export Markdown issue bodies.
- If the output should guide an agent, export an ordered agent task queue.

## Failure modes

- Pretty backlog with no scoring.
- Non-exportable UI.
- Too much complexity for a small list.
- Ignoring blocked/dependent work.
- Ignoring business/user value.
- Treating stale issues as current without checking.
- Not exposing what should be dropped or deferred.

## Acceptance criteria

The user can select the next tasks, understand why they are prioritized, see what is blocked, and export the result into a usable plan.

A strong triage board reduces indecision and converts a backlog into an actionable sequence.

## Human interface contract

Apply `docs/HUMAN_INTERFACE.md`. The artifact must recommend one best next move while keeping optional actions visible: continue, revise, compare, think this through, save for later, or stop when enough. Any interaction must give the user real control, not decoration.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
