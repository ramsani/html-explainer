# 19 — Feature Flag / Config Editor

Intent: reason safely about interacting configuration states.

Use when feature flags, environment options, workflow settings, permissions, user segments, or deployment modes interact.

Evidence required: config files, env variables, feature flags, schemas, defaults, invalid combinations, deployment constraints.

Prompt template:
```text
Generate a self-contained HTML feature flag/config editor. Inspect real config evidence first. Provide controls, resulting config preview, invalid-state warnings, and exportable output.
```

HTML structure: intent, evidence, controls, config preview, invalid warnings, risk notes, export/copy output, reset defaults.

Quality checklist: controls map to real config, invalid states are visible, output is usable.

Failure modes: editor cannot export, hiding dangerous combinations, invented settings.

Acceptance criteria: the user can test combinations and copy a safe resulting config.

## Visual explainer contract

Apply `docs/VISUAL_EXPLAINER_PLAYBOOK.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
