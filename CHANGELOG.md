# Changelog

## Unreleased — UX quality gate upgrade

### Added

- `docs/HTML_UX_STANDARD.md` with first-screen, artifact fit, evidence UX, interaction, export, mobile, and hard-fail rules.
- `scripts/validate-examples.sh` to block example artifacts that miss basic UX and evidence requirements.
- MIT `LICENSE` so the repo is ready to share publicly.

### Improved

- The main skill and all high-value commands now require a UX contract before generating HTML.
- `docs/QUALITY_BAR.md` now scores first-screen usefulness, interaction fit, mobile readability, and exportability.
- CI now validates example artifact quality, not only file existence.
- Minimal examples now include responsive viewport, uncertainty/risk, and next-action language.
- Installer and smoke tests now verify the new UX standard file.
- Shell scripts are executable so local verification commands work as documented.

### Why it matters

This makes quality part of the manufacturing process. The agent must select the right artifact shape, inspect evidence, expose uncertainty, keep the first screen useful, and export usable output when interaction is involved.

## Unreleased — full example artifact upgrade

### Added

- Full example artifacts for the five most important workflow patterns:
  - `examples/diff-review-full.example.html`
  - `examples/architecture-diagram.example.html`
  - `examples/project-recap.example.html`
  - `examples/ticket-triage.example.html`
  - `examples/prompt-tuner-full.example.html`

### Improved

- CI now verifies that the full example artifacts exist.
- The repo now gives models concrete artifact shapes to imitate, not only written instructions.

### Why it matters

The five full examples make the Thariq integration more practical. They show what a useful HTML artifact should look like for review, architecture, project reentry, prioritization, and prompt/agent tuning.

## v0.2 — Thariq integration upgrade

This version turns the Thariq HTML effectiveness ideas from general documentation into operational agent behavior.

### Added

- `patterns/` with 20 separate executable pattern files.
- `docs/pattern-router.md` for selecting the right artifact type.
- `docs/QUALITY_BAR.md` for auditing artifact quality.
- `/html-audit-artifact` command.
- Minimal HTML examples:
  - `examples/plan-review-minimal.example.html`
  - `examples/diff-review-minimal.example.html`
  - `examples/prompt-tuner-minimal.example.html`

### Improved

- `/html-effectiveness` now requires the router, matching pattern file, fact sheet protocol, and quality bar.
- `/html-pattern-select` now requires reading the selected pattern file before recommending a path.
- `SKILL.md` now instructs Claude to use router + pattern file + fact sheet + quality bar, not only the general 20-case list.
- `install.sh` now installs patterns, examples, and the audit command.

### Why it matters

The repo no longer only explains Thariq's approach. It operationalizes it.

The new workflow is:

```text
route -> pattern file -> evidence -> fact sheet -> artifact -> quality bar -> decision
```

This reduces the risk of attractive but shallow HTML artifacts.
