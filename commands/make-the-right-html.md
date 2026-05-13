# /make-the-right-html

Generate a self-contained HTML artifact using the html-explainer operating model.

## Mandatory Process

1. Apply `docs/DECISION_GATE.md`.
2. Apply `docs/LANGUAGE_POLICY.md`.
3. Apply `docs/PATTERN_GUIDE.md`.
4. Open the selected `patterns/NN-*.md` file.
5. Inspect real sources before making claims.
6. Build a fact sheet with `docs/FACT_SHEET.md`.
7. Generate the smallest useful HTML artifact.
8. Apply `docs/STYLE.md`.
9. Apply `docs/USER_FACING_COPY.md`.
10. Apply `docs/HUMAN_INTERFACE.md`.
11. Apply `docs/QUALITY_BAR.md`.
12. Confirm the required user-facing parts in `docs/INVISIBLE_QUALITY.md`.
13. Apply `docs/MEMORY_ACCESS.md` when the artifact may be reused.
14. Apply `docs/CHAIN.md` when follow-up work is likely.
15. Apply `docs/DELIVERY.md`.

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
- Archive recommendation when the result may be useful later.

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
- Did the artifact language match the user or intended audience?
- Did the artifact explain whether it should be saved, refreshed, kept private, superseded, or discarded?
- Did it show a tiny "Saved for later" or "Not saved" receipt without becoming bulky?
- Did visible copy help the user without exposing internal process labels?
- Did the artifact already include the required user-facing parts?

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
Archive recommendation:
Saved for later:
```

Do not paste the full HTML into chat unless requested.
