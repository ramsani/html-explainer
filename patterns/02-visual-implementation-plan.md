# 02 — Visual Implementation Plan

Intent: turn a chosen approach into a reviewable, executable plan.

Use when an agent may implement next and the plan must be checked before code changes.

Do not use when the task is a trivial one-file edit.

Evidence required:
- goal;
- repo structure;
- likely files;
- dependencies;
- tests/checks;
- constraints and non-goals.

Prompt template:
```text
Generate a self-contained HTML visual implementation plan. Inspect the repo first. Show phases, dependency order, affected files, validation points, rollback path, risks, and definition of done.
```

HTML structure:
- intent;
- evidence inspected;
- current state;
- proposed stages;
- file/change map;
- validation checkpoints;
- rollback plan;
- risks and unknowns;
- definition of done.

Quality checklist:
- plan maps to real files;
- sequence is logical;
- validation is explicit;
- rollback or recovery is named;
- scope boundaries are visible.

Failure modes:
- broad refactor disguised as small plan;
- no rollback;
- no checks;
- unsupported file assumptions.

Acceptance criteria:
A coding agent can execute the plan with low ambiguity and the user can approve or reject it safely.

## Tie-breakers

Use implementation plan when the direction is already chosen. Use code approach comparison when the user still needs to choose between paths.

## Human interface contract

Apply `docs/HUMAN_INTERFACE.md`. The artifact must recommend one best next move while keeping optional actions visible: continue, revise, compare, think this through, save for later, or stop when enough. Any interaction must give the user real control, not decoration.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
