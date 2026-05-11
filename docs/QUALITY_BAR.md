# HTML Artifact Quality Bar

An HTML artifact is acceptable only if it improves decision quality over a normal Markdown response.

## Required quality criteria

### 1. Decision value

The artifact must help the user decide, review, compare, diagnose, prioritize, teach, or act.

Reject artifacts that only look polished.

### 2. Evidence visibility

The artifact must show what was inspected:

- files
- diffs
- commands
- docs
- issues
- PRs
- user input
- external sources when used

### 3. Fact / inference / unknown separation

The artifact must clearly separate:

- verified facts
- inferences
- unknowns
- unsupported claims

### 4. Correct pattern fit

The artifact must use the right form for the work:

- comparison for alternatives
- map for architecture
- timeline for incidents
- matrix for design states
- editor for triage/config/prompt tuning
- annotated review for diffs

### 5. Smallest useful artifact

Do not build dashboards by default.

Use one primary pattern and at most two supporting sections.

### 6. Visual clarity

The visual structure must reduce cognitive load.

Avoid:

- decorative charts
- repeated prose in boxes
- dense panels
- unclear color meaning
- hidden controls

### 7. Safety and uncertainty

Risk-bearing claims must be visible and qualified.

Examples:

- production impact
- auth/payment impact
- data migration impact
- security impact
- breaking API changes
- cost/performance claims

### 8. Exportability for editors

Interactive artifacts must produce usable output:

- Markdown
- JSON
- config
- issue body
- prompt
- checklist

If the user cannot copy or export the result, the editor is incomplete.

### 9. Self-contained output

Prefer one self-contained HTML file with inline CSS and JS.

External dependencies require explicit justification.

### 10. Next action

The artifact must end with a concrete next action or recommendation.

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
- makes unsupported security, production, or data claims.
