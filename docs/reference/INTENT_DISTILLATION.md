# Intent Distillation

Use this before choosing the HTML shape.

The artifact must answer the user's real intent directly. It must also catch the obvious secondary intents that a good human collaborator would notice.

## Distillation sequence

Before generating HTML, write this internally:

```text
User wording:
Primary intent:
Obvious secondary intents:
Base concept:
Decision the user needs to make:
Fastest path to value:
Surprising ease opportunity:
Wall of text replaced:
Mental work removed:
What not to build:
```

## Intent spine

The primary intent is the spine of the artifact.

Apply `docs/COHERENCE_GUARD.md` when the artifact or next prompt risks becoming a collection of good ideas instead of one coherent path.

Every section, comment, risk, recommendation, control, and next action must answer one question:

```text
Does this move the user closer to what they came here to accomplish?
```

If the answer is no, remove it or move it to a small secondary note.

Rules:

- Start with the user's desired outcome, not with repo inventory.
- Rank findings by usefulness to that outcome.
- Explain secondary intents only when they help the primary intent.
- Do not let a surprising detail become the main story unless it changes the user's decision.
- Do not recommend cleanup, refactor, tests, tags, CI, or documentation unless that is the best next step for the user's stated goal.
- The final recommendation must be the next move on the user's path, not merely the easiest issue found.

Bad:

```text
Primary intent: understand opportunities.
Main recommendation: delete local generated HTML files.
```

Why bad: the cleanup may be true, but it does not carry the user toward understanding or improving the repo.

Better:

```text
Primary intent: understand opportunities.
Main recommendation: improve the project recap pattern so future repo reports align findings and next actions with the user's real goal.
```

Why better: it uses the artifact's evidence to improve the system that creates the next artifact.

## Primary intent

The primary intent is the main thing the user needs solved now.

Examples:

- "review this PR" -> decide whether to accept, revise, split, or reject it.
- "explain this architecture" -> understand the moving parts and risk boundaries.
- "compare tools" -> choose the best option for this user's constraints.
- "make a plan" -> know the safe sequence, checks, and rollback.
- "tune this prompt" -> produce a copy-ready instruction that prevents known failures.

The first screen must answer the primary intent directly.

## Obvious secondary intents

Secondary intents are not extra features. They are the useful adjacent needs already implied by the request.

Examples:

- A PR review also needs risk, tests, and next action.
- A plan review also needs missing assumptions and do-not-touch boundaries.
- A project recap also needs entry points and next safe step.
- A prompt tuner also needs failure modes, scenario tests, and export.
- A triage board also needs sorting criteria and a copyable decision.

Handle obvious secondary intents in the same artifact when they support the primary intent.

Do not add distant intents that turn the artifact into a dashboard.

## Base concept

The base concept is the simplest truth underneath the artifact.

Examples:

- Diff review: "What changed, what behavior changed, what could break, what should happen next."
- Architecture map: "Who talks to whom, through what boundary, with what failure risk."
- Plan review: "Does this plan match reality, and what must be verified before work starts."
- Ticket triage: "What matters most, why, and what should be done first."
- Prompt tuner: "What behavior should be forced, what failure should be prevented, what text should be exported."

If the base concept is not clear, the artifact will become decorative.

## Surprising ease opportunity

Every strong artifact should contain one moment of relief.

This is the part where the user thinks:

```text
I can see it now.
I know what to do.
I do not have to reconstruct this in my head.
```

Examples:

- one button exports the final prompt;
- one table separates facts from guesses;
- one timeline shows where the plan can fail;
- one comparison makes the recommended option obvious;
- one map reveals the risky boundary;
- one checklist turns review into action.

Do not force surprise through animation or visual tricks. It must come from clarity.

## Cognitive relief

The artifact must remove a specific burden from the user.

Good:

- "The user no longer has to compare three options across separate paragraphs."
- "The user can see the risky boundary instead of reconstructing it from file names."
- "The user can copy the final prompt instead of rewriting the recommendations."
- "The user can scan one timeline instead of reading logs linearly."

Bad:

- "The artifact is more visual."
- "The artifact looks nicer."
- "The artifact is interactive."

Visual output is justified only when it reduces reconstruction, comparison, memory load, simulation, or copy/edit friction.

## Output rules

The final artifact must include visible traces of the distillation:

- primary intent;
- secondary intents covered;
- base concept;
- decision supported;
- fastest next action.
- wall of text replaced;
- mental work removed.
- how the recommendation advances the primary intent;
- what useful context is preserved for the next agent or next command.

For small artifacts, this can be compact.

For serious artifacts, it must be explicit.

## Next-step input value

The artifact is not only a report. It is also input for the next step.

It must leave behind enough structured context that the next agent can continue without rereading everything.

Include when useful:

- current decision;
- recommended next command or prompt;
- evidence already inspected;
- open questions that matter;
- risks that would change the next action;
- files or modules to inspect next;
- acceptance criteria for the next step.

Do not include a large handoff block when the task is small. Keep it proportional.

## Hard fail conditions

Fail the artifact if:

- it does not answer the primary intent on the first screen;
- it ignores an obvious secondary intent that changes the user's decision;
- it handles many secondary intents but weakens the primary intent;
- it lets a secondary observation hijack the recommendation;
- the final action is true but not useful for the user's actual path;
- the artifact cannot serve as useful input to the next command when follow-up work is likely;
- the base concept is vague;
- the artifact makes the user work to discover the next action.
