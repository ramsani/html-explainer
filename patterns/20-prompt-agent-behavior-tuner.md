# 20 — Prompt / Agent Behavior Tuner

Intent: tune prompts, agent instructions, rubrics, slash commands, skills, or behavior policies with visible trade-offs and exportable output.

Use when designing or improving agents, issue templates, review rubrics, coding rules, verifier behavior, planner behavior, or specialized skills.

Do not use for simple copyediting. Use this pattern when behavior, constraints, failure modes, and output contracts matter.

## What to inspect

Minimum inspection set:

- current prompt/instructions/skill file;
- desired behavior and target user workflow;
- known failure modes;
- examples of good and bad outputs;
- constraints, non-goals, and safety rules;
- expected output format;
- downstream tools or commands the agent will use;
- acceptance criteria for success.

## Evidence required

- current instruction text or summary;
- desired behavior dimensions;
- failure modes to prevent;
- required output contract;
- examples or scenarios to test;
- final exportable prompt/instruction set.

## Prompt template

```text
Generate a self-contained HTML prompt/agent behavior tuner.

Before generating HTML:
1. Inspect the current prompt, skill, command, rubric, or agent instructions.
2. Identify the user's real desired behavior.
3. Define operational behavior dimensions, not vague personality traits.
4. List failure modes and how the prompt should prevent them.
5. Provide a preview of expected output.
6. Include an exportable final prompt or instruction block.

The HTML must let the user tune behavior and copy the final usable instructions.
```

## Minimum HTML structure

Use an editor-like layout:

```text
<header>
  Agent/skill name, purpose, current risk level

<section id="evidence">
  Current prompt/instructions inspected

<section id="behavior-dimensions">
  Operational controls: evidence-first, minimal changes, autonomy, verbosity, risk tolerance, verification depth, tool discipline

<section id="failure-modes">
  Failure mode cards with prevention rules

<section id="output-contract">
  Required response structure and acceptance criteria

<section id="scenario-tests">
  Small test cases showing expected behavior

<section id="preview">
  Preview of resulting behavior

<section id="export">
  Copy/export final prompt, skill text, command, or rubric
```

Good visual forms:

- sliders/toggles for behavior dimensions;
- failure-mode cards;
- before/after prompt comparison;
- scenario test table;
- exportable final instruction block;
- quality checklist.

## Quality checklist

- Dimensions are operational and testable.
- Output is exportable.
- Failure modes are concrete.
- Acceptance criteria are explicit.
- The prompt prevents known bad behavior.
- Tool usage rules are clear when relevant.
- The final prompt is shorter where possible, but not at the cost of losing critical behavior.

## Bad artifact examples

Bad example 1:

```text
Make the agent more professional and concise.
```

Why bad: vague; no behavior contract, no examples, no failure modes.

Bad example 2:

```text
Creativity slider: low / medium / high.
```

Why bad: style tuning without operational effect.

Bad example 3:

```text
Here are suggestions, but no final prompt to copy.
```

Why bad: tuner must export usable instructions.

## Tie-breakers

- If reviewing an existing prompt against a rubric, combine with `16-audit-report.md`.
- If comparing multiple prompt strategies, use `01-code-approach-comparison.md` style comparison.
- If the output is a GitHub issue template, combine with `18-ticket-triage-board.md` only when prioritization is involved.
- If the prompt controls an HTML artifact generator, combine with `03-annotated-pr-diff-review.md` or the relevant artifact pattern as a scenario test.

## Failure modes

- Vague personality sliders.
- Style-only tuning.
- No acceptance criteria.
- No final export.
- No scenario tests.
- Instructions that conflict with tool capabilities.
- Overly broad prompts that hide the real behavior contract.
- Ignoring downstream agent/tool limitations.

## Acceptance criteria

The user can tune, review, and copy a better prompt, skill, command, or instruction set.

A strong tuner makes the desired behavior testable and reduces future agent ambiguity.
