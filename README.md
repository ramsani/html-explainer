# html-explainer

`html-explainer` is an installer and Claude Code skill layer that extends `visual-explainer` with a stricter operating model inspired by Thariq S. Bate's "The unreasonable effectiveness of HTML" examples.

Its purpose is simple: help coding agents produce HTML artifacts that improve technical judgment, not just presentation.

`visual-explainer` is the rendering and command foundation. `html-explainer` adds the missing decision layer: when to use HTML, which artifact pattern to choose, what evidence must be verified first, and how to avoid attractive but shallow reports.

## What problem this solves

Agents often produce long Markdown responses for work that is not naturally linear:

- architecture maps
- diffs and pull requests
- implementation plans
- dependency graphs
- timelines
- UI states
- workflow diagrams
- issue triage
- prompt and agent-behavior tuning
- incident reports

Markdown can describe these things, but it flattens them. The user must mentally reconstruct relationships, risk, sequence, and scope.

HTML solves a different problem: it lets an agent create a review surface. A good HTML artifact can show structure, comparison, evidence, uncertainty, interaction, and next action in one navigable place.

## How this complements visual-explainer

`visual-explainer` already provides useful HTML generation capabilities for diagrams, visual plans, slides, diff reviews, plan reviews, project recaps, fact checks, and complex tables.

`html-explainer` does not replace it. It wraps and strengthens it.

| Layer | visual-explainer | html-explainer |
|---|---|---|
| Core role | Generate useful HTML artifacts | Decide when, why, and how HTML should be used |
| Strength | Rendering, command patterns, visual reports | Operating discipline, pattern selection, evidence-first workflow |
| Main risk addressed | Markdown is a poor medium for complex technical structure | HTML can become beautiful but unverifiable |
| Best use | Produce visual diagrams, plans, reviews, recaps | Make those artifacts safer, sharper, and more decision-oriented |
| Output focus | HTML artifact | Verified HTML artifact tied to intent, evidence, risks, and success criteria |

In short:

```text
visual-explainer = HTML artifact capability
html-explainer   = professional review protocol for using that capability well
```

## What this repo adds

### 1. A safe installer

The installer can install the upstream `visual-explainer` skill and then adds the `html-explainer` layer.

It also adds safeguards that matter in real workflows:

- backs up replaced files
- verifies installed files
- supports dry-run mode
- can skip upstream installation
- can skip local example downloads
- installs into `~/.claude` by default

Why this matters: the tool should be easy to adopt without damaging an existing Claude Code setup.

### 2. A Claude Code skill: `thariq-html-effectiveness`

This skill teaches the agent a stricter rule:

```text
explore -> verify -> fact sheet -> choose pattern -> generate HTML -> audit -> decide
```

Why this matters: without this sequence, a model can generate HTML that looks impressive but is based on weak inspection.

### 3. A 20-case HTML pattern library

The repo includes `docs/thariq-20-case-library.md`, which turns the HTML effectiveness examples into operational agent guidance.

It covers patterns such as:

- code approach comparison
- visual implementation plans
- annotated PR / diff review
- module maps
- design token contact sheets
- component state matrices
- interactive flow prototypes
- microinteraction sandboxes
- architecture diagrams
- process flowcharts
- technical decision decks
- project progress decks
- concept explainers
- research comparison maps
- incident reports
- audit reports
- project recaps
- ticket triage boards
- feature flag/config editors
- prompt and agent behavior tuners

Why this matters: the model does not just know that HTML is possible. It knows what each pattern is for, when to use it, what it must contain, and what failure modes to avoid.

### 4. A pattern selection guide

The command `/html-pattern-select` forces the agent to choose the smallest useful artifact before generating anything.

Why this matters: not every task deserves HTML. This prevents dashboard bloat and keeps the workflow lean.

### 5. A fact-sheet protocol

The fact sheet separates:

- verified facts
- inferences
- unknowns
- risk-bearing claims
- minimum validation required

