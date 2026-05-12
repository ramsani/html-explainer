# html-explainer

`html-explainer` is a Claude Code skill layer and installer that extends `visual-explainer` with an evidence-first operating model inspired by Thariq S. Bate's "The unreasonable effectiveness of HTML" approach.

Its purpose is not to make agent output prettier. Its purpose is to help coding agents produce HTML artifacts that improve technical judgment: review, comparison, diagnosis, planning, triage, reentry, and decision-making.

```text
visual-explainer = HTML artifact capability
html-explainer   = disciplined operating layer for using that capability well
```

## The quality promise

`html-explainer` treats HTML as a decision surface.

An artifact is acceptable only when it makes the user's work easier than Markdown:

- the primary intent is answered directly;
- obvious secondary intents are handled when they affect the decision;
- the base concept is distilled before interface choices;
- the artifact budget is explicit: compact, standard, or interactive;
- HTML beats Markdown by removing a named mental burden;
- the first screen says what decision the artifact supports;
- evidence is visible;
- facts, inferences, assumptions, and unknowns are separated;
- the visual form matches the job;
- interaction changes a meaningful state;
- editor-like artifacts export usable Markdown, JSON, config, prompts, issue bodies, or checklists;
- mobile layout stays readable;
- the artifact ends with a next action handoff: recommended action, reason, ready-to-run command, and only useful alternatives.

The process is designed so quality is built before the artifact is generated. Validation confirms that the process produced the right thing; it is not a last-minute rescue.

## Attribution

This project is built as a complementary layer around two important prior contributions:

- **Visual Explainer by Nico Bailon** — the upstream agent skill that generates rich, self-contained HTML pages for diagrams, visual plans, slides, diff reviews, plan audits, project recaps, fact checks, and complex tables.
- **The HTML effectiveness approach by Thariq S. Bate** — the idea that HTML can be a superior medium for many agent outputs because it can represent structure, comparison, interaction, visual hierarchy, and decision context better than flat Markdown.

`html-explainer` is not an official project of Nico Bailon or Thariq S. Bate. It is an independent integration and operating layer that credits both sources: Visual Explainer as the implementation foundation, and Thariq's HTML effectiveness approach as the conceptual pattern library.

See [`CREDITS.md`](CREDITS.md) for details.

## Quick start

Use this when installing for the first time:

```bash
git clone https://github.com/ramsani/html-explainer.git /tmp/html-explainer
cd /tmp/html-explainer
DRY_RUN=1 bash install.sh
bash install.sh
```

Restart Claude Code after installation.

You should then see these commands:

```text
/pick-the-right-html
/make-the-right-html
/check-the-plan
/check-the-diff
/reenter-project
/build-decision-tool
/audit-html
```

## Update an existing install

You can safely install over an older `html-explainer` version.

The installer backs up the previous skill, command files, docs, patterns, and local examples before replacing them. It also removes older command names from previous versions.

If you already cloned the repo:

```bash
cd /tmp/html-explainer
git pull origin main
DRY_RUN=1 bash install.sh
bash install.sh
```

If the old clone no longer exists:

```bash
rm -rf /tmp/html-explainer
git clone https://github.com/ramsani/html-explainer.git /tmp/html-explainer
cd /tmp/html-explainer
DRY_RUN=1 bash install.sh
bash install.sh
```

Backup location:

```text
~/.claude/html-explainer/backups/<timestamp>/
```

## Restore or uninstall

Preview uninstall:

```bash
DRY_RUN=1 bash uninstall.sh
```

Restore the latest backup, or remove managed files if no backup exists:

```bash
bash uninstall.sh
```

Remove without restoring backup:

```bash
RESTORE_BACKUP=0 bash uninstall.sh
```

## What problem this solves

Agents often produce long Markdown responses for work that is not naturally linear:

- architecture maps;
- diffs and pull requests;
- implementation plans;
- dependency graphs;
- timelines;
- UI states;
- workflow diagrams;
- issue triage;
- prompt and agent-behavior tuning;
- incident reports.

