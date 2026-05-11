# /html-plan-review-plus

Review a plan against the real repo before implementation and produce a self-contained HTML review artifact.

## Intent

Prevent implementation based on false assumptions, missing files, misunderstood architecture, or excessive blast radius.

## Mandatory process

1. Read the user's plan completely.
2. Identify every claimed file, function, route, component, dependency, API, test, and workflow.
3. Inspect the real repo for those claims.
4. Inspect adjacent files needed to understand behavior.
5. Build a fact sheet.
6. Separate:
   - verified facts
   - inferred conclusions
   - unsupported claims
   - unknowns
7. Generate HTML only after verification.

## HTML sections

- Intent
- Plan being reviewed
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
