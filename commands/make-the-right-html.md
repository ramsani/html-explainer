# /make-the-right-html

Generate a self-contained HTML artifact using the html-explainer operating model.

## Mandatory Process

1. Apply `docs/DECISION_GATE.md`.
2. Apply `docs/PATTERN_GUIDE.md`.
3. Open the selected `patterns/NN-*.md` file.
4. Inspect real sources before making claims.
5. Build a fact sheet with `docs/FACT_SHEET.md`.
6. Generate the smallest useful HTML artifact.
7. Apply `docs/STYLE.md`.
8. Apply `docs/QUALITY_BAR.md`.
9. Apply `docs/CHAIN.md` when follow-up work is likely.
10. Apply `docs/DELIVERY.md`.

Use `docs/reference/` only when a serious case needs deeper guidance.

## HTML Requirements

- Single self-contained HTML file.
- No external network dependency unless explicitly requested.
- System light/dark mode.
- Responsive layout.
- First screen shows intent, evidence basis, recommendation, risk, and next action.
- Facts, inferences, assumptions, and unknowns are separated.
- Interactive artifacts include copy/export output.
- Final response includes a clickable absolute path.

## Required Artifact Sections

- Intent.
- Why HTML beats Markdown.
- Artifact budget.
- Selected pattern.
- Evidence inspected.
- Fact sheet.
- Visual model.
- Risks and unknowns.
- Recommendation.
- Success criteria.
- Next action handoff with one recommended prompt and useful alternatives.

## Final Self-Check

Before responding:

- Did it answer the primary intent directly?
- Did every major section support that intent?
- Did it inspect evidence?
- Did it avoid unsupported claims?
- Did it use the smallest useful budget?
- Did HTML add visible structure, interaction, export, or faster decision?
- Did the first screen make the next decision obvious?
- Did the next prompt preserve intent, evidence, acceptance criteria, boundaries, and uncertainty?

## Final Chat Response

```text
Created:
Open:
Pattern:
Budget:
Decision supported:
Quality result:
Main uncertainty:
Next command:
```

Do not paste the full HTML into chat unless requested.
