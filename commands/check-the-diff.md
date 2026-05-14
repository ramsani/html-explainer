# /check-the-diff

Review a diff, PR, patch, or changed files before accepting them.

Completion goal: `goals/diff-review-complete.goal.md`.

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
10. Confirm the required user-facing parts in `docs/INVISIBLE_QUALITY.md`.
11. Apply `docs/CHAIN.md` so accept, fix, verify, split, revert, or share becomes selectable.
12. Apply `docs/MEMORY_ACCESS.md` when the review may be reused.
13. If an HTML file is delivered, run `~/.claude/html-explainer/scripts/deliver-artifact.py <artifact.html> --min-score 90`.
14. If delivery is blocked, revise the artifact and run the delivery command again.
15. Apply `docs/DELIVERY.md`.

## Must Answer

- What changed?
- What behavior changed?
- What is safe?
- What is risky?
- What is unverified?
- Should the user accept, correct, verify, split, or revert something?
- Should this review be saved, refreshed later, kept private, or discarded?

## Output

End with one recommended next prompt, useful alternatives, archive recommendation, and a tiny saved/not-saved receipt. Include revert only when evidence shows it is plausible. If HTML is delivered, include delivery approval from `deliver-artifact.py` before the final chat response.

## Completion

Use the completion goal named above as the completion standard. If the user invoked /goal, keep working until that goal is satisfied; otherwise, report a blocker instead of claiming completion when the standard cannot be met.
