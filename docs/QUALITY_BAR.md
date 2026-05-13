# HTML Artifact Quality Bar

An HTML artifact is acceptable only if it improves decision quality over a normal Markdown response.

## Required quality criteria

### 1. Decision value

The artifact must help the user decide, review, compare, diagnose, prioritize, teach, or act.

Reject artifacts that only look polished.

### 2. Cost effectiveness

The artifact must justify its cost.

It must declare:

- artifact budget: compact, standard, or interactive;
- HTML advantage: interaction, visible structure, concrete output, or 5-second decision;
- why HTML beats Markdown here;
- what wall of text or mental reconstruction it replaces;
- what complexity guard keeps it small enough.
- what lean rendering guard prevents CSS/JS bloat.
- what decision cost makes HTML worth the extra tokens.

If the HTML costs more attention than the problem itself, use Markdown or shrink the artifact.

Add credit when HTML is used at a real decision crossroads.
Subtract 15 if HTML is used for a low-consequence choice that Markdown would cover.

### 3. HTML advantage

The artifact must pass at least one advantage test:

- interaction removes manual work;
- structure becomes visible;
- a concrete output is produced;
- the first screen decides in 5 seconds.

If none of these are true, the artifact should be Markdown.

### 4. Intent fit

The artifact must answer the user's main intent directly.

It must show:

- primary intent;
- obvious secondary intents covered;
- base concept;
- decision supported;
- fastest path to value.

Secondary intents are allowed only when they strengthen the main intent.

Every major finding, risk, recommendation, and next action must be aligned to the primary intent.

Subtract 20 if the artifact is accurate but optimizes for a secondary issue.
Subtract 20 if the final recommendation does not move the user toward the stated goal.
Subtract 10 if the artifact fails to preserve useful context for the next command when follow-up work is likely.

### 5. First-screen usefulness

The first screen must make the artifact's value obvious.

It must show:

- what the artifact is;
- what decision it supports;
- what was inspected;
- the recommendation or next action;
- the main risk or uncertainty.

If the user must scroll past decoration to understand why the artifact exists, revise it.

### 6. Evidence visibility

The artifact must show what was inspected:

- files
- diffs
- commands
- docs
- issues
- PRs
- user input
- external sources when used

### 7. Fact / inference / unknown separation

The artifact must clearly separate:

- verified facts
- inferences
- unknowns
- unsupported claims

The artifact must also separate:

- repo/product files;
- local generated session artifacts;
- candidate examples;
- ignored or intentionally untracked files.

### 8. Correct pattern fit

The artifact must use the right form for the work:

- comparison for alternatives
- map for architecture
- timeline for incidents
- matrix for design states
- live alternatives for visual direction
- editor for triage/config/prompt tuning
- annotated review for diffs

### 9. UX and interaction fit

The user experience must match the task.

Required:

- clear scan path;
- useful navigation for artifacts with four or more sections;
- responsive layout;
- readable contrast;
- no overlapping text;
- interaction only when it changes understanding, comparison, tuning, or export.

Interactive controls must have visible state changes and usable output.

### 10. Smallest useful artifact

Do not build dashboards by default.

Use one primary pattern and at most two supporting sections.

Apply `docs/LEAN_HTML_RENDERING.md`.

Subtract 15 if CSS/JS feels larger than the decision deserves.
Subtract 10 if repeated styling or repeated prose could be collapsed into reusable primitives.

### 11. Visual clarity

The visual structure must reduce cognitive load.

Avoid:

- decorative charts
- repeated prose in boxes
- dense panels
- unclear color meaning
- hidden controls

### 12. Safety and uncertainty

Risk-bearing claims must be visible and qualified.

Examples:

- production impact
- auth/payment impact
- data migration impact
- security impact
- breaking API changes
- cost/performance claims

### 13. Exportability for editors

Interactive artifacts must produce usable output:

- Markdown
- JSON
- config
- issue body
- prompt
- checklist

If the user cannot copy or export the result, the editor is incomplete.

### 14. Self-contained output

Prefer one self-contained HTML file with inline CSS and JS.

External dependencies require explicit justification.

### 15. Next action handoff

The artifact must end with a concrete next action handoff:

- one recommended action;
- one short reason;
- one copy-ready prompt the user can paste and edit;
- three logical selectable options when follow-up work is likely;
- each option states when to choose it, why it helps, and a copy/edit prompt.

Do not auto-chain commands without user approval.

Subtract 15 if the user still has to invent the next command.
Subtract 10 if there are too many next-step options.
Subtract 10 if the options are wording variants instead of real paths.
Subtract 10 if the prompts do not preserve the primary intent and useful evidence.

### 15b. Delivery friction

Apply `docs/HTML_DELIVERY.md`.

Add credit when:

- the artifact is saved to a reasonable path;
- the final response includes a clickable absolute path;
- the artifact opens automatically when tool access allows it;
- the chat response stays short and points to the artifact.

