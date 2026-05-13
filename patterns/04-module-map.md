# 04 — Module Map

Intent: understand a repo area before modifying it.

Use when the user asks to work inside an unfamiliar module, package, feature area, or workflow.

Do not use when the relevant code path is already obvious and small.

Evidence required:
- entry points;
- module files;
- imports/exports;
- call/data flow;
- tests;
- neighboring modules.

Prompt template:
```text
Generate a self-contained HTML module map. Inspect the module and adjacent files first. Show entry points, responsibilities, dependencies, data flow, hot paths, gotchas, and safe modification boundaries.
```

HTML structure:
- intent;
- evidence inspected;
- module responsibility summary;
- entry points;
- dependency map;
- data/control flow;
- hot paths;
- gotchas;
- safe edit zones;
- unknowns.

Quality checklist:
- runtime behavior is distinguished from folder structure;
- dependencies are real;
- safe boundaries are practical;
- entry points are concrete;
- hidden coupling is called out.

Failure modes:
- summarizing folders only;
- mapping the whole repo unnecessarily;
- inventing call paths;
- ignoring tests.

Acceptance criteria:
The user can understand where to change code and what not to touch.

## Tie-breakers

Use module map for one repo area. Use architecture diagram when the question spans services, boundaries, data flow, or operational risk.

## Human interface contract

Apply `docs/HUMAN_INTERFACE.md`. The artifact must recommend one best next move while keeping optional actions visible: continue, revise, compare, think this through, save for later, or stop when enough. Any interaction must give the user real control, not decoration.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
