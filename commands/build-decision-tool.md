# /build-decision-tool

Create a temporary self-contained HTML editor for decisions that are easier to make by manipulating state than by reading a report.

## Intent

Turn complex triage, configuration, prompt tuning, or option selection into a small usable interface with exportable output.

## Use when

- many issues must be prioritized
- feature flags or settings interact
- prompts or agent instructions need tuning
- options need scoring
- the user needs to simulate combinations

## Mandatory process

1. Identify the decision the editor must support.
2. Inspect the real inputs: issues, config, prompts, requirements, or data.
3. Define output format before designing controls.
4. Define the intent distillation from `docs/INTENT_DISTILLATION.md`.
5. Apply `docs/HTML_ADVANTAGE_GATE.md`; the concrete output is mandatory.
6. Define the artifact budget from `docs/ARTIFACT_BUDGET.md`; this should usually be `interactive`.
7. Define the UX contract from `docs/HTML_UX_STANDARD.md`.
8. Build a fact sheet.
9. Generate a self-contained HTML editor.
10. Include export/copy output.
11. Mark unsupported or risky states.

## HTML sections / features

- Intent
- Intent distillation
- HTML advantage
- Artifact budget
- Evidence inspected
- UX contract
- Controls
- Preview or resulting state
- Validation warnings
- Exportable output
- Reset/default state
- Empty, invalid, and success/exported states
- Assumptions
- Unknowns
- Usage instructions

## Special rule

A custom editor is only successful if it produces usable output: Markdown, JSON, config, issue body, prompt, or checklist.

If controls do not change a meaningful preview, warning, score, or export, remove them.

## Final response

Report artifact path, what it edits, and what output it exports.
