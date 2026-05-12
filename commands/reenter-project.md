# /reenter-project

Create a self-contained HTML project recap for re-entering context.

## Intent

Help the user understand what the project is, how it works, what changed recently, and what the next safe action should be.

## Mandatory process

1. Inspect README and package/project metadata.
2. Inspect source tree at a useful depth.
3. Inspect recent git activity when available.
4. Inspect docs, plans, changelog, tests, and configuration where relevant.
5. Identify architecture, workflows, entry points, and gotchas.
6. Define the intent distillation from `docs/INTENT_DISTILLATION.md`.
7. Define the artifact budget from `docs/ARTIFACT_BUDGET.md`.
8. Define the UX contract from `docs/HTML_UX_STANDARD.md`.
9. Build a fact sheet.
10. Generate HTML after verification.

## HTML sections

- Project identity
- Intent distillation
- Artifact budget
- UX contract
- Evidence inspected
- Fact sheet
- Architecture map
- Entry points
- Main workflows
- Recent activity
- Important decisions or constraints
- Risks and gotchas
- Open questions
- Recommended next action
- Reentry checklist

## Special rule

Do not summarize only the README. The purpose is operational reentry, not a marketing summary.

## Final response

Report artifact path, project status in one sentence, and the recommended next action.
