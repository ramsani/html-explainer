# /pick-the-right-html

Select the correct HTML artifact pattern before generating anything.

Do not generate HTML yet.

## Required References

Use:

- `docs/DECISION_GATE.md`
- `docs/PATTERN_GUIDE.md`
- the selected `patterns/NN-*.md` file
- `docs/QUALITY_BAR.md`
- `docs/CHAIN.md` when follow-up work is likely

Use `docs/reference/` only if the decision needs deeper guidance.

## Process

1. Identify the user's primary intent.
2. Identify obvious secondary intents that affect the decision.
3. Decide whether HTML beats Markdown.
4. Choose the smallest useful budget: compact, standard, or interactive.
5. Select one primary pattern.
6. Read the matching pattern file.
7. State required evidence.
8. State the UX/visual model.
9. State risks to avoid.
10. Provide the next ready-to-run command.

## Output

```text
Intent:
HTML justified: yes | no
Why HTML beats Markdown:
Artifact budget:
Recommended pattern:
Pattern file:
Evidence to inspect first:
UX/visual model:
Risks to avoid:
Acceptance criteria:
Next action:
Ready-to-run command:
Useful alternatives:
```

## Rules

- If Markdown is enough, say so.
- Use one primary pattern.
- Do not generate HTML.
- Do not leave the user to invent the next command.
- Do not auto-chain commands without user approval.
