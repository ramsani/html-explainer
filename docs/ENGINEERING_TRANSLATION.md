# Engineering Translation Audit

This file records the internal design principles and where they are translated into concrete repo behavior.

Agents should follow the concrete files, commands, and checks. They should not need to reason from the principles.

| Internal principle | Concrete behavior | Where it is applied | How it is confirmed |
|---|---|---|---|
| Start from the user's real need. | Every command identifies primary intent before choosing a format or producing output. | `commands/*.md`, `docs/DECISION_GATE.md`, `docs/PATTERN_GUIDE.md` | `scripts/validate-commands.sh`, scenario validation |
| Do not claim without evidence. | Commands require inspected sources and separated facts, assumptions, unknowns, and recommendations. | `docs/FACT_SHEET.md`, `docs/QUALITY_BAR.md`, patterns | example validation, artifact audit |
| HTML must earn its cost. | HTML is used only when it improves inspection, comparison, decision, interaction, or reuse. | `docs/DECISION_GATE.md`, `docs/PATTERN_GUIDE.md`, `docs/QUALITY_BAR.md` | routing scenarios, quality bar, examples |
| Keep the first screen useful. | The artifact shows need, evidence basis, recommendation, risk, and next action early. | `commands/make-the-right-html.md`, `docs/STYLE.md`, `docs/HUMAN_INTERFACE.md` | example validation, artifact audit |
| Preserve the user's freedom. | Artifacts invite action without pressure and include useful alternatives. | `docs/HUMAN_INTERFACE.md`, patterns, commands | command validation, pattern validation |
| End with a next move. | Every serious output includes a copy-ready next prompt or exportable output. | `docs/CHAIN.md`, `docs/DELIVERY.md`, commands | command validation, example validation |
| Preserve useful memory quietly. | Reusable work gets archive guidance and a small find-it-fast receipt. | `docs/ARTIFACT_MEMORY.md`, `docs/MEMORY_ACCESS.md`, commands | command validation, example validation |
| Keep internal checks invisible. | Visible copy avoids internal labels and shows user value instead of checklists. | `docs/USER_FACING_COPY.md`, `docs/HUMAN_INTERFACE.md`, `docs/INVISIBLE_QUALITY.md` | `scripts/audit-artifact.py`, `scripts/validate-examples.sh` |
| Prefer small, fast, local checks. | Validation stays local, scriptable, and dependency-light. | `scripts/*.sh`, `scripts/audit-artifact.py`, installer smoke tests | CI/local validation scripts |
| Do not let docs outrun behavior. | New promises must map to commands, patterns, examples, or checks. | `CONTRIBUTING.md`, `docs/V1_FUNCTION_AUDIT.md` | contribution checklist, V1 audit |

## Current Translation Status

All active user-facing commands point to the concrete behavior files:

- `docs/DECISION_GATE.md`
- `docs/LANGUAGE_POLICY.md`
- `docs/QUALITY_BAR.md`
- `docs/HUMAN_INTERFACE.md`
- `docs/INVISIBLE_QUALITY.md`
- `docs/MEMORY_ACCESS.md`

The repo keeps the principle layer auditable here, while commands stay operational and direct.