Markdown can describe these things, but it flattens them. The user must mentally reconstruct relationships, risk, sequence, and scope.

HTML lets an agent create a review surface: a navigable artifact that can show structure, comparison, evidence, uncertainty, interaction, and next action in one place.

## How this complements visual-explainer

`visual-explainer` already provides useful HTML generation capabilities. `html-explainer` does not replace it. It wraps and strengthens it.

| Layer | visual-explainer | html-explainer |
|---|---|---|
| Core role | Generate useful HTML artifacts | Decide when, why, and how HTML should be used |
| Strength | Rendering, command patterns, visual reports | Operating discipline, pattern selection, evidence-first workflow |
| Main risk addressed | Markdown is weak for complex visual structure | HTML can become beautiful but unverifiable |
| Best use | Produce visual diagrams, plans, reviews, recaps | Make those artifacts safer, sharper, and more decision-oriented |
| Output focus | HTML artifact | Verified HTML artifact tied to intent, evidence, risks, and success criteria |

## The operating model

Every serious artifact follows this sequence:

```text
route -> intent distillation -> artifact budget -> pattern file -> UX contract -> evidence -> fact sheet -> artifact -> quality bar -> next action handoff -> decision
```

That means the agent must:

1. decide whether HTML is justified;
2. apply `docs/INTENT_DISTILLATION.md`;
3. apply `docs/CONTEXT_PACKS.md`;
4. apply `docs/EXPLAINER_CLARITY.md`;
5. apply `docs/VISUAL_EXPLAINER_PLAYBOOK.md`;
6. apply `docs/ARTIFACT_BUDGET.md`;
7. use `docs/pattern-router.md` to select one primary pattern;
8. open the matching file in `patterns/`;
9. apply `docs/HTML_UX_STANDARD.md`;
10. inspect real evidence;
11. create a fact sheet;
12. generate the smallest useful HTML artifact;
13. apply `docs/QUALITY_BAR.md` before finalizing;
14. compare against `docs/GOLDEN_OUTPUTS.md` when a reference case applies;
15. apply `docs/HTML_ARTIFACT_CHAINS.md` when one artifact should lead to another;
16. apply `docs/SHARE_AND_REENTRY.md` when the artifact should be shareable or reusable by another agent;
17. apply `docs/NEXT_ACTION_HANDOFF.md`;
18. expose uncertainty and next action.

## How the Thariq ideas are used case by case

The Thariq idea is not copied as one generic prompt. It is decomposed into 21 executable patterns.

Each pattern answers:

1. What is this HTML artifact for?
2. When should it be used?
3. What evidence must be inspected?
4. What prompt shape should the model follow?
5. What HTML structure should be produced?
6. What quality checklist applies?
7. What failure modes must be avoided?
8. What acceptance criteria prove the artifact is useful?

