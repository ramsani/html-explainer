# /build-decision-tool

Build a temporary HTML editor, triage board, tuner, or config tool.

## Process

1. Apply `docs/DECISION_GATE.md`.
2. Apply `docs/LANGUAGE_POLICY.md`.
3. Use pattern 18, 19, or 20 unless another pattern clearly fits.
4. Inspect the source data and constraints.
5. Build the evidence sheet with `docs/FACT_SHEET.md`.
6. Use `interactive` budget only because controls change state or produce output.
7. Apply `docs/STYLE.md`.
8. Apply `docs/HUMAN_INTERFACE.md`.
9. Apply `docs/QUALITY_BAR.md`.
10. Confirm the required user-facing parts in `docs/INVISIBLE_QUALITY.md`.
11. Apply `docs/CHAIN.md` so exported output has a clear next use.
12. Apply `docs/MEMORY_ACCESS.md` when the exported result may be reused.
13. Save the tool to a local HTML file.
14. Run `~/.claude/html-explainer/scripts/deliver-artifact.py <artifact.html> --min-score 90`.
15. If delivery is blocked, revise the tool and run the delivery command again.
16. Apply `docs/DELIVERY.md`.

## Must Include

- editable or selectable state;
- validation or warnings for invalid choices;
- preview when useful;
- copy/export output;
- next prompt that uses the exported result.
- archive recommendation when the result may be useful later.
- a tiny saved/not-saved receipt.
- delivery approval from `deliver-artifact.py` before the final chat response.

## Hard Rule

If there is no exportable output, do not build an editor. Use a compact artifact instead.

## Done Means

- Primary intent was answered.
- Required evidence was inspected or the lack of evidence was stated.
- HTML was generated only if it beats Markdown.
- The artifact or response includes risk, uncertainty, recommendation, and next action.
- Save / private / refresh / supersede / discard decision was made.
- If HTML was delivered, deliver-artifact.py approved it.
