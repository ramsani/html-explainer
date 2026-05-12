# 15 — Incident / Postmortem Report

Intent: understand failure and prevent recurrence.

Use when there is a bug, outage, regression, broken workflow, failed agent run, or production incident.

Evidence required: timeline, logs/errors, changed files, affected users/systems, reproduction steps, mitigations attempted.

Prompt template:
```text
Generate a self-contained HTML incident/postmortem report. Separate confirmed facts from hypotheses. Show timeline, impact, root cause candidates, unknowns, mitigation, and prevention actions.
```

HTML structure: intent, evidence, timeline, impact, confirmed facts, hypotheses, root cause, mitigation, prevention, owners/next actions.

Quality checklist: timeline is explicit, uncertainty is visible, prevention actions map to causes.

Failure modes: blame, false certainty, no timeline, vague prevention.

Acceptance criteria: the user can understand what failed, why it likely failed, and what prevents recurrence.

## Visual explainer contract

Apply `docs/VISUAL_EXPLAINER_PLAYBOOK.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