Subtract 15 if the user has to ask where the file is.
Subtract 10 if only a relative path is provided.

### 16. Loop and reentry value

The artifact should keep the user or next agent in the loop.

Add credit when it includes:

- a clear choice the user is being invited to make;
- something inspectable without reading the full document;
- a way to compare, filter, edit, challenge, or export when useful;
- chain position when the work is part of exploration -> plan -> review;
- share-ready summary for another human;
- agent reentry block for later implementation or verification;
- clear statement of what was decided and what remains open.

Subtract 10 if a serious plan, PR review, recap, or report cannot be shared or reused without the original chat.
Subtract 20 if the artifact is technically correct but unlikely to be read or acted on.

### 16b. Process capsule

Apply `docs/PROCESS_CAPSULE.md` when follow-up work is likely.

Add credit when the artifact includes:

- process stage;
- primary intent;
- decision so far;
- evidence used;
- open risks or unknowns;
- recommended next prompt;
- success criteria for the next step.

Add credit when the capsule is also available as a compact JSON block.

Subtract 10 if the artifact is part of a chain but does not preserve process state.
Subtract 10 if the process capsule is too long.
Subtract 15 if the capsule loses or changes the user's primary intent.

### 17. Explainer clarity

Apply `docs/EXPLAINER_CLARITY.md`.

Add credit when:

- the first screen names what the reader came to do;
- the main answer is understandable in 30 seconds;
- the artifact includes a visual model that explains the core concept;
- next options match likely user intent;
- technical terms are translated into action language.

Subtract 20 if the artifact is mostly a technical inventory.
Subtract 15 if next options are unlikely or scary for the situation.
Subtract 10 if it mixes languages in a way that makes reading harder.
Subtract 15 if it treats local generated HTML as the main product risk without evidence that it affects users.
Subtract 15 if it claims CI, tags, or validation gaps without inspecting the relevant source first.

### 18. Visual explainer value

Apply `docs/VISUAL_EXPLAINER_PLAYBOOK.md`.

Add credit when:

- the primary visual model matches the selected pattern;
- the first screen uses that model to answer the main decision;
- interaction changes understanding or exports output;
- the artifact uses maps, flows, matrices, timelines, ladders, sandboxes, or editors instead of prose cards.

Subtract 20 if the artifact could be pasted into Markdown with little loss.
Subtract 15 if it uses cards/tables only when a stronger visual model was available.
Subtract 15 if interaction is decorative.

### 19. Visual style quality

Apply `docs/VISUAL_STYLE_STANDARD.md`.

Add credit when:

- the artifact supports system light/dark mode;
- the design is minimal, flat, elegant, and professional;
- color is restrained and meaningful;
- layout resembles a readable document or small tool, not a generic dashboard;
- inline SVG/HTML/CSS carries the explanation without external assets.

Subtract 20 if the artifact is dark-only without reason.
Subtract 15 if it uses generic dashboard styling.
Subtract 15 if it relies on decorative gradients, glow, or visual noise.

## Visual exploration overlay

Apply this when the artifact explores UI directions.

Required:

- 3-4 live rendered alternatives;
- tone comparison;
- density comparison;
- primary action clarity comparison;
- light/dark or surface resilience when relevant;
- recommendation by product context.

Subtract 15 if alternatives are only decorative style swaps.

## UX scoring overlay

Apply this overlay after the base score:

- subtract 10 if the first screen does not answer the decision;
- subtract 15 if no artifact budget is declared;
- subtract 20 if no HTML advantage is declared;
- subtract 15 if HTML does not clearly beat Markdown;
- subtract 15 if the primary intent is not answered directly;
- subtract 10 if an obvious secondary intent is missing and affects the decision;
- subtract 10 if the base concept is vague or hidden;
- subtract 10 if evidence is present but hard to find;
- subtract 10 if mobile layout is visibly broken;
- subtract 15 if an interactive artifact has no exportable output;
- subtract 15 if the artifact repeats Markdown in decorative cards;
- subtract 20 if the visual form does not match the work.

## Scoring

Use this score when auditing an artifact:

- 90-100: strong, decision-ready
- 75-89: useful, minor gaps
- 60-74: partially useful, must revise before relying on it
- 40-59: weak, mostly presentation
- 0-39: unsafe or misleading

## Hard fail conditions

Fail the artifact if it:

- invents inspected files or commands;
- makes stale or unverified repo claims that change the recommendation;
- does not justify the cost of HTML;
- does not pass any HTML advantage test;
- should have been Markdown;
- misses the user's primary intent;
- handles secondary intents while weakening the main answer;
- hides the base concept;
- hides uncertainty;
- recommends action without evidence;
- uses HTML only as decoration;
- claims tests passed without proof;
- creates an editor with no exportable output;
- hides the main recommendation;
- is unreadable or incoherent on mobile;
- makes unsupported security, production, or data claims.