| Thariq-style case | Idea extracted | How `html-explainer` operationalizes it | Extra value added |
|---|---|---|---|
| Code approach comparison | Implementation choices are easier to judge side by side than as prose. | Requires alternatives, trade-offs, constraints, likely files, risks, and recommendation. | Prevents agents from choosing an approach too early or hiding architectural cost. |
| Visual implementation plan | Plans have sequence, dependencies, validation points, and rollback paths. | Turns plans into staged visual artifacts tied to files, checks, and definition of done. | Makes plans executable and reviewable before coding starts. |
| Annotated PR / diff review | Diffs are spatial and risk-based, not just line-by-line text. | Uses changed files, behavior before/after, severity-coded findings, test review, and release risk. | Helps decide whether to accept, revise, reject, or split a change. |
| Module map | Understanding code requires seeing entry points, dependencies, and hot paths. | Produces maps of module responsibilities, data flow, imports, and gotchas. | Reduces blind edits in unfamiliar repo areas. |
| Design token reference sheet | Design systems are visual; tokens and styles need to be seen. | Guides agents to expose colors, typography, spacing, radii, shadows, component examples, and future-artifact guidance. | Prevents UI changes and future HTML artifacts that ignore the existing design language. |
| Component state matrix | UI quality depends on states, not just static components. | Requires variants, empty/loading/error/disabled states, responsiveness, and accessibility notes. | Makes UI review more realistic before implementation. |
| Visual direction explorer | Visual design choices need to be seen side by side. | Renders 3-4 live alternatives and compares tone, density, action clarity, state fit, and light/dark resilience. | Lets the user choose direction without imagining it from prose. |
| Interactive flow prototype | Some UX decisions need to be felt, not described. | Encourages small self-contained clickable prototypes with visible states and implementation notes. | Lets the user validate friction before code is touched. |
| Microinteraction sandbox | Motion and feedback need timing, controls, and reduced-motion awareness. | Defines animation sandboxes with before/after comparison and control over state or speed. | Prevents decorative animation that hurts usability. |
| Architecture diagram | Systems are relationships between components, boundaries, and failure points. | Requires components, data flow, trust boundaries, external dependencies, and operational risks. | Turns architecture into an inspectable risk map. |
| Process / workflow flowchart | Workflows need success paths, failure paths, retries, and validation points. | Guides diagrams for deploys, auth, payments, n8n flows, and agent orchestration. | Forces the agent to expose error paths, not only the happy path. |
| Technical decision deck | Some outputs are for alignment and communication. | Converts recommendations into concise slide-like HTML with context, alternatives, evidence, and next steps. | Makes technical decisions easier to share and defend. |
| Project progress deck | Status is useful only when it shows progress, blocks, risk, and next decisions. | Creates structured progress artifacts instead of vague updates. | Reduces status theater and improves handoff. |
| Concept explainer | Learning improves when relationships and examples are visible. | Requires simple model, deeper model, examples, counterexamples, diagrams, and mistakes. | Makes technical explanations actionable instead of generic. |
| Research comparison map | Tool or architecture choices require criteria and source quality. | Uses comparison matrices, assumptions, constraints, and recommendations by use case. | Prevents rankings without criteria. |
| Incident / postmortem report | Failures need timeline, impact, causes, unknowns, and prevention. | Produces structured incident artifacts separating confirmed facts from hypotheses. | Reduces blame and false certainty. |
| Audit report | Serious review needs a rubric, evidence, severity, and prioritized fixes. | Guides repo, workflow, prompt, or system audits with scores and gaps. | Avoids superficial review based only on structure or naming. |
| Project recap | Re-entering a project requires operational context, not just README summary. | Requires project identity, architecture, recent activity, decisions, risks, and next action. | Restores context faster and reduces repeated repo exploration. |
| Ticket triage board | Prioritization is interactive and comparative. | Defines sortable/filterable issue boards with scoring criteria and exportable output. | Turns a backlog into a decision tool. |
| Feature flag / config editor | Config states interact and can create invalid combinations. | Encourages controls, resulting config preview, invalid-state warnings, and export. | Makes configuration safer and more visible. |
| Prompt / agent behavior tuner | Agent instructions require trade-offs, failure modes, and exportable prompts. | Creates interfaces for tuning behavior dimensions, expected output, and final prompt text. | Makes prompt engineering less vague and more operational. |

## What this repo adds

### 1. Safe installer

The installer can install upstream `visual-explainer` and then adds the `html-explainer` layer.

It includes:

- backups for replaced files;
- post-install verification;
- dry-run mode;
- optional upstream installation;
- optional example download;
- installation into `~/.claude` by default.

### 2. Safe uninstaller

`uninstall.sh` lets users remove the installed layer or restore the latest backup.

It supports:

- restoring from the latest backup;
- removing managed files when no backup exists;
- `DRY_RUN=1` preview mode;
- `RESTORE_BACKUP=0` removal-only mode;
- `KEEP_BACKUPS=0` cleanup mode;
- temporary `CLAUDE_HOME` for testing.

