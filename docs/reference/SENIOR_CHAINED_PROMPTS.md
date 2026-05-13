# Senior Chained Prompts

Intent: make next-step prompts sound like they were written by a strong engineer who knows how to hand work to another capable agent.

Use this with `docs/NEXT_ACTION_HANDOFF.md` and `docs/PROCESS_CAPSULE.md`.

Inspired by patterns from Matt Pocock's agent skills: small composable skills, durable briefs, shared language, vertical slices, feedback loops, behavioral contracts, and explicit scope boundaries.

For serious staged work, also apply `docs/EXPERT_PROMPT_GATES.md`. It adds the compact senior constraints that make prompts technically forceful: result to protect, evidence required, out of scope, block conditions, and validation loop.

## Core rule

A chained prompt is not a casual suggestion.

It is a compact work brief.

It must tell the next agent:

- what user outcome to preserve;
- what decision was already made;
- what evidence was already inspected;
- what behavior or decision should change next;
- what boundaries must not be crossed;
- how to know the next step is done.

## Prompt shape

Use this shape for important follow-up prompts:

```text
Use this artifact as context.

Primary intent:
<preserve the user's original goal>

Decision so far:
<what this artifact clarified or chose>

Next job:
<one concrete outcome for the next agent>

Work from:
<evidence already inspected, concepts, constraints, or process capsule>

Output should include:
<the next artifact, plan, diff review, prompt, issue, checklist, or decision>

Result to protect:
<what must remain true if the next step succeeds>

Evidence required:
<what the next agent must verify before claiming success>

Acceptance criteria:
- <specific, observable criterion>
- <specific, observable criterion>
- <specific, observable criterion>

Out of scope:
- <what not to change, reopen, or overbuild>

Block if:
- <condition that should stop the next agent>
```

Keep it short enough to paste and edit.

## Senior prompt principles

### 1. Durable over brittle

Prefer behavior, contracts, concepts, and interfaces over line numbers or fragile file paths.

Good:

```text
Identify the command flow that decides whether HTML is justified, then show where the next-step prompt contract should be enforced.
```

Bad:

```text
Edit line 42 in commands/make-the-right-html.md.
```

Use file paths only when they are evidence or obvious entry points.

### 2. Behavioral, not procedural

Describe what the system should do, not every mechanical edit.

Good:

```text
The artifact should end with three distinct next-step prompts: deepen, act, and change direction.
```

Bad:

```text
Add another bullet list somewhere near the bottom.
```

### 3. Acceptance criteria are mandatory

The next agent must know when it is done.

Good:

```text
Acceptance criteria:
- The recommended prompt preserves the primary intent.
- Each option has a different purpose.
- Each option includes when to choose it and a copy/edit prompt.
```

Bad:

```text
Make the prompts better.
```

### 4. Scope boundaries prevent drift

Every serious chained prompt should include what not to do.

Examples:

- Do not re-summarize the README.
- Do not reopen a decision this artifact already settled.
- Do not add a new command unless the existing command cannot express the path.
- Do not generate HTML if Markdown is enough for the next step.
- Do not turn a process capsule into a database or app runtime.

### 5. Use vertical next steps

A follow-up should produce one complete, verifiable slice.

Prefer:

```text
Generate an implementation plan for improving project recap next-step prompts, including validation and acceptance criteria.
```

Avoid:

```text
Improve docs, examples, commands, and future architecture.
```

### 6. Use feedback loops

When the next step changes code, prompts, or docs, include the validation loop.

Examples:

- run the local validation scripts;
- audit one generated artifact against the quality bar;
- compare before/after outputs;
- rerun the same command on the same repo;
- verify the process capsule is present and useful.

### 7. Name the protected result

Strong prompts say what they protect.

Examples:

- protect user trust in a demo;
- protect an auth/data boundary;
- protect rollback ability;
- protect vertical-slice delivery;
- protect evidence over narrative;
- protect a workflow from duplicate side effects;
- protect the user's original intent from scope drift.

If the prompt cannot name the protected result, the next step is not sharp enough.

### 8. Ask only when the answer changes the work

If a question can be answered from the repo, inspect the repo instead.

If a question requires user taste or business intent, ask one focused question or present a recommended default.

### 9. Preserve shared language

Use the same terms the artifact established:

- primary intent;
- secondary intents;
- result to protect;
- process stage;
- decision so far;
- evidence used;
- evidence required;
- acceptance criteria;
- out of scope;
- block if;
- next prompt.

Do not rename the same concept across prompts.

## Three-option design

When offering three follow-up prompts, make them genuinely different.

Use this default trio:

1. **Deepen understanding**
   - Best when the user is still unsure.
   - Produces another explainer, map, comparison, or focused analysis.
2. **Turn into action**
   - Best when the user accepts the recommendation.
   - Produces a plan, issue, implementation prompt, or verification path.
3. **Change direction**
   - Best when the user disagrees, wants lower cost, or wants broader comparison.
   - Produces an audit, alternative comparison, simplification, or Markdown-only path.

For code review, use:

1. Fix blockers.
2. Verify before accepting.
3. Split or document risk.

For design, use:

1. Explore more directions.
2. Pick one and plan implementation.
3. Build a tuning prototype.

For repo reentry, use:

1. Deepen one risky area.
2. Turn the top opportunity into a plan.
3. Audit the current artifact quality.

## Hard fails

Revise the prompt options if:

- they sound generic;
- they are merely different wording for the same path;
- they omit acceptance criteria;
- they omit the result to protect when the next step is serious;
- they omit evidence required for a claim of success;
- they omit block conditions for risky work;
- they do not preserve the primary intent;
- they tell the next agent exactly where to edit without explaining the desired behavior;
- they make the user choose between vague actions like "continue", "improve", or "analyze more";
- they cannot be pasted directly into an agent.
