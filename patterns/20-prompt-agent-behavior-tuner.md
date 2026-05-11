# 20 — Prompt / Agent Behavior Tuner

Intent: tune prompts, agent instructions, rubrics, or skills with visible trade-offs and exportable output.

Use when designing agents, slash commands, skills, issue templates, review rubrics, or behavior policies.

Evidence required: current prompt/instructions, desired behavior, failure modes, expected outputs, constraints, examples.

Prompt template:
```text
Generate a self-contained HTML prompt/agent behavior tuner. Inspect the current instructions first. Show behavior dimensions, trade-offs, failure modes, expected output, preview, and final exportable prompt.
```

HTML structure: intent, evidence, current behavior, controls/dimensions, failure modes, output preview, final prompt export, checklist.

Quality checklist: dimensions are operational, output is exportable, failure modes are concrete.

Failure modes: vague personality sliders, style-only tuning, no acceptance criteria, no final export.

Acceptance criteria: the user can tune and copy a better prompt or agent instruction set.
