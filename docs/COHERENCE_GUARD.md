# Coherence Guard

Intent: prevent `html-explainer` from becoming a pile of impressive ideas with no simple center.

Use this before adding new rules, docs, patterns, sections, gates, examples, or commands.

## Core thesis

`html-explainer` is not a framework for everything.

It is an intent-led process browser for agent work:

```text
intent -> evidence -> visual understanding -> decision -> expert next prompt
```

Everything in the repo must serve that path.

## The coherence test

Before adding or keeping a concept, answer:

```text
1. Which user intent does this improve?
2. What work does it remove for the user or next agent?
3. What failure does it prevent?
4. Where does it belong in the process?
5. Can it be expressed as a small rule instead of a new subsystem?
6. What should be removed, merged, or shortened because this exists?
```

If any answer is weak, do not add the concept yet.

## Rent test

Every piece must pay rent.

Accepted rent:

- improves decision quality;
- reduces ambiguity;
- preserves intent across steps;
- prevents unsupported claims;
- makes the next prompt more executable;
- reduces token, reading, or reconstruction cost;
- prevents unsafe action;
- improves share/reentry value.

Not rent:

- sounds smart;
- looks complete;
- copies a source repo's structure;
- adds a new term without changing behavior;
- makes the repo feel more impressive;
- covers an edge case no generated artifact is likely to hit.

## Integration rule

A new concept must attach to an existing layer:

- intent;
- evidence;
- visual model;
- artifact budget;
- quality bar;
- process capsule;
- next prompt;
- delivery.

If it needs a new layer, it must replace or simplify an older one.

## KISS limits

- Prefer one rule over one document.
- Prefer one document over one command.
- Prefer one command over a workflow.
- Prefer a copy/edit prompt over automation.
- Prefer a gate over a long checklist.
- Prefer deleting or merging stale rules over adding new ones.

## Anti-Frankenstein checks

Reject or revise if:

- a user cannot explain what the repo does in one sentence;
- the README reads like a list of inspirations instead of one product;
- a generated artifact has more process than insight;
- a next prompt is longer than the useful context it preserves;
- a rule is not tied to a real failure mode observed in artifacts;
- two docs describe the same obligation with different names;
- a feature would make the tool harder to try in the first five minutes.

## One-sentence product check

The repo must always be explainable as:

```text
html-explainer helps agents create browser-readable decision artifacts that preserve intent, evidence, and the next expert prompt.
```

If a new idea does not fit that sentence, it belongs elsewhere.

## Pruning rule

When adding a new rule, look for something to:

- merge;
- shorten;
- demote to an example;
- move to credits/changelog;
- delete later if it does not affect output.

The system should get sharper as it grows, not heavier.
