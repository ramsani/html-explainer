# Demo: Why This Exists

`html-explainer` is easiest to understand through a before/after.

The goal is not to make a prettier document. The goal is to trade an output the user would skim for one they can read, trust, and continue from.

## The Test Case

User request:

```text
Review this repo and tell me what HTML artifact would help me understand the biggest opportunity. Do not generate the final artifact yet.
```

## Before: Pretty But Weak

A weak response often looks organized, but it leaves work on the user:

- It summarizes the repo.
- It recommends an artifact.
- It says HTML would be useful.
- It gives a vague next step.

The user still has to figure out:

- what evidence was inspected;
- what is fact versus inference;
- why HTML beats Markdown here;
- what risk matters first;
- what exact next command should be run.

That output is readable, but it is not a decision surface.

## After: Intent-Led Explainer

A strong `html-explainer` output must make these visible:

- primary intent;
- obvious secondary intents;
- base concept;
- inspected evidence;
- facts, inferences, and unknowns;
- HTML advantage over Markdown;
- artifact budget;
- recommendation;
- next prompt that preserves context.

The result should let the user answer in under 60 seconds:

```text
What is this?
Why should I trust it?
What should I do next?
What should I not do yet?
```

## Demo Artifact

Open:

```text
examples/before-after-decision.example.html
```

It shows the same task as:

- a weak Markdown-style answer;
- an intent-led HTML answer;
- the concrete difference in user value.

## What This Proves

The system is valuable only when it removes mental work.

HTML is justified when it helps the user compare, inspect, filter, tune, export, or continue work better than a flat answer.

If an artifact cannot show that advantage, use Markdown or a short chat answer instead.
