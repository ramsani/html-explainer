# 15 — Incident / Postmortem Report

Intent: understand failure and prevent recurrence.

Use when there is a bug, outage, regression, broken workflow, failed agent run, or production incident.

Evidence required: timeline, logs/errors, changed files, affected users/systems, reproduction steps, mitigations attempted.

Prompt template:
```text
Generate a self-contained HTML incident/postmortem report. Separate confirmed facts from hypotheses. Show timeline, impact, root cause candidates, unknowns, mitigation, and prevention actions.
```

HTML structure: intent, evidence, timeline, impact, confirmed facts, hypotheses, root cause, mitigation, prevention, owners/next actions.

Quality checklist: timeline is explicit, uncertainty is visible, impact is clear, prevention actions map to causes, and owners or follow-ups are named.

Failure modes: blame, false certainty, no timeline, vague prevention, confusing symptoms with root cause.

Acceptance criteria: the user can understand what failed, why it likely failed, and what prevents recurrence.

## Tie-breakers

Use incident report after something failed. Use audit report when the user wants a standards-based review without a specific incident.

## Human interface contract

Apply `docs/HUMAN_INTERFACE.md`. The artifact must recommend one best next move while keeping optional actions visible: continue, revise, compare, think this through, save for later, or stop when enough. Any interaction must give the user real control, not decoration.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
