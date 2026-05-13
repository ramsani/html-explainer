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
8. Apply `docs/QUALITY_BAR.md`.
9. Apply `docs/CHAIN.md` so exported output has a clear next use.
10. Apply `docs/MEMORY_ACCESS.md` when the exported result may be reused.
11. Apply `docs/DELIVERY.md`.

## Must Include

- editable or selectable state;
- validation or warnings for invalid choices;
- preview when useful;
- copy/export output;
- next prompt that uses the exported result.
- archive recommendation when the result may be useful later.
- a tiny saved/not-saved receipt.

## Hard Rule

If there is no exportable output, do not build an editor. Use a compact artifact instead.
