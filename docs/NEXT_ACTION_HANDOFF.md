# Next Action Handoff

Intent: make the next useful step obvious, copy-ready, and low-friction.

Use this at the end of every command response and generated HTML artifact.

## Why

The artifact should not leave the user asking "now what?"

HTML is most valuable when it turns analysis into a usable decision surface. The final section must convert the artifact into a next action the agent can execute or the user can choose.

## Required final block

Every artifact or command response should end with:

```text
Next action:
Recommended: <one concrete action>
Why: <one sentence>
Ready-to-run command:
<slash command or plain prompt>
Selectable alternatives:
- <Action label>: <when to choose it> -> <ready-to-run command or prompt>
```

## Rules

- Recommend one best next action.
- Keep the command copy-ready.
- Do not chain commands automatically without user approval.
- Do not offer more than three alternatives.
- Use alternatives only when the analysis found real branches.
- If no HTML should be created, the next action should be plain Markdown or a direct implementation/review prompt.
- If the artifact found blocking issues, the recommended action must fix or verify those blockers first.
- If the artifact is a review, options should map to obvious decisions: accept, revise, split, test, or implement.
- If the artifact is interactive, include an export or copy action when useful.

## Good example

```text
Next action:
Recommended: revise the PR before merge.
Why: the review found one blocking optimistic-update race.
Ready-to-run command:
/check-the-diff verify the fix after adding cancelQueries and stable idempotency keys.
Selectable alternatives:
- Fix blockers: implement the two blocking review items, then rerun /check-the-diff.
- Split PR: separate optimistic cache behavior from idempotency-key plumbing.
- Accept risk: document why flicker and retry-key behavior are acceptable before merge.
```

## Bad example

```text
Next action:
Improve the code.
```

Why bad: it is not executable, not selectable, and does not remove any work from the user.
