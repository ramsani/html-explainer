# /pick-the-right-html

Select the correct HTML artifact pattern before generating anything.

## Task

Analyze the user's request and choose the smallest useful HTML artifact pattern.

Do not generate HTML yet.

## Required references

Use:

- `docs/INTENT_DISTILLATION.md` to identify the primary intent, obvious secondary intents, base concept, and fastest path to value.
- `docs/ARTIFACT_BUDGET.md` to choose compact, standard, or interactive and justify the cost.
- `docs/pattern-router.md` to map task signals to the right pattern.
- The selected file in `patterns/` to determine evidence requirements, HTML structure, quality checklist, failure modes, and acceptance criteria.
- `docs/HTML_UX_STANDARD.md` to decide the first-screen contract, interaction value, mobile requirement, and export need.
- `docs/QUALITY_BAR.md` to decide whether HTML is justified at all.

## Process

1. Identify the decision the user needs to make.
2. Determine whether HTML is justified or Markdown is better.
3. Distill primary intent, obvious secondary intents, and base concept.
4. Choose the artifact budget: compact, standard, or interactive.
5. State what wall of text or mental reconstruction the HTML replaces.
6. Use the router to select one primary pattern.
7. Open/read the matching pattern file.
8. Define the UX contract.
9. Optionally select up to two supporting sections.
10. State what evidence must be inspected before generation.
11. State the minimum validation required.
12. State the next command/prompt to run.

## Output

Return:

```text
Intent:

HTML justified: yes | no

Intent distillation:

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

Next prompt to run:
```

## Rules

- If Markdown is enough, say so.
- If HTML costs more attention than it saves, choose Markdown.
- Default to compact unless evidence, risk, or interaction justify more.
- Prefer simple artifacts.
- Use one primary pattern.
- Do not create dashboards by default.
- Do not generate HTML before verification.
- Do not select a pattern without checking the pattern file.
