# /check-the-diff

Review a diff, PR, patch, or changed files before accepting them.

## Process

1. Apply `docs/DECISION_GATE.md`.
2. Use pattern 03.
3. Inspect `git diff`, changed files, tests, and relevant contracts.
4. Build the evidence sheet with `docs/FACT_SHEET.md`.
5. Generate or recommend a compact/standard diff-review artifact.
6. Apply `docs/STYLE.md`.
7. Apply `docs/QUALITY_BAR.md`.
8. Apply `docs/CHAIN.md` so accept, fix, verify, split, revert, or share becomes selectable.
9. Apply `docs/DELIVERY.md`.

## Must Answer

- What changed?
- What behavior changed?
- What is safe?
- What is risky?
- What is unverified?
- Should the user accept, correct, verify, split, or revert something?

## Output

End with one recommended next prompt and useful alternatives. Include revert only when evidence shows it is plausible.
