# /html-audit-artifact

Audit an existing HTML artifact or proposed HTML artifact against the html-explainer quality bar.

## Intent

Decide whether an HTML artifact is useful, safe, evidence-backed, and decision-ready.

## Mandatory process

1. Identify the artifact's primary pattern.
2. Compare it against the matching pattern file in `patterns/`.
3. Apply `docs/HTML_UX_STANDARD.md`.
4. Apply `docs/QUALITY_BAR.md`.
5. Check whether the artifact improves decision quality over Markdown.
6. Separate defects by severity.
7. Recommend accept, revise, reject, or simplify to Markdown.

## Audit criteria

Score 0-100 across:

- pattern fit;
- decision value;
- evidence visibility;
- fact/inference/unknown separation;
- first-screen usefulness;
- UX fit;
- visual clarity;
- interaction usefulness if applicable;
- exportability if interactive;
- risk visibility;
- simplicity;
- next-action clarity.

## Output format

```text
Intent:
Artifact pattern:
Score:
Recommendation: accept | revise | reject | simplify to Markdown

Critical issues:
High-value fixes:
Evidence gaps:
UX gaps:
Overengineering or decoration:
Next action:
```

## Hard fail conditions

Fail the artifact if it:

- invents inspected evidence;
- hides uncertainty;
- claims tests passed without proof;
- recommends production/security/data changes without evidence;
- uses HTML only as decoration;
- creates an interactive tool without exportable output.
- hides the main recommendation below decoration;
- is unreadable or incoherent on mobile.
