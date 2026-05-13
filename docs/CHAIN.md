# Chain

Use this when the artifact is part of a larger workflow.

## Purpose

The artifact should not be a dead-end report. It should help the user continue.

## Chain Positions

```text
explore -> choose -> plan -> implement -> review -> ship/share -> reenter
```

Name the current position and the next useful position when follow-up work is likely.

## Process Capsule

Include this compact block when another agent or future session may continue:

```text
Stage:
Primary intent:
Decision so far:
Evidence used:
Open risks:
Out of scope:
Acceptance criteria:
Recommended next prompt:
Block conditions:
```

## Next Prompt Standard

The next prompt should read like a senior engineer wrote it:

- specific outcome;
- evidence required;
- boundaries;
- validation loop;
- rollback or block condition when risk exists;
- editable by the user.
