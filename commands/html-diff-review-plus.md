# /html-diff-review-plus

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
4. Build a fact sheet.
5. Identify behavioral changes, not only textual changes.
6. Generate HTML after verification.

## HTML sections

- Intent
- Diff summary
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
