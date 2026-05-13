# Changelog

## Unreleased — coherence guard

### Added

- `docs/COHERENCE_GUARD.md` to prevent the repo from becoming a disconnected collection of good ideas.
- README section explaining the single product center: `intent -> evidence -> visual understanding -> decision -> expert next prompt`.
- Installer, smoke test, and CI checks for the coherence guard.

### Improved

- Quality bar now penalizes process bloat that does not serve the user's intent.
- Main generation command now applies the coherence guard before final handoff.
- README now explains the repo through one product sentence, not just a list of inspirations.

### Why it matters

The project now has a built-in test against becoming a Frankenstein. New rules, gates, or prompts must pay rent by improving intent alignment, evidence, decision quality, next-step execution, or safety.

## Unreleased — expert prompt gates

### Added

- `docs/EXPERT_PROMPT_GATES.md` for technically stronger chained prompts.
- Compact gates for intake, product, architecture, plan, implementation, automation, verification, and QA.
- Installer, smoke test, and CI checks for the new expert gate document.

### Improved

- Chained prompts now name the result to protect, evidence required, out of scope, block conditions, and validation loop.
- Process capsules now preserve result-to-protect and evidence-required fields for the next agent.
- Quality bar now penalizes next prompts that omit technical gates for serious follow-up work.

### Why it matters

The next prompt should feel like an experienced engineer is handing precise work to Claude: clear goal, hard boundaries, evidence, validation, and blocking conditions.

## Unreleased — senior chained prompts

### Added

- `docs/SENIOR_CHAINED_PROMPTS.md` for next-step prompts that read like compact engineering briefs.
- Matt Pocock skills attribution in `CREDITS.md` and README.
- Installer, smoke test, and CI checks for the new prompt discipline doc.

### Improved

- Next action handoffs now require stronger prompt structure for serious follow-up work.
- Process capsules now carry out-of-scope boundaries for the next step.
- Quality bar now penalizes generic next prompts and missing acceptance criteria.

### Why it matters

This makes each HTML artifact a better input for the next agent run. The user gets prompts that preserve intent, evidence, decision, acceptance criteria, and scope boundaries instead of vague "continue" instructions.

## Unreleased — visual direction explorer

### Added

- Pattern 21: Visual Direction Explorer.
- Example artifact for live visual direction comparison.
- Router support for visual design options, empty-state directions, and UI tone exploration.

### Improved

- Quality bar now includes a visual exploration overlay.
- HTML advantage gate now includes a visual exploration special rule.
- Pattern validation now expects 21 patterns.

### Why it matters

This captures a key Thariq use case: HTML is valuable when the user needs to compare live visual alternatives, not imagine them from prose.

## Unreleased — artifact budget and cognitive relief

### Added

- `docs/ARTIFACT_BUDGET.md` with compact, standard, and interactive budgets.
- Required cost justification before generating HTML.
- Cognitive relief fields: wall of text replaced and mental work removed.

### Improved

- The skill and commands now default to the smallest sufficient artifact.
- Quality bar now fails artifacts that should have been Markdown.
- Examples now show artifact budget and mental work removed.
- Installer, smoke tests, and CI verify the artifact budget guide.

### Why it matters

This protects the core Thariq idea: HTML must earn its keep. The browser is used when it removes reconstruction, comparison, simulation, or export friction. It is not used just because it looks impressive.

## Unreleased — intent-first command names

### Changed

- Renamed command files and slash command names around user intent:
  - `/pick-the-right-html`
  - `/make-the-right-html`
  - `/check-the-plan`
  - `/check-the-diff`
  - `/reenter-project`
  - `/build-decision-tool`
  - `/audit-html`
- Removed the old technical command names from the installed command set.

### Improved

- Installer removes legacy command files during installation so users see only the intent-first names.
- README, examples, selection guide, smoke tests, and workflow checks now use the new names.

### Why it matters

The commands now match what the user is trying to do, not the internal implementation name. This reduces the memory burden and makes the tool easier to try.

## Unreleased — UX quality gate upgrade

### Added

- `docs/INTENT_DISTILLATION.md` to force primary intent, obvious secondary intents, base concept, fastest path to value, and surprising ease before interface design.
- `docs/HTML_UX_STANDARD.md` with first-screen, artifact fit, evidence UX, interaction, export, mobile, and hard-fail rules.
- `scripts/validate-examples.sh` to block example artifacts that miss basic UX and evidence requirements.
- MIT `LICENSE` so the repo is ready to share publicly.

### Improved

- The main skill and all high-value commands now require a UX contract before generating HTML.
- The main skill and high-value commands now require intent distillation before pattern selection.
- `docs/QUALITY_BAR.md` now scores first-screen usefulness, interaction fit, mobile readability, and exportability.
- Example validation now checks visible primary intent, secondary intent coverage, and base concept.
- Minimal examples now include responsive viewport, uncertainty/risk, and next-action language.
- Installer and smoke tests now verify the new UX standard file.
- Shell scripts are executable so local verification commands work as documented.

### Why it matters

This makes quality part of the manufacturing process. The agent must answer the main intent directly, catch obvious adjacent needs, distill the base concept, select the right artifact shape, inspect evidence, expose uncertainty, keep the first screen useful, and export usable output when interaction is involved.

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
- `/audit-html` command.
- Minimal HTML examples:
  - `examples/plan-review-minimal.example.html`
  - `examples/diff-review-minimal.example.html`
  - `examples/prompt-tuner-minimal.example.html`

### Improved

- `/make-the-right-html` now requires the router, matching pattern file, fact sheet protocol, and quality bar.
- `/pick-the-right-html` now requires reading the selected pattern file before recommending a path.
- `SKILL.md` now instructs Claude to use router + pattern file + fact sheet + quality bar, not only the general 20-case list.
- `install.sh` now installs patterns, examples, and the audit command.

### Why it matters

The repo no longer only explains Thariq's approach. It operationalizes it.

The new workflow is:

```text
route -> pattern file -> evidence -> fact sheet -> artifact -> quality bar -> decision
```

This reduces the risk of attractive but shallow HTML artifacts.
