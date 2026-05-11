# html-explainer

`html-explainer` is a Claude Code skill layer and installer that extends `visual-explainer` with an evidence-first operating model inspired by Thariq S. Bate's "The unreasonable effectiveness of HTML" approach.

Its purpose is not to make agent output prettier. Its purpose is to help coding agents produce HTML artifacts that improve technical judgment: review, comparison, diagnosis, planning, triage, reentry, and decision-making.

```text
visual-explainer = HTML artifact capability
html-explainer   = disciplined operating layer for using that capability well
```

## Attribution

This project is built as a complementary layer around two important prior contributions:

- **Visual Explainer by Nico Bailon** — the upstream agent skill that generates rich, self-contained HTML pages for diagrams, visual plans, slides, diff reviews, plan audits, project recaps, fact checks, and complex tables.
- **The HTML effectiveness approach by Thariq S. Bate** — the idea that HTML can be a superior medium for many agent outputs because it can represent structure, comparison, interaction, visual hierarchy, and decision context better than flat Markdown.

`html-explainer` is not an official project of Nico Bailon or Thariq S. Bate. It is an independent integration and operating layer that credits both sources: Visual Explainer as the implementation foundation, and Thariq's HTML effectiveness approach as the conceptual pattern library.

See [`CREDITS.md`](CREDITS.md) for details.

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
route -> pattern file -> evidence -> fact sheet -> artifact -> quality bar -> decision
```

That means the agent must:

1. decide whether HTML is justified;
2. use `docs/pattern-router.md` to select one primary pattern;
3. open the matching file in `patterns/`;
4. inspect real evidence;
5. create a fact sheet;
6. generate the smallest useful HTML artifact;
7. apply `docs/QUALITY_BAR.md` before finalizing;
8. expose uncertainty and next action.

## How the Thariq ideas are used case by case

The Thariq idea is not copied as one generic prompt. It is decomposed into 20 executable patterns.

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
| Design token contact sheet | Design systems are visual; tokens and styles need to be seen. | Guides agents to expose colors, typography, spacing, radii, shadows, and inconsistencies. | Prevents UI changes that ignore the existing design language. |
| Component state matrix | UI quality depends on states, not just static components. | Requires variants, empty/loading/error/disabled states, responsiveness, and accessibility notes. | Makes UI review more realistic before implementation. |
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

### 2. Claude Code skill

The skill `thariq-html-effectiveness` teaches Claude Code to use router + pattern file + fact sheet + quality bar before generating HTML.

### 3. Pattern router

`docs/pattern-router.md` maps task signals to the correct pattern.

Example:

- git diff present -> annotated diff review;
- many issues -> ticket triage board;
- workflow with retries/failures -> process flowchart;
- prompt tuning -> prompt / agent behavior tuner.

### 4. Twenty executable pattern files

Each file in `patterns/` is a compact recipe for one artifact type.

Example pattern files:

- `patterns/01-code-approach-comparison.md`
- `patterns/03-annotated-pr-diff-review.md`
- `patterns/09-architecture-diagram.md`
- `patterns/17-project-recap.md`
- `patterns/20-prompt-agent-behavior-tuner.md`

### 5. Fact-sheet protocol

`docs/fact-sheet-protocol.md` prevents attractive but false HTML by separating:

- verified facts;
- inferences;
- unknowns;
- risk-bearing claims;
- minimum validation.

### 6. Quality bar

`docs/QUALITY_BAR.md` defines what makes an HTML artifact acceptable.

An artifact must improve decision quality over Markdown, show evidence, expose uncertainty, use the correct visual form, stay small, and end with a concrete next action.

### 7. Audit command

`/html-audit-artifact` reviews an existing artifact and scores it against:

- pattern fit;
- decision value;
- evidence visibility;
- fact/inference/unknown separation;
- visual clarity;
- interaction usefulness;
- exportability;
- risk visibility;
- simplicity;
- next-action clarity.

### 8. Minimal examples

The repo includes small example artifacts so models have concrete shapes to imitate:

- `examples/plan-review-minimal.example.html`
- `examples/diff-review-minimal.example.html`
- `examples/prompt-tuner-minimal.example.html`

## Commands

```text
/html-pattern-select
/html-effectiveness
/html-plan-review-plus
/html-diff-review-plus
/html-project-recap-plus
/html-custom-editor-plus
/html-audit-artifact
```

| Command | Intent | Main value |
|---|---|---|
| `/html-pattern-select` | Choose the correct artifact pattern | Prevents unnecessary or wrong HTML |
| `/html-effectiveness` | Generate the right verified HTML artifact | General-purpose visual reasoning |
| `/html-plan-review-plus` | Review a plan before implementation | Prevents coding on false assumptions |
| `/html-diff-review-plus` | Review code changes before accepting them | Makes diffs easier to audit |
| `/html-project-recap-plus` | Re-enter a repo/project quickly | Restores context and identifies next action |
| `/html-custom-editor-plus` | Build a temporary decision editor | Turns triage/config/prompt tuning into an interactive tool |
| `/html-audit-artifact` | Audit an existing HTML artifact | Prevents pretty but weak artifacts from being trusted |

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

Start with pattern selection:

```text
/html-pattern-select revisa esta tarea y dime qué patrón HTML conviene usar. No generes todavía el HTML.
```

Then generate:

```text
/html-effectiveness genera el artefacto HTML correcto usando router, pattern file, fact sheet, quality bar, evidencia, riesgos, incertidumbre y criterio de éxito.
```

For repo workflows:

```text
/html-plan-review-plus revisa este plan contra el repo real antes de implementar.
/html-diff-review-plus revisa el diff actual antes de aceptar el cambio.
/html-project-recap-plus crea un recap visual del repo para reentrar contexto.
/html-custom-editor-plus diseña un editor HTML temporal con exportación para esta decisión.
/html-audit-artifact revisa este HTML y dime si realmente cumple el approach.
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
