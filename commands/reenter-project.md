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
13. Apply `docs/DELIVERY.md`.

## Must Answer

- What is this project?
- What value does it provide?
- How does work flow through it?
- What is solid?
- What is risky or unclear?
- What is the next highest-leverage action?
- What should be saved, refreshed later, kept private, or discarded?

## Output

End with one recommended next prompt, useful alternatives, archive recommendation, and a tiny saved/not-saved receipt for the next likely step.

## Done Means

- Primary intent was answered.
- Required evidence was inspected or the lack of evidence was stated.
- HTML was generated only if it beats Markdown.
- The artifact or response includes risk, uncertainty, recommendation, and next action.
- Save / private / refresh / supersede / discard decision was made.
- If HTML was delivered, deliver-artifact.py approved it.
