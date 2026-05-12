# 03 — Annotated PR / Diff Review

Intent: make code changes reviewable as risk, behavior, and evidence—not only as text diff.

Use when there is a PR, patch, git diff, changed files, or agent implementation to accept.

Do not use when there are no code changes. Use `02-visual-implementation-plan.md` before implementation and this pattern after implementation.

## What to inspect

Minimum inspection set:

- `git status --short`
- `git diff --stat`
- `git diff --name-status`
- `git diff` or PR patch
- changed files, not only diff hunks
- related tests
- related docs/config/schema/routes if affected
- package/build/test commands available in the repo

If the diff mentions files, APIs, routes, DB tables, auth, payments, migrations, or workflows, inspect those adjacent areas before making safety claims.

## Evidence required

- changed file list;
- diff summary;
- behavior before/after;
- tests run or inspected;
- missing validation;
- release or rollback risk;
- explicit unknowns.

## Prompt template

```text
Generate a self-contained HTML annotated diff review.

Before generating HTML:
1. Inspect git status, diff stat, name-status, and relevant diff hunks.
2. Read changed files and adjacent files needed to understand behavior.
3. Identify behavior before/after.
4. Separate facts, inferences, and unknowns.
5. Do not claim tests passed unless they were actually run or verified.

The HTML must include changed files, severity-coded findings, behavior before/after, test coverage, blast radius, missing validation, recommendation, and a next action handoff.
```

## Minimum HTML structure

Use a navigable layout with these sections:

```text
<header>
  Pattern, intent, recommendation badge, quality score

<section id="evidence">
  Commands/files inspected and confidence level

<section id="files">
  Changed files table: path, change type, risk, reason

<section id="behavior">
  Before/after comparison

<section id="findings">
  Severity-coded findings with evidence references

<section id="tests">
  Tests run, tests inspected, validation gaps

<section id="blast-radius">
  Runtime impact, user impact, API/data/config impact

<section id="decision">
  Accept | revise | reject | split, with next action handoff

<section id="next-action">
  Recommended action
  Why this action
  Ready-to-run command or prompt
  Selectable alternatives for accept, revise, split, test, or implement when relevant
```

Good visual forms:

- severity cards;
- before/after table;
- file-risk matrix;
- collapsible diff snippets;
- test coverage checklist;
- release risk badge.

## Quality checklist

- Findings map to real changed files or diff hunks.
- Behavior change is described, not only code style.
- Severity is justified by impact and likelihood.
- Missing tests are visible.
- No test/build claim is made without evidence.
- Recommendation is one of: accept, revise, reject, split.
- The user can see what to do next and has a ready-to-run command.

## Bad artifact examples

Bad example 1:

```text
The diff looks good. It adds a useful component and improves UX. Recommendation: accept.
```

Why bad: no evidence, no file list, no risk, no validation.

Bad example 2:

```text
Tests pass.
```

Why bad: invalid unless the artifact shows the actual command or verified test output.

Bad example 3:

```text
The change is low risk because it only changes frontend files.
```

Why bad: frontend changes can still break auth, routing, API assumptions, accessibility, or user workflows.

## Tie-breakers

- If there is no diff yet, use `02-visual-implementation-plan.md`.
- If the diff is mostly architecture, combine with `09-architecture-diagram.md`.
- If the diff changes a workflow, combine with `10-process-workflow-flowchart.md`.
- If the diff is UI-heavy, combine with `06-component-state-matrix.md`.
- If the user wants a formal score, combine with `16-audit-report.md`.

## Failure modes

- Reviewing filenames only.
- Praising implementation style without checking behavior.
- Hiding missing tests.
- Treating generated code as safe by default.
- Ignoring changed config or dependency files.
- Omitting rollback or release risk.
- Ending with vague advice instead of selectable next steps.

## Acceptance criteria

The user can decide whether to accept, revise, reject, or split the change without reading the full raw diff first.

A strong artifact makes the change's behavior, risks, missing validation, and next action visible within 60 seconds.

The final section gives one recommended action and up to three alternatives, each phrased so the user can approve it without rewriting the prompt.
