# HTML Artifact Quality Bar

An HTML artifact is acceptable only if it improves decision quality over a normal Markdown response.

## Required quality criteria

### 1. Decision value

The artifact must help the user decide, review, compare, diagnose, prioritize, teach, or act.

Reject artifacts that only look polished.

### 2. First-screen usefulness

The first screen must make the artifact's value obvious.

It must show:

- what the artifact is;
- what decision it supports;
- what was inspected;
- the recommendation or next action;
- the main risk or uncertainty.

If the user must scroll past decoration to understand why the artifact exists, revise it.

### 3. Evidence visibility

The artifact must show what was inspected:

- files
- diffs
- commands
- docs
- issues
- PRs
- user input
- external sources when used

### 4. Fact / inference / unknown separation

The artifact must clearly separate:

- verified facts
- inferences
- unknowns
- unsupported claims

### 5. Correct pattern fit

The artifact must use the right form for the work:

- comparison for alternatives
- map for architecture
- timeline for incidents
- matrix for design states
- editor for triage/config/prompt tuning
- annotated review for diffs

### 6. UX and interaction fit

The user experience must match the task.

Required:

- clear scan path;
- useful navigation for artifacts with four or more sections;
- responsive layout;
- readable contrast;
- no overlapping text;
- interaction only when it changes understanding, comparison, tuning, or export.

Interactive controls must have visible state changes and usable output.

### 7. Smallest useful artifact

Do not build dashboards by default.

Use one primary pattern and at most two supporting sections.

### 8. Visual clarity

The visual structure must reduce cognitive load.

Avoid:

- decorative charts
- repeated prose in boxes
- dense panels
- unclear color meaning
- hidden controls

### 9. Safety and uncertainty

Risk-bearing claims must be visible and qualified.

Examples:

- production impact
- auth/payment impact
- data migration impact
- security impact
- breaking API changes
- cost/performance claims

### 10. Exportability for editors

Interactive artifacts must produce usable output:

- Markdown
- JSON
- config
- issue body
- prompt
- checklist

If the user cannot copy or export the result, the editor is incomplete.

### 11. Self-contained output

Prefer one self-contained HTML file with inline CSS and JS.

External dependencies require explicit justification.

### 12. Next action

The artifact must end with a concrete next action or recommendation.

## UX scoring overlay

Apply this overlay after the base score:

- subtract 10 if the first screen does not answer the decision;
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
- hides uncertainty;
- recommends action without evidence;
- uses HTML only as decoration;
- claims tests passed without proof;
- creates an editor with no exportable output;
- hides the main recommendation;
- is unreadable or incoherent on mobile;
- makes unsupported security, production, or data claims.
