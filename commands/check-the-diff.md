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
5. Apply the `/check-the-diff` pack from `docs/CONTEXT_PACKS.md`.
6. Apply `docs/HTML_ADVANTAGE_GATE.md`.
7. Define the artifact budget from `docs/ARTIFACT_BUDGET.md`.
8. Define the UX contract from `docs/HTML_UX_STANDARD.md`.
9. Build a fact sheet.
10. Identify behavioral changes, not only textual changes.
11. Compare against the PR review reference in `docs/GOLDEN_OUTPUTS.md`.
12. Apply `docs/SHARE_AND_REENTRY.md` so the review can be attached to a PR or handed to another agent.
13. Apply `docs/NEXT_ACTION_HANDOFF.md` to turn findings into selectable next steps.
14. Generate HTML after verification.

## HTML sections

- Intent
- Intent distillation
- HTML advantage
- Artifact budget
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
- Share-ready PR summary
- Agent reentry block when fixes or verification remain
- Recommendation: accept, revise, reject, or split
- Next action handoff: recommended action, ready-to-run command, selectable alternatives

## Special rule

Do not claim tests passed unless they were run or inspected with evidence.

## Final response

Report artifact path, recommendation, whether additional verification is required, and the ready-to-run next command.
