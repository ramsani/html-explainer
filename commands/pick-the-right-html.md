# /pick-the-right-html

Select the correct HTML artifact pattern before generating anything.

Completion goal: `goals/artifact-ready.goal.md` only after the user asks to generate the selected artifact.

Do not generate HTML yet.

## Required References

Use:

- `docs/DECISION_GATE.md`
- `docs/LANGUAGE_POLICY.md`
- `docs/PATTERN_GUIDE.md`
- the selected `patterns/NN-*.md` file
- `docs/QUALITY_BAR.md`
- `docs/HUMAN_INTERFACE.md`
- `docs/INVISIBLE_QUALITY.md`
- `docs/CHAIN.md` when follow-up work is likely
- `docs/MEMORY_ACCESS.md` when the artifact may be reused

Use `docs/reference/` only if the decision needs deeper guidance.

## Process

1. Identify the user's primary intent.
2. Identify obvious secondary intents that affect the decision.
3. Identify the user's language and intended artifact audience.
4. Decide whether HTML beats Markdown.
5. Choose the smallest useful budget: compact, standard, or interactive.
6. Select one primary pattern.
7. Read the matching pattern file.
8. State required evidence.
9. State the UX/visual model.
10. State risks to avoid.
11. Provide the next ready-to-run command.

## Output

```text
Intent:
Output language:
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
Archive value:
Archive recommendation:
Saved for later:
```

## Rules

- If Markdown is enough, say so.
- Use one primary pattern.
- Do not generate HTML.
- Do not leave the user to invent the next command.
- Do not auto-chain commands without user approval.
- If the artifact may become future context, state whether to save, refresh later, keep private, supersede, or discard it.
- If it may be reused, include one quiet line for how to find it later.

## Completion

Use the completion goal named above as the stopping condition. Report a blocker instead of claiming completion if the goal cannot be satisfied.
