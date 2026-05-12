# Golden Outputs

Intent: define compact quality references for the outputs this repo should produce.

These are not full rendered artifacts. They are acceptance snapshots. Use them to judge whether generated HTML is delivering more value than Markdown.

## Golden 1: PR review

Input shape:

- changed files;
- behavior before/after;
- one blocking risk;
- one test gap;
- user needs accept/revise/split decision.

Expected output:

- first screen shows recommendation: accept, revise, reject, or split;
- changed files grouped by risk;
- inline or grouped findings cite file/line evidence;
- tests run and missing validation are separate;
- share-ready PR summary is present;
- agent reentry block states what to fix next;
- next action handoff includes ready-to-run `/check-the-diff` or fix prompt.

Hard fails:

- says tests passed without evidence;
- reviews filenames only;
- ends with vague advice;
- hides blocking risks below decoration.

## Golden 2: Visual exploration

Input shape:

- user is unsure about UI direction;
- product context and primary action are known;
- target state is empty, onboarding, component, or screen direction.

Expected output:

- 3-4 live alternatives are visible side by side;
- alternatives differ by product rationale, not only color;
- each alternative compares tone, density, primary action clarity, state fit, and surface resilience;
- recommendation explains when not to choose the other options;
- next action handoff points to component state matrix, implementation plan, or direct implementation.

Hard fails:

- decorative variants only;
- no clear primary action;
- no recommendation;
- no next artifact or direct action.

## Golden 3: Project reentry

Input shape:

- unfamiliar or old repo;
- user needs to know what it is, where to work, and what is risky.

Expected output:

- first screen states project identity, current state, risk, and next action;
- architecture map shows entry points and major flows;
- evidence inspected is visible;
- recent activity and constraints are separated from inference;
- reentry checklist is copyable;
- agent reentry block names files, boundaries, and validation;
- next action handoff recommends direct action or next artifact.

Hard fails:

- summarizes README only;
- no operational entry points;
- no risk or unknowns;
- user still has to invent the next prompt.

## Scoring rule

Use `docs/QUALITY_BAR.md`.

- 90-100: decision-ready.
- 75-89: useful, with known gaps.
- 60-74: partially useful.
- 0-59: weak or unsafe.

Reject any output that invents evidence, hides uncertainty, uses HTML only as decoration, or creates an editor without export.
