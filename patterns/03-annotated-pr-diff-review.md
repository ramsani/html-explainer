# 03 — Annotated PR / Diff Review

Intent: make code changes reviewable as risk, behavior, and evidence—not only as text diff.

Use when there is a PR, patch, git diff, changed files, or agent implementation to accept.

Do not use when there are no code changes.

Evidence required:
- `git status --short`;
- `git diff --stat`;
- `git diff --name-status`;
- relevant diff hunks;
- changed files;
- related tests/config/docs.

Prompt template:
```text
Generate a self-contained HTML annotated diff review. Inspect the actual diff and changed files first. Show behavior before/after, severity-coded findings, tests reviewed, blast radius, and accept/revise/reject recommendation.
```

HTML structure:
- intent;
- evidence inspected;
- changed files summary;
- behavior before/after;
- annotated findings;
- risk matrix;
- tests and missing validation;
- recommendation;
- next action.

Quality checklist:
- findings map to real changes;
- no test claims without proof;
- severity is justified;
- release risk is visible.

Failure modes:
- reviewing filenames only;
- praising style without checking behavior;
- hiding missing tests;
- treating generated diff as safe by default.

Acceptance criteria:
The user can decide whether to accept, revise, reject, or split the change.
