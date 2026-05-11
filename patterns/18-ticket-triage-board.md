# 18 — Ticket Triage Board

Intent: sort many tasks, issues, bugs, or features by value, risk, urgency, and dependency.

Use when the user has a backlog or multiple possible next tasks.

Evidence required: issue/task list, labels/status, user goals, constraints, dependencies, severity/value signals.

Prompt template:
```text
Generate a self-contained HTML ticket triage board. Inspect the actual task list first. Provide scoring criteria, filters/groups, priority buckets, and exportable output.
```

HTML structure: intent, evidence, scoring criteria, cards/table, filters, priority buckets, dependency/risk notes, exportable recommendation.

Quality checklist: criteria are explicit, cards are actionable, output can be copied/exported.

Failure modes: pretty board with no decision rule, non-exportable UI, too much complexity.

Acceptance criteria: the user can select the next tasks and export the triage result.
