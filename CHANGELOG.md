# Changelog

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
