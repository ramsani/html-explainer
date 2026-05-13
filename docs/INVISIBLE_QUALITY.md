# Invisible Quality

Use this to enforce artifact quality without exposing the machinery to the user.

The goal is not to test whether the artifact got lucky. The goal is to confirm that the artifact was manufactured with the required parts.

## Rule

Build with required parts first. Confirm before delivery.

The user should see clarity, not inspection.

## Manufacturing Checks

A serious artifact must include:

- clear user intent;
- evidence or sources checked;
- facts separated from suggestions, assumptions, or unknowns;
- a reason HTML helps more than Markdown;
- decision, recommendation, or best next move;
- risk, uncertainty, or what could go wrong;
- copy-ready continuation;
- memory decision;
- quiet memory access receipt;
- visible user agency.

## Internal Gate

Use `scripts/audit-artifact.py` on generated or curated artifacts.

Default delivery rule:

```text
0-59: block
60-74: block or simplify to Markdown
75-89: revise before delivery when the missing part is visible
90-100: delivery-ready
```

Do not show the score by default.

Show the score only when auditing, debugging, or when the user asks.

## KISS Boundary

Use only local files and standard Python.

Do not add:

- server;
- database;
- npm dependency;
- background sync;
- visible scoring dashboard;
- long automatic reports.

## User Experience

The user may see a quiet line:

```text
Saved for later: Project decisions
Find it fast: ask for "show the onboarding review"
```

They should not see:

```text
Quality Bar score: 87
Validator passed 12 checks
Fixture comparison complete
```

unless they explicitly ask for an audit.
