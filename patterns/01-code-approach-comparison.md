# 01 — Code Approach Comparison

Intent: compare multiple implementation approaches before choosing one.

Use when the task has two or more plausible technical paths and choosing poorly would create rework.

Do not use when there is one obvious small fix.

Evidence required:
- user goal;
- relevant repo files or docs;
- constraints;
- existing patterns in the codebase;
- risk-bearing assumptions.

Prompt template:
```text
Generate a self-contained HTML code approach comparison. Compare at least two approaches side by side. Inspect real repo evidence first. Include trade-offs, affected files, risks, validation, and a recommendation.
```

HTML structure:
- intent;
- problem statement;
- evidence inspected;
- alternatives side by side;
- complexity/cost/risk matrix;
- recommended option;
- when not to choose each option;
- next safe step.

Quality checklist:
- alternatives are meaningfully different;
- recommendation follows constraints;
- risks are concrete;
- no option is evaluated only by vibes.

Failure modes:
- picking an approach before inspection;
- hiding assumptions;
- omitting maintenance cost;
- comparing imaginary files.

Acceptance criteria:
The user can choose an approach without needing to reconstruct the trade-offs from prose.
