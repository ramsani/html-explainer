# HTML Artifact Chains

Intent: use a small sequence of HTML artifacts when one artifact cannot carry exploration, decision, implementation, and verification well.

Keep chains short. The goal is momentum, not ceremony.

## Intent-led process browser

Treat artifact chains as an intent-led process browser:

```text
user intent -> evidence -> visual understanding -> decision -> next action -> next artifact or command
```

Each artifact is a stop in the user's path.

It must:

- answer the current intent;
- preserve context for the next step;
- make the next useful action selectable;
- offer copy/edit prompts for the three most logical next paths when follow-up work is likely;
- avoid turning the chain into ceremony.

The chain is successful when the user feels guided through the work without having to reconstruct the process in their head.

## Why

Some work is not a single answer. A useful HTML workflow may start with exploration, narrow into one direction, become an implementation plan, then become a review or handoff.

Markdown often turns this into one long file. HTML should instead create a readable path.

## Default chains

### Exploration to implementation

Use when the user is unsure which direction to take.

```text
Visual direction explorer or code approach comparison
-> deeper mockup, module map, or concept explainer
-> visual implementation plan
-> annotated diff review after implementation
```

### PR or code review

Use when changed code needs to be accepted, revised, split, or explained.

```text
annotated diff review
-> implementation fix prompt or test prompt
-> second diff review
-> share-ready PR summary
```

### Reentry to action

Use when the user returns to an old repo.

```text
project recap
-> module map or workflow flowchart
-> plan review
-> implementation or diff review
```

### Design and prototype

Use when UI taste, behavior, or interaction is unclear.

```text
design token reference sheet
-> visual direction explorer
-> component state matrix
-> microinteraction sandbox or flow prototype
-> implementation plan
```

### Research to decision

Use when the user needs to understand a topic before choosing.

```text
research comparison map
-> concept explainer
-> technical decision deck
-> implementation plan
```

## Chain rules

- Use one artifact at a time.
- Recommend the next artifact only when it removes real work.
- The next artifact or command must advance the original primary intent.
- Each step should narrow, deepen, implement, review, or hand off. If it does none of these, stop.
- Do not generate a chain automatically.
- Each artifact must stand alone.
- Each artifact must include a next action handoff.
- The next action handoff should include one recommended prompt and up to three distinct selectable prompts.
- Stop the chain when the next step is obvious enough to do directly.

## Handoff requirements

When an artifact is part of a chain, include:

- chain position: explore, deepen, plan, implement, review, share, or handoff;
- what this artifact decided;
- what remains undecided;
- next artifact or direct action;
- ready-to-run command or prompt.
- what context should carry forward.
- three logical copy/edit prompts when there are real branches.

## Good example

```text
Chain position: explore.
Decided: option B is the strongest onboarding direction.
Still open: exact empty/error/loading states.
Recommended next artifact: component state matrix.
Ready-to-run command:
/make-the-right-html create a component state matrix for onboarding option B, covering default, empty, loading, error, success, and mobile states.
```

## Bad example

```text
Next: make more HTML.
```

Why bad: it does not say what decision the next artifact should support.
