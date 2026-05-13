# User Value

`html-explainer` exists to help users make better decisions with less mental work.

It is not a generic HTML generator. It is a decision and memory layer for agent work.

## Core Promise

```text
intent -> evidence -> visual understanding -> decision -> next action -> reusable memory
```

Every serious artifact should make the user's next move easier.

## Value Delivered

| Benefit | How the repo delivers it | What the user feels |
|---|---|---|
| Faster understanding | First screen shows intent, evidence basis, risk, recommendation, and next action. | "I know what this is and what to do next." |
| Less mental load | Related facts, trade-offs, unknowns, and options are visible together. | "I do not have to hold everything in my head." |
| Safer decisions | Claims must be tied to inspected evidence or marked as unknown. | "I can see what is proven and what is not." |
| Better reviews | Plans, diffs, PRs, and workflows expose findings, missing checks, and severity. | "I can accept, revise, block, or verify with confidence." |
| Better thinking | Unclear ideas are framed, grounded, stress-tested, synthesized, and converted into action. | "My vague thought became a usable next step." |
| Better continuation | Next prompts preserve intent, evidence, boundaries, checks, and uncertainty. | "The next agent does not have to restart." |
| Reusable knowledge | Useful artifacts include archive recommendation, validity class, freshness risk, and re-entry path. | "This can help me later without becoming stale truth." |
| Less noise | Decision Gate rejects HTML when Markdown is enough. | "The tool does not waste my attention." |
| Clearer collaboration | Output language matches the user's language unless another audience is requested. | "It speaks to me directly." |
| Trustworthy growth | Commands, patterns, examples, scenarios, install, and uninstall are validated. | "The system has a quality floor." |

## Delivered Artifacts

| Artifact family | Delivered result | User benefit |
|---|---|---|
| Pattern selection | Correct pattern, budget, evidence list, and ready-to-run command. | The user starts with the right artifact or skips HTML. |
| Decision HTML | Self-contained artifact with evidence, risks, recommendation, and next action. | The user sees the decision instead of reading scattered notes. |
| Plan review | Fit, assumptions, risks, missing checks, and approve/revise/reject path. | The user improves the plan before work begins. |
| Diff review | Changed files, behavior impact, findings, missing tests, and merge decision. | The user reviews code changes with less guesswork. |
| Project recap | Repo identity, current state, important files, risks, and next action. | The user re-enters a project quickly. |
| Decision tool | Small editor, triage board, tuner, or config surface with export. | The user manipulates choices and leaves with usable output. |
| Artifact audit | Score, hard fails, gaps, and fix path. | The user can reject pretty but weak artifacts. |
| Thinking surface | Frame, evidence, tensions, stress test, conclusion, and next prompt. | The user turns vague thinking into action. |
| Artifact memory | Metadata, validity, freshness, privacy, supersession, and re-entry rules. | The user keeps useful outputs without trusting stale ones. |

## What The User Should Not Feel

- They should not feel forced to learn the repo philosophy.
- They should not see heavy internal vocabulary.
- They should not have to decide which pattern fits if a command can guide them.
- They should not receive HTML when a direct answer is better.
- They should not have to rebuild context for the next step.

## Product Standard

The best output feels simple:

1. It answers the user's actual question.
2. It shows what was inspected.
3. It makes the risk visible.
4. It recommends the next action.
5. It gives a prompt or export the user can reuse.
6. It says whether the artifact is worth saving.
