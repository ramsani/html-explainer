# /reenter-project

Create a repo/project recap that helps the user re-enter context quickly.

Completion goal: `goals/repo-v1-complete.goal.md` for full audits, or `goals/artifact-ready.goal.md` for a single recap artifact.

## Process

1. Apply `docs/DECISION_GATE.md`.
2. Apply `docs/LANGUAGE_POLICY.md`.
3. Use pattern 17 unless the task is clearly narrower.
4. Inspect README, changelog, entry points, scripts, CI, commands, patterns, and recent commits.
5. Build the evidence sheet with `docs/FACT_SHEET.md`.
6. Generate the smallest useful project recap.
7. Apply `docs/STYLE.md`.
8. Apply `docs/HUMAN_INTERFACE.md`.
9. Apply `docs/QUALITY_BAR.md`.
10. Confirm the required user-facing parts in `docs/INVISIBLE_QUALITY.md`.
11. Apply `docs/CHAIN.md` so the next repo action is obvious.
12. Apply `docs/MEMORY_ACCESS.md` because project recaps are often reused.
13. If an HTML file is delivered, run `~/.claude/html-explainer/scripts/deliver-artifact.py <artifact.html> --min-score 90`.
14. If delivery is blocked, revise the artifact and run the delivery command again.
15. Apply `docs/DELIVERY.md`.

## Must Answer

- What is this project?
- What value does it provide?
- How does work flow through it?
- What is solid?
- What is risky or unclear?
- What is the next highest-leverage action?
- What should be saved, refreshed later, kept private, or discarded?

## Output

End with one recommended next prompt, useful alternatives, archive recommendation, and a tiny saved/not-saved receipt for the next likely step. If HTML is delivered, include delivery approval from `deliver-artifact.py` before the final chat response.

## Completion

Use the completion goal named above as the completion standard. If the user invoked /goal, keep working until that goal is satisfied; otherwise, report a blocker instead of claiming completion when the standard cannot be met.
