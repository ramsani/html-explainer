# /pick-the-right-html

Select the correct HTML artifact pattern before generating anything.

## Task

Analyze the user's request and choose the smallest useful HTML artifact pattern.

Do not generate HTML yet.

## Required references

Use:

- `docs/INTENT_DISTILLATION.md` to identify the primary intent, obvious secondary intents, base concept, and fastest path to value.
- `docs/HTML_ADVANTAGE_GATE.md` to prove HTML is better than Markdown for this request.
- `docs/ARTIFACT_BUDGET.md` to choose compact, standard, or interactive and justify the cost.
- `docs/pattern-router.md` to map task signals to the right pattern.
- The selected file in `patterns/` to determine evidence requirements, HTML structure, quality checklist, failure modes, and acceptance criteria.
- `docs/HTML_UX_STANDARD.md` to decide the first-screen contract, interaction value, mobile requirement, and export need.
- `docs/QUALITY_BAR.md` to decide whether HTML is justified at all.
- `docs/HTML_ARTIFACT_CHAINS.md` to decide whether the right answer is one artifact now plus an obvious next artifact later.
- `docs/SHARE_AND_REENTRY.md` when the output should be usable by another human or agent.
- `docs/NEXT_ACTION_HANDOFF.md` to produce a copy-ready next command and selectable alternatives.

## Process

1. Identify the decision the user needs to make.
2. Determine whether HTML is justified or Markdown is better.
3. Distill primary intent, obvious secondary intents, and base concept.
4. Apply the HTML advantage gate.
5. Choose the artifact budget: compact, standard, or interactive.
6. State what wall of text or mental reconstruction the HTML replaces.
7. Use the router to select one primary pattern.
8. Open/read the matching pattern file.
9. Define the UX contract.
10. Optionally select up to two supporting sections.
11. State what evidence must be inspected before generation.
12. State the minimum validation required.
13. State the recommended next action.
14. State whether this is standalone or part of an artifact chain.
15. State whether share/reentry blocks are needed.
16. Provide a copy-ready command or prompt.
17. Provide up to three selectable alternatives only when real branches exist.

## Output

Return:

```text
Intent:

HTML justified: yes | no

Intent distillation:

HTML advantage:

Artifact budget:

Why HTML beats Markdown here:

Mental work removed:

Recommended pattern:

Pattern file:

Why this pattern:

Do not use HTML if:

UX contract:

Evidence to inspect first:

Required HTML sections:

Quality checklist:

Risks to avoid:

Acceptance criteria:

Artifact chain:

Share/reentry needs:

Next action:

Recommended:

Why:

Ready-to-run command:

Selectable alternatives:
```

## Rules

- If Markdown is enough, say so.
- If HTML does not beat Markdown point by point, say so.
- If HTML costs more attention than it saves, choose Markdown.
- Default to compact unless evidence, risk, or interaction justify more.
- Prefer simple artifacts.
- Use one primary pattern.
- Do not create dashboards by default.
- Do not generate HTML before verification.
- Do not select a pattern without checking the pattern file.
- Do not leave the user to invent the next command.
- Do not auto-chain commands without user approval.
