# /check-the-plan

Review an implementation plan before code changes.

## Process

1. Apply `docs/DECISION_GATE.md`.
2. Use pattern 02 unless another pattern clearly fits better.
3. Inspect the plan, likely affected files, contracts, tests, and risk areas.
4. Build the evidence sheet with `docs/FACT_SHEET.md`.
5. Generate or recommend a compact/standard plan-review artifact.
6. Apply `docs/QUALITY_BAR.md`.
7. Apply `docs/CHAIN.md` so approve, revise, reject, split, or implement becomes selectable.
8. Apply `docs/DELIVERY.md`.

## Must Answer

- What is the plan trying to achieve?
- What assumptions does it make?
- What evidence supports or contradicts it?
- What can break?
- What must be verified before implementation?
- Should the user approve, revise, reject, split, or ask for a sharper plan?

## Output

End with one recommended next prompt and useful alternatives.
