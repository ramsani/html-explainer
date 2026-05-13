# 22 — Insight Surface Loop

Intent: help the user think through a topic iteratively and reach clearer insight, stronger conclusions, better next actions, and reusable local knowledge through a decision-ready HTML thinking surface.

Use when the user asks to think through, explore, clarify, stress-test, decide, or reason about a topic, idea, strategy, problem, opportunity, or unclear question.

Do not use for simple factual answers, single commands, tiny edits, or low-consequence notes where Markdown is enough.

## What to inspect

Minimum inspection set:

- the user's topic or idea;
- the real decision or insight sought;
- known context;
- stated constraints;
- available evidence;
- missing evidence;
- assumptions;
- risks and failure modes;
- intended next action;
- whether the output should be preserved in local artifact memory.

## Evidence required

- user-provided topic or question;
- context and constraints;
- facts or sources inspected, if any;
- explicit assumptions;
- unknowns;
- reasoning lenses used;
- provisional conclusion and confidence basis;
- next action and next prompt.

## Prompt template

```text
Generate a self-contained HTML Insight Surface using the Insight Surface Loop.

Before generating HTML:
1. Identify the real question behind the user's topic.
2. Decide whether HTML is justified over Markdown.
3. Separate facts, evidence, inferences, assumptions, hypotheses, unknowns, and constraints.
4. Expand the thinking space with useful perspectives and alternatives.
5. Stress-test the idea with stress testing and pre-mortem thinking.
6. Synthesize a provisional insight or explain why one is not justified.
7. Recommend the smallest useful next action.
8. Produce a copy-ready prompt for the next thinking cycle.
9. Recommend whether to preserve the artifact in local artifact memory.

The HTML must help the user think better, not merely read more.
```

## Minimum HTML structure

Use a thinking-surface layout:

```text
<header>
  Topic, real question, provisional conclusion, confidence, next action

<section id="north-star">
  Why this matters, desired insight, current decision state

<section id="evidence-board">
  Facts, evidence, constraints, unknowns, freshness risk

<section id="perspective-map">
  Perspectives, alternatives, stakeholders, hidden options, second-order effects

<section id="tension-map">
  Contradictions, trade-offs, weakest assumptions, risks

<section id="stress-test-panel">
  How this fails, what to avoid, what would make the conclusion wrong

<section id="insight-card">
  Strongest insight, provisional conclusion, confidence basis, what changed

<section id="action-queue">
  Do now, test next, investigate, stop doing, defer/discard

<section id="preserve-reenter">
  Archive recommendation, artifact memory class, tags, next prompt
```

Good visual forms:

- first-screen decision card;
- evidence/assumption split board;
- perspective cards;
- tension/risk matrix;
- stress-test panel;
- insight card;
- action queue;
- copyable next prompt;
- archive recommendation card.

## Quality checklist

- The real question is clearer than the original user topic.
- HTML is justified by visible multi-layer thinking.
- Facts, inferences, assumptions, hypotheses, and unknowns are separated.
- At least one serious tension or risk is surfaced.
- Stress testing or pre-mortem is present.
- The provisional conclusion is explicit, or the artifact clearly explains why it is not justified.
- The next action is concrete.
- The next prompt is copy-ready and preserves context.
- Archive recommendation is included.
- The artifact avoids generic advice and fake certainty.

## Bad artifact examples

Bad example 1:

```text
Here are pros and cons of your idea.
```

Why bad: generic; no evidence discipline, no stress test, no provisional conclusion, no next cycle.

Bad example 2:

```text
A beautiful mind map with many branches but no conclusion.
```

Why bad: visual complexity without decision or action.

Bad example 3:

```text
Confidence: 92%.
```

Why bad: fake precision unless the score is derived from a visible rubric.

## Tie-breakers

- If the user asks for a decision between options, combine with `01-code-approach-comparison.md` or `11-technical-decision-deck.md` style structure.
- If the user asks to understand a repo, use `17-project-recap.md` unless the explicit request is to think through a broader idea.
- If the user asks to tune an agent or prompt, use `20-prompt-agent-behavior-tuner.md` unless the main need is exploratory thinking.
- If the user asks for incident/failure learning, combine with `15-incident-postmortem-report.md`.
- If the output cannot produce action or next prompt, simplify to Markdown.

## Failure modes

- Turning the artifact into a generic brainstorm.
- Overloading the user with theory names.
- Skipping evidence separation.
- Confirming the user's initial belief without stress testing it.
- Producing a beautiful diagram with no conclusion.
- Inventing facts, metrics, sources, or confidence.
- Ending without a next action.
- Ending without a copy-ready next prompt.
- Archiving low-value scratch thinking as if it were durable knowledge.
- Using HTML when Markdown is clearly enough.

## Acceptance criteria

The user can see the topic, real question, provisional conclusion, risk, next action, and next prompt without doing extra interpretation work.

A strong Insight Surface makes the user's next better thought obvious.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` and `docs/INSIGHT_SURFACE_LOOP.md`. The artifact must include a decisive first screen, evidence separation, stress testing, synthesis, action, and re-entry prompt. It must explain why HTML is substantially better than Markdown for this thinking task.
