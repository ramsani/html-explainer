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
- `docs/CONTEXT_PACKS.md` to avoid reading more context than the decision needs.
- `docs/EXPLAINER_CLARITY.md` to identify the reader, their likely confusion, and the action they need.
- `docs/VISUAL_EXPLAINER_PLAYBOOK.md` to choose the primary visual model and useful interaction.
- `docs/THARIQ_SITE_LEARNINGS.md` to apply the site-level lessons.
- `docs/USER_IN_THE_LOOP.md` to decide how the artifact keeps the user involved.
- `docs/VISUAL_STYLE_STANDARD.md` to require system light/dark and minimal, flat, professional styling.
- `docs/LEAN_HTML_RENDERING.md` to keep CSS, JS, copy, and sections as small as the decision allows.
- `docs/DECISION_COST_GATE.md` to decide if extra HTML tokens are justified by the cost of choosing wrong.
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
4. Define the reader contract.
5. Choose the primary visual model from the visual explainer playbook.
6. State the user-in-the-loop value.
7. State the visual style contract.
8. State the lean rendering guard.
9. State the decision cost when relevant.
10. Apply the HTML advantage gate.
11. Choose the artifact budget: compact, standard, or interactive.
12. State what wall of text or mental reconstruction the HTML replaces.
13. Use the router to select one primary pattern.
14. Open/read the matching pattern file.
15. Define the UX contract.
16. Optionally select up to two supporting sections.
17. State what evidence must be inspected before generation.
18. State the minimum validation required.
19. State the recommended next action.
20. State whether this is standalone or part of an artifact chain.
21. State whether share/reentry blocks are needed.
22. Provide a copy-ready command or prompt.
23. Provide up to three selectable alternatives only when real branches exist.

## Output

Return:

```text
Intent:

HTML justified: yes | no

Intent distillation:

Reader contract:

Primary visual model:

User-in-the-loop value:

Visual style:

Lean rendering guard:

Decision cost:

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
