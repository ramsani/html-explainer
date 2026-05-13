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
- validation is explicit;
- no option is evaluated only by vibes.

Failure modes:
- picking an approach before inspection;
- hiding assumptions;
- omitting maintenance cost;
- comparing imaginary files.

Acceptance criteria:
The user can choose an approach without needing to reconstruct the trade-offs from prose.

## Tie-breakers

Use comparison when there are multiple viable implementation paths. Use visual implementation plan after one approach has already been chosen.

## Human interface contract

Apply `docs/HUMAN_INTERFACE.md`. The artifact must recommend one best next move while keeping optional actions visible: continue, revise, compare, think this through, save for later, or stop when enough. Any interaction must give the user real control, not decoration.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
