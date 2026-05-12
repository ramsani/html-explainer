# /check-the-diff

Review the current diff or PR and produce a self-contained HTML review artifact.

## Intent

Make changed code inspectable as a decision surface before accepting, committing, merging, or deploying.

## Mandatory process

1. Run or inspect equivalent of:
   - `git status --short`
   - `git diff --stat`
   - `git diff --name-status`
   - `git diff`
2. Read changed files where needed.
3. Inspect related tests, docs, configs, routes, schemas, or workflows.
4. Define the intent distillation from `docs/INTENT_DISTILLATION.md`.
5. Define the UX contract from `docs/HTML_UX_STANDARD.md`.
6. Build a fact sheet.
7. Identify behavioral changes, not only textual changes.
8. Generate HTML after verification.

## HTML sections

- Intent
- Intent distillation
- Diff summary
- UX contract
- Evidence inspected
- Fact sheet
- Changed files
- Behavior before/after
- Inline or grouped findings
- Severity-coded risks
- Test coverage reviewed
- Missing validation
- Release / rollback risk
- Recommendation: accept, revise, reject, or split
- Next safest action

## Special rule

Do not claim tests passed unless they were run or inspected with evidence.

## Final response

Report artifact path, recommendation, and whether additional verification is required.
