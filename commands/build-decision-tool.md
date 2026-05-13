# /build-decision-tool

Build a temporary HTML editor, triage board, tuner, or config tool.

## Process

1. Apply `docs/DECISION_GATE.md`.
2. Use pattern 18, 19, or 20 unless another pattern clearly fits.
3. Inspect the source data and constraints.
4. Build the evidence sheet with `docs/FACT_SHEET.md`.
5. Use `interactive` budget only because controls change state or produce output.
6. Apply `docs/STYLE.md`.
7. Apply `docs/QUALITY_BAR.md`.
8. Apply `docs/CHAIN.md` so exported output has a clear next use.
9. Apply `docs/DELIVERY.md`.

## Must Include

- editable or selectable state;
- validation or warnings for invalid choices;
- preview when useful;
- copy/export output;
- next prompt that uses the exported result.

## Hard Rule

If there is no exportable output, do not build an editor. Use a compact artifact instead.
