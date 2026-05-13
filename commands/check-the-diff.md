# /check-the-diff

Review a diff, PR, patch, or changed files before accepting them.

## Process

1. Apply `docs/DECISION_GATE.md`.
2. Apply `docs/LANGUAGE_POLICY.md`.
3. Use pattern 03.
4. Inspect `git diff`, changed files, tests, and relevant contracts.
5. Build the evidence sheet with `docs/FACT_SHEET.md`.
6. Generate or recommend a compact/standard diff-review artifact.
7. Apply `docs/STYLE.md`.
8. Apply `docs/HUMAN_INTERFACE.md`.
9. Apply `docs/QUALITY_BAR.md`.
10. Apply `docs/CHAIN.md` so accept, fix, verify, split, revert, or share becomes selectable.
11. Apply `docs/MEMORY_ACCESS.md` when the review may be reused.
12. Apply `docs/DELIVERY.md`.

## Must Answer

- What changed?
- What behavior changed?
- What is safe?
- What is risky?
- What is unverified?
- Should the user accept, correct, verify, split, or revert something?
- Should this review be saved, refreshed later, kept private, or discarded?

## Output

End with one recommended next prompt, useful alternatives, archive recommendation, and a tiny saved/not-saved receipt. Include revert only when evidence shows it is plausible.
