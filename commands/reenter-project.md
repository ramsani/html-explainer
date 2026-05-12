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
7. Apply `docs/HTML_ADVANTAGE_GATE.md`; a recap must be more than a prettier README.
8. Define the artifact budget from `docs/ARTIFACT_BUDGET.md`.
9. Define the UX contract from `docs/HTML_UX_STANDARD.md`.
10. Build a fact sheet.
11. Apply `docs/NEXT_ACTION_HANDOFF.md` so the reentry path is ready to run.
12. Generate HTML after verification.

## HTML sections

- Project identity
- Intent distillation
- HTML advantage
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
- Next action handoff
- Reentry checklist

## Recap-specific requirements

Include at least one real browser advantage:

- searchable/filterable commands, files, or patterns;
- collapsible details so the first screen stays decisive;
- exportable reentry checklist;
- current-vs-previous state comparison when history exists;
- risk map that makes safe and unsafe zones obvious.

If none applies, produce compact HTML or use Markdown.

## Special rule

Do not summarize only the README. The purpose is operational reentry, not a marketing summary.

## Final response

Report artifact path, project status in one sentence, and the ready-to-run next command.
