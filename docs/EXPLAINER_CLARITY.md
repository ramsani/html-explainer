# Explainer Clarity

Intent: make every HTML artifact feel understood, clear, and action-oriented for a real human reader.

Use this after intent distillation and before designing the artifact.

## Reader contract

Before writing sections or layout, define:

```text
Reader:
What they probably came to do:
What they fear or are unsure about:
What they need to understand first:
What decision they can make after 30 seconds:
What action they can safely take next:
```

If this contract is weak, the artifact will feel technical even when it is correct.

## Language rule

Write for the reader, not for the repo.

- Prefer plain action language over implementation labels.
- Explain technical terms the first time they matter.
- Use short section titles that answer the user's question.
- Do not mix English and Spanish unless the source material requires it.
- Avoid internal process names in first-screen copy unless they help the decision.

Bad:

```text
Artifact budget: compact. Pattern 03. Blast radius: docs/scripts.
```

Better:

```text
This is a small documentation change. It is safe to accept after one validation pass.
```

## Intent coverage

The first screen must show:

- primary intent;
- obvious secondary intents;
- what the artifact is not trying to do;
- the main answer;
- next safest action.

Secondary intents should feel acknowledged, not hidden in a checklist.

## Visual explanation rule

Use at least one visual model that explains the core concept quickly:

- decision ladder;
- before/after flow;
- risk map;
- chain map;
- concept diagram;
- state matrix;
- comparison grid;
- annotated snippet;
- timeline.

Tables are useful, but a table alone is not an explainer.

## Next action options

Options must match what a user is likely to do next.

For diff reviews, prefer:

- accept;
- fix specific issue;
- verify with command;
- split change;
- explain/share.

Use "revert" only when:

- the change is harmful;
- production is broken;
- the user explicitly asked for rollback options;
- accepting would risk data, security, deploy, payment, or user access.

For project recaps, prefer:

- inspect one module;
- generate plan;
- audit current quality;
- create design/reference sheet;
- run validation.

## Clarity checks

Before finalizing, ask:

- Would a non-specialist understand the main answer in 30 seconds?
- Does the visual form explain something prose would make slower?
- Are the next options the most likely next moves?
- Did we avoid scary or irrelevant actions?
- Did we explain why the recommendation is safe?
- Did we show what remains unknown?

## Hard fails

Reject or revise the artifact if:

- it is mostly a technical inventory;
- it has outdated or contradictory counts;
- it recommends unlikely next actions;
- it buries the answer below evidence;
- it uses visual polish without visual explanation;
- it leaves the reader unsure what to do next.