Why this matters: the most dangerous failure mode is not a bad-looking artifact. It is a convincing artifact that presents unverified claims as facts.

### 6. High-value Claude commands

This repo adds commands aimed at real development workflows:

```text
/html-pattern-select
/html-effectiveness
/html-plan-review-plus
/html-diff-review-plus
/html-project-recap-plus
/html-custom-editor-plus
```

Each command has a specific job:

| Command | Intent | Main value |
|---|---|---|
| `/html-pattern-select` | Choose the correct artifact pattern | Prevents unnecessary or wrong HTML |
| `/html-effectiveness` | Generate the right verified HTML artifact | General-purpose visual reasoning |
| `/html-plan-review-plus` | Review a plan before implementation | Prevents coding on false assumptions |
| `/html-diff-review-plus` | Review code changes before accepting them | Makes diffs easier to audit |
| `/html-project-recap-plus` | Re-enter a repo/project quickly | Restores context and identifies next action |
| `/html-custom-editor-plus` | Build a temporary decision editor | Turns triage/config/prompt tuning into an interactive tool |

## Safe install

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

Inside a repo, start with pattern selection:

```text
/html-pattern-select revisa esta tarea y dime qué patrón HTML conviene usar. No generes todavía el HTML.
```

Then generate the artifact:

```text
/html-effectiveness genera el artefacto HTML correcto usando fact sheet, evidencia, riesgos, incertidumbre y criterio de éxito.
```

For repo workflows:

```text
/html-plan-review-plus revisa este plan contra el repo real antes de implementar.
/html-diff-review-plus revisa el diff actual antes de aceptar el cambio.
/html-project-recap-plus crea un recap visual del repo para reentrar contexto.
/html-custom-editor-plus diseña un editor HTML temporal con exportación para esta decisión.
```

## Operating rule

Use HTML only when the work has spatial, comparative, interactive, or review-heavy structure.

Good uses:

- architecture
- plans
- diffs
- flows
- timelines
- design systems
- prototypes
- reports
- custom editing loops

Bad uses:

- simple answers
- tiny fixes
- one-command replies
- explanations that fit cleanly in a short Markdown response

## Core workflow

```text
explore -> verify -> fact sheet -> choose pattern -> generate HTML -> audit -> decide
```

The HTML is the final interface, not the analysis itself.

## Installed files

- `skills/thariq-html-effectiveness/SKILL.md`
- `commands/html-effectiveness.md`
- `commands/html-pattern-select.md`
- `commands/html-plan-review-plus.md`
- `commands/html-diff-review-plus.md`
- `commands/html-project-recap-plus.md`
- `commands/html-custom-editor-plus.md`
- `docs/thariq-20-case-library.md`
- `docs/html-artifact-selection-guide.md`
- `docs/fact-sheet-protocol.md`

## Design principles

### Evidence before interface

The model must inspect real sources before generating HTML.

### One primary artifact

Use one main pattern and at most two supporting sections. Avoid bloated dashboards.

### Decision over decoration

The artifact must help the user decide, review, compare, or act.

### Uncertainty must be visible

Unknowns, unsupported claims, and inferred conclusions must be clearly separated.

### Exportable when interactive

Custom editors must produce usable output: Markdown, JSON, config, issue body, prompt, or checklist.

## Why this can add high value to development workflows

This repo is useful when coding agents are doing work that a human must supervise:

- reviewing plans before code is touched
- checking whether a diff is safe
- understanding an unfamiliar repo
- turning vague app ideas into structured implementation options
- reviewing agent-generated issues
- triaging multiple possible tasks
- designing safer prompts and agent instructions

The practical benefit is lower cognitive load and fewer hidden assumptions. The user should be able to see what the agent inspected, what it believes, what remains uncertain, what can go wrong, and what should happen next.

## Current status

This repo is intended as a practical Claude Code skill and installer. It is not a fork of `visual-explainer`; it is a complementary layer that makes `visual-explainer` more disciplined and useful for real engineering review workflows.
