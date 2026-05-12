# /check-the-plan

Review a plan against the real repo before implementation and produce a self-contained HTML review artifact.

## Intent

Prevent implementation based on false assumptions, missing files, misunderstood architecture, or excessive blast radius.

## Mandatory process

1. Read the user's plan completely.
2. Identify every claimed file, function, route, component, dependency, API, test, and workflow.
3. Inspect the real repo for those claims.
4. Inspect adjacent files needed to understand behavior.
5. Define the intent distillation from `docs/INTENT_DISTILLATION.md`.
6. Define the artifact budget from `docs/ARTIFACT_BUDGET.md`.
7. Define the UX contract from `docs/HTML_UX_STANDARD.md`.
8. Build a fact sheet.
9. Separate:
   - verified facts
   - inferred conclusions
   - unsupported claims
   - unknowns
10. Generate HTML only after verification.

## HTML sections

- Intent
- Intent distillation
- Artifact budget
- Plan being reviewed
- UX contract
- Evidence inspected
- Fact sheet
- Current architecture or flow
- Proposed change map
- Files affected
- Blast radius
- Risk matrix
- Missing information
- Do-not-touch boundaries
- Recommendation: approve, revise, reject, or split
- Minimum safe next step
- Success criteria

## Special rule

Do not implement anything. This command is review-only.

## Final response

Report artifact path, recommendation, and the highest-risk uncertainty.