### 3. Claude Code skill

The skill `thariq-html-effectiveness` teaches Claude Code to use router + pattern file + fact sheet + quality bar before generating HTML.

### 4. Pattern router

`docs/pattern-router.md` maps task signals to the correct pattern.

Example:

- git diff present -> annotated diff review;
- many issues -> ticket triage board;
- workflow with retries/failures -> process flowchart;
- prompt tuning -> prompt / agent behavior tuner.

### 5. Twenty-one executable pattern files

Each file in `patterns/` is a compact recipe for one artifact type.

Example pattern files:

- `patterns/01-code-approach-comparison.md`
- `patterns/03-annotated-pr-diff-review.md`
- `patterns/09-architecture-diagram.md`
- `patterns/17-project-recap.md`
- `patterns/20-prompt-agent-behavior-tuner.md`

### 6. Fact-sheet protocol

`docs/fact-sheet-protocol.md` prevents attractive but false HTML by separating:

- verified facts;
- inferences;
- unknowns;
- risk-bearing claims;
- minimum validation.

### 7. Quality bar

`docs/QUALITY_BAR.md` defines what makes an HTML artifact acceptable.

An artifact must improve decision quality over Markdown, show evidence, expose uncertainty, use the correct visual form, stay small, and end with a concrete next action.

### 8. Intent distillation

`docs/INTENT_DISTILLATION.md` forces the agent to identify:

- primary intent;
- obvious secondary intents;
- base concept;
- decision the user needs to make;
- fastest path to value;
- surprising ease opportunity;
- what not to build.

This prevents artifacts that look complete but miss the real user need.

### 9. UX standard

`docs/HTML_UX_STANDARD.md` converts the HTML effectiveness approach into concrete UX rules:

- first-screen contract;
- artifact fit;
- evidence UX;
- interaction and export rules;
- mobile and visual clarity rules;
- hard fail conditions.

### 10. Artifact budget

`docs/ARTIFACT_BUDGET.md` prevents the visualizer from costing more than the problem.

It forces a choice:

- `compact` for quick orientation or small reviews;
- `standard` for evidence, structure, risks, and decisions;
- `interactive` only when controls change the decision or export usable output.

Each artifact must state why HTML beats Markdown and what mental work it removes.

### 11. Audit command

`/audit-html` reviews an existing artifact and scores it against:

- pattern fit;
- decision value;
- primary intent fit;
- secondary intent coverage;
- base concept clarity;
- evidence visibility;
- fact/inference/unknown separation;
- first-screen usefulness;
- UX fit;
- visual clarity;
- interaction usefulness;
- exportability;
- risk visibility;
- simplicity;
- next-action clarity.

### 12. CI and smoke tests

The repo includes GitHub Actions and scripts to validate:

- Bash syntax;
- installer dry-run;
- installer smoke test with temporary `CLAUDE_HOME`;
- uninstaller dry-run;
- uninstaller smoke test with temporary `CLAUDE_HOME`;
- exactly 21 pattern files;
- required sections in each pattern.
- example artifact UX minimums.

### 13. Example artifacts

The repo includes example artifacts so models have concrete shapes to imitate:

- `examples/plan-review-minimal.example.html`
- `examples/diff-review-minimal.example.html`
- `examples/prompt-tuner-minimal.example.html`
- `examples/diff-review-full.example.html`
- `examples/architecture-diagram.example.html`
- `examples/project-recap.example.html`
- `examples/ticket-triage.example.html`
- `examples/prompt-tuner-full.example.html`
- `examples/visual-direction-explorer.example.html`

## Commands

```text
/pick-the-right-html
/make-the-right-html
/check-the-plan
/check-the-diff
/reenter-project
/build-decision-tool
/audit-html
```

