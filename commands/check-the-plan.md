# /check-the-plan

Review an implementation plan before code changes.

Completion goal: `goals/plan-review-complete.goal.md`.

## Process

1. Apply `docs/DECISION_GATE.md`.
2. Apply `docs/LANGUAGE_POLICY.md`.
3. Use pattern 02 unless another pattern clearly fits better.
4. Inspect the plan, likely affected files, contracts, tests, and risk areas.
5. Build the evidence sheet with `docs/FACT_SHEET.md`.
6. Generate or recommend a compact/standard plan-review artifact.
7. Apply `docs/HUMAN_INTERFACE.md`.
8. Apply `docs/QUALITY_BAR.md`.
9. Confirm the required user-facing parts in `docs/INVISIBLE_QUALITY.md`.
10. Apply `docs/CHAIN.md` so approve, revise, reject, split, or implement becomes selectable.
11. Apply `docs/MEMORY_ACCESS.md` when the review may be reused.
12. If an HTML file is delivered, run `~/.claude/html-explainer/scripts/deliver-artifact.py <artifact.html> --min-score 90`.
13. If delivery is blocked, revise the artifact and run the delivery command again.
14. Apply `docs/DELIVERY.md`.

## Must Answer

- What is the plan trying to achieve?
- What assumptions does it make?
- What evidence supports or contradicts it?
- What can break?
- What must be verified before implementation?
- Should the user approve, revise, reject, split, or ask for a sharper plan?
- Should this plan review be saved, refreshed later, kept private, or discarded?

## Output

End with one recommended next prompt, useful alternatives, archive recommendation, and a tiny saved/not-saved receipt. If HTML is delivered, include delivery approval from `deliver-artifact.py` before the final chat response.

## Completion

Use the completion goal named above as the stopping condition. Report a blocker instead of claiming completion if the goal cannot be satisfied.
