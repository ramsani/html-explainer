# Next Action Handoff

Intent: make the next useful step obvious, copy-ready, and low-friction.

Use this at the end of every command response and generated HTML artifact.

For serious follow-up work, also apply `docs/SENIOR_CHAINED_PROMPTS.md` so the next prompts read like durable engineering briefs, not casual suggestions.
For technical staged work, apply `docs/EXPERT_PROMPT_GATES.md` so the prompt names the result to protect, required evidence, boundaries, and block conditions.

## Why

The artifact should not leave the user asking "now what?"

HTML is most valuable when it turns analysis into a usable decision surface. The final section must convert the artifact into a next action the agent can execute or the user can choose.

## Required final block

Every artifact or command response should end with:

```text
Next action:
Recommended: <one concrete action>
Why: <one sentence>
Recommended prompt:
<copy-ready slash command or plain prompt the user can paste and edit>
Three logical options:
1. <Recommended path label>
   Best when: <condition>
   Why it helps: <one sentence>
   Prompt to copy/edit: <copy-ready command or prompt>
2. <Alternative path label>
   Best when: <condition>
   Why it helps: <one sentence>
   Prompt to copy/edit: <copy-ready command or prompt>
3. <Alternative path label>
   Best when: <condition>
   Why it helps: <one sentence>
   Prompt to copy/edit: <copy-ready command or prompt>
```

## Rules

- Recommend one best next action.
- Offer three logical options when follow-up work is likely.
- The three options must be meaningfully different paths, not wording variants.
- Keep each prompt copy-ready and easy for the user to edit.
- The recommended action must advance the primary intent.
- Secondary actions may appear only as alternatives.
- Do not let the easiest cleanup item replace the user's real goal.
- Do not chain commands automatically without user approval.
- Do not offer more than three options.
- Use alternatives only when the analysis found real branches.
- If only one honest next step exists, provide one recommended prompt and state that no useful alternatives were found.
- If no HTML should be created, the next action should be plain Markdown or a direct implementation/review prompt.
- If the artifact found blocking issues, the recommended action must fix or verify those blockers first.
- If the artifact is a review, options should map to obvious decisions: accept, revise, split, test, or implement.
- If the artifact is interactive, include an export or copy action when useful.

## Option design

The three options should usually cover different user intentions:

- continue deeper: create the next HTML artifact or analysis;
- act now: implement, fix, verify, or test the recommended change;
- change direction: audit, compare, share, simplify, or pause.

Good option labels:

- Deepen understanding
- Turn this into a plan
- Fix the blocking issue
- Verify before accepting
- Share with a reviewer
- Build the decision editor
- Stop and use Markdown

Bad option labels:

- Option 1
- More analysis
- Improve
- Continue
- Next

## Senior prompt quality

Each copy/edit prompt should include enough structure for the next agent to work without guessing:

- primary intent to preserve;
- decision so far;
- next job;
- evidence or artifact to reuse;
- result to protect;
- evidence required;
- acceptance criteria;
- out of scope when drift is likely.
- block condition when risk is meaningful.

Keep this compact. A prompt can be senior without being long.

## Report as next-step input

The final block should make the artifact reusable by the next agent.

When follow-up work is likely, include one copy-ready prompt that carries forward:

- the primary intent;
- the recommended next action;
- the evidence already inspected;
- the unresolved question or risk;
- the acceptance criteria for the next step.

Good:

```text
Ready-to-run command:
/make-the-right-html use the findings in this artifact to generate a focused implementation plan for improving project recap outputs. Keep the primary intent: help a non-technical user understand repo opportunities and choose the next best action. Reuse the inspected evidence; do not restart from README-only summary.
```

Bad:

```text
Ready-to-run command:
Clean up repo files.
```

Why bad: it loses the user's goal and throws away the report as context.

## Good example

```text
Next action:
Recommended: revise the PR before merge.
Why: the review found one blocking optimistic-update race.
Recommended prompt:
Fix the optimistic-update race, then run /check-the-diff again to verify the new diff.
Three logical options:
1. Fix blockers
   Best when: you want the safest path before merge.
   Why it helps: it resolves the issue that changes user-visible behavior.
   Prompt to copy/edit: Fix the optimistic-update race by adding cancelQueries and stable idempotency keys, then run /check-the-diff on the result.
2. Split PR
   Best when: the review is too broad to accept in one change.
   Why it helps: it separates risky behavior from plumbing.
   Prompt to copy/edit: Split this change into optimistic cache behavior and idempotency-key plumbing, then generate a new diff review for the first PR.
3. Accept with documented risk
   Best when: speed matters and the risk is acceptable.
   Why it helps: it makes the trade-off explicit before merge.
   Prompt to copy/edit: Draft a short PR note explaining why flicker and retry-key behavior are acceptable for this release.
```

## Bad example

```text
Next action:
Improve the code.
```

Why bad: it is not executable, not selectable, and does not remove any work from the user.