| Command | Intent | Main value |
|---|---|---|
| `/pick-the-right-html` | Choose the correct artifact pattern | Prevents unnecessary or wrong HTML |
| `/make-the-right-html` | Generate the right verified HTML artifact | General-purpose visual reasoning |
| `/check-the-plan` | Review a plan before implementation | Prevents coding on false assumptions |
| `/check-the-diff` | Review code changes before accepting them | Makes diffs easier to audit |
| `/reenter-project` | Re-enter a repo/project quickly | Restores context and identifies next action |
| `/build-decision-tool` | Build a temporary decision editor | Turns triage/config/prompt tuning into an interactive tool |
| `/audit-html` | Audit an existing HTML artifact | Prevents pretty but weak artifacts from being trusted |

## Install from curl

Recommended first run:

```bash
DRY_RUN=1 curl -fsSL https://raw.githubusercontent.com/ramsani/html-explainer/main/install.sh | bash
```

Install:

```bash
curl -fsSL https://raw.githubusercontent.com/ramsani/html-explainer/main/install.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/ramsani/html-explainer.git
cd html-explainer
DRY_RUN=1 bash install.sh
bash install.sh
```

## Verify locally

Before sharing changes, run:

```bash
bash -n install.sh uninstall.sh scripts/*.sh
scripts/validate-patterns.sh
scripts/validate-commands.sh
scripts/validate-examples.sh
DRY_RUN=1 INSTALL_UPSTREAM=0 FETCH_EXAMPLES=0 bash install.sh
scripts/smoke-install.sh
scripts/smoke-uninstall.sh
```

## Safe uninstall

Preview uninstall:

```bash
DRY_RUN=1 bash uninstall.sh
```

Restore the latest backup or remove managed files if no backup exists:

```bash
bash uninstall.sh
```

Remove without restoring backup:

```bash
RESTORE_BACKUP=0 bash uninstall.sh
```

Remove and delete backups:

```bash
KEEP_BACKUPS=0 bash uninstall.sh
```

## Installer flags

```bash
# Skip upstream visual-explainer and install only the Thariq layer
INSTALL_UPSTREAM=0 bash install.sh

# Skip downloading local reference examples
FETCH_EXAMPLES=0 bash install.sh

# Override Claude home
CLAUDE_HOME="$HOME/.claude" bash install.sh
```

The installer backs up replaced files under:

```text
~/.claude/html-explainer/backups/<timestamp>/
```

## Use in Claude Code

Start with pattern selection:

```text
/pick-the-right-html revisa esta tarea y dime qué patrón HTML conviene usar. No generes todavía el HTML.
```

Then generate:

```text
/make-the-right-html genera el artefacto HTML correcto usando router, pattern file, fact sheet, quality bar, evidencia, riesgos, incertidumbre y criterio de éxito.
```

For repo workflows:

```text
/check-the-plan revisa este plan contra el repo real antes de implementar.
/check-the-diff revisa el diff actual antes de aceptar el cambio.
/reenter-project crea un recap visual del repo para reentrar contexto.
/build-decision-tool diseña un editor HTML temporal con exportación para esta decisión.
/audit-html revisa este HTML y dime si realmente cumple el approach.
```

## Design principles

### Evidence before interface

The model must inspect real sources before generating HTML.

### One primary artifact

Use one main pattern and at most two supporting sections. Avoid bloated dashboards.

### Decision over decoration

The artifact must help the user decide, review, compare, diagnose, prioritize, teach, or act.

### Uncertainty must be visible

Unknowns, unsupported claims, and inferred conclusions must be clearly separated.

### Exportable when interactive

Custom editors must produce usable output: Markdown, JSON, config, issue body, prompt, or checklist.

## Current status

This repo is intended as a practical Claude Code skill and installer. It is not a fork of `visual-explainer`; it is a complementary layer that makes `visual-explainer` more disciplined and useful for real engineering review workflows.

See [`CHANGELOG.md`](CHANGELOG.md) for recent changes.
