# html-explainer

[![CI](https://github.com/ramsani/html-explainer/actions/workflows/ci.yml/badge.svg)](https://github.com/ramsani/html-explainer/actions/workflows/ci.yml)
![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)
![Patterns](https://img.shields.io/badge/patterns-22-blue.svg)

`html-explainer` helps Claude Code create HTML artifacts that people actually use.

It is not "HTML because it looks nice." It is HTML when a browser view helps the user understand, decide, review, compare, tune, or continue work better than Markdown.

It adds a local delivery gate and a local knowledge base. A useful artifact is generated, checked, saved when valuable, connected to related work, and made easy to find again.

The experience should feel simple on purpose: one clear surface, one recommended next move, a few respectful options, and useful power under the mouse. The user can continue, compare, revise, save, think it through, or stop without losing context.

The repository is documented in English so it is easy to share, install, inspect, and contribute to. The user experience should match the user's language. If the user writes in Spanish, the agent response and generated artifact should be in Spanish unless the user asks for another language.

Core path:

```text
intent -> evidence -> visual understanding -> decision -> next action -> reusable memory
```

`visual-explainer` gives Claude the HTML artifact capability.

`html-explainer` adds the operating discipline: when to use HTML, what evidence to inspect, how to keep the user in the loop, and how to end with the next useful prompt.

## What You Get In 60 Seconds

After installing, Claude Code gets commands that can:

- decide when HTML is worth using and when Markdown is enough;
- generate self-contained decision-ready HTML;
- audit the HTML before delivery and block weak artifacts;
- save valuable artifacts into a local knowledge base;
- regenerate a local `index.html` with Maps of Content, resurfacing, related pages, filters, annotations, and re-entry prompts.

Open the local knowledge base after saving artifacts:

```bash
open ~/.claude/html-explainer/outputs/index.html
```

## Why This Is Different

Most agent HTML output is a one-time pretty file.

`html-explainer` treats HTML as a decision surface and reusable memory:

```text
ask -> inspect evidence -> choose pattern -> generate HTML -> audit -> save -> reconnect later
```

The user sees a clean artifact. The system handles the checks, metadata, freshness risk, and future re-entry path.

## Who This Is For

Use it when Claude Code work needs a clearer surface than chat:

- repo recaps and re-entry;
- plan, diff, and PR review;
- architecture and workflow maps;
- research comparisons;
- decision decks;
- prompt or agent behavior tuning;
- thinking through unclear ideas;
- turning useful outputs into local knowledge.

## Design Promise

`html-explainer` exists to prevent three common agent failures:

1. sounding clear without inspected evidence;
2. creating visual output that does not improve the decision;
3. ending without a useful next step.

The repo is designed so serious HTML artifacts must expose intent, evidence, uncertainty, risk, recommendation, next action, and reusable memory.

It also protects the human side of the interaction:

- invitations are quiet, not pushy;
- deeper functions are offered only when useful;
- every pattern leaves the user free to choose another path;
- interactive controls must help compare, tune, preview, copy, export, save, or continue;
- the artifact should feel like capable support, not visible machinery.

The V1 closeout audit checks every repo function against this promise. See [`docs/V1_FUNCTION_AUDIT.md`](docs/V1_FUNCTION_AUDIT.md).

V1.1 adds invisible quality control: local scripts confirm artifacts contain the required parts before they are trusted. `/make-the-right-html` now uses a delivery command before the final response. The user sees the clean result, not the machinery.

Every artifact is shaped around intent, evidence, visual clarity, decision support, next action, and reusable memory before delivery.

## What The User Gets

`html-explainer` turns agent output into a browser-readable decision surface.

The user gets:

- faster understanding because the first screen shows the point, risk, and next action;
- less mental work because evidence, trade-offs, unknowns, and recommendations are visible together;
- a natural interface because the artifact uses plain labels, calm invitations, and a small set of meaningful choices;
- real control because useful interactions let the user compare, tune, preview, copy, export, save, or continue;
- safer decisions because claims are tied to inspected evidence;
- clearer reviews because plans, diffs, workflows, and architectures show risk before action;
- useful next prompts because every serious artifact carries the context needed for the next agent step;
- reusable memory because valuable artifacts can be saved locally with metadata, freshness risk, and a re-entry path;
- less noise because HTML is rejected when Markdown is enough;
- lower onboarding friction because commands are named by user intent, not internal implementation;
- trust through validation because examples, commands, patterns, routing scenarios, install, and uninstall are checked locally.
- quieter quality because local audit scripts block artifacts that are missing critical parts before they reach the user.

The user should not need to understand internal rules. They should feel the result as clarity, speed, safer choices, and less repeated explanation.

## What It Feels Like

The artifact should make the next useful action obvious without cornering the user.

```text
Best next move: Review before implementing.
Other useful options: Compare approaches · Think this through · Save for later
Continue from here: <copy-ready prompt>
```

The invitation to `/think-with-me-about` is not a pop-up or sales pitch. It appears only when the user is still forming the question, facing a hard decision, or carrying an idea that needs evidence, stress testing, and a clearer next action.

## 60-Second Demo

Open [`examples/before-after-decision.example.html`](examples/before-after-decision.example.html).

It shows the same request two ways:

- a skimmable answer that looks organized but leaves the user to do the hard thinking;
- an intent-led HTML artifact that exposes evidence, risk, recommendation, and a copy-ready next prompt.

The point is simple: HTML is worth the extra tokens only when it removes mental work.

See [`docs/DEMO.md`](docs/DEMO.md) for the demo explanation.

## Visual Preview

This preview shows the core promise: the browser view puts intent, evidence, risk, recommendation, and the next prompt on the same decision surface.

![Decision-ready HTML artifact preview](docs/assets/before-after-decision-preview.png)

## Install

Quick install:

```bash
curl -fsSL https://raw.githubusercontent.com/ramsani/html-explainer/main/install.sh | bash
```

Restart Claude Code after installation.

Prefer to inspect first:

First run a preview:

```bash
git clone https://github.com/ramsani/html-explainer.git /tmp/html-explainer
cd /tmp/html-explainer
DRY_RUN=1 bash install.sh
```

Then install:

```bash
bash install.sh
```

The installer adds:

- the `thariq-html-effectiveness` skill;
- intent-first slash commands;
- core docs, product docs, advanced reference docs, patterns, and bundled examples under `~/.claude/html-explainer/`;
- a short managed guide in `~/.claude/CLAUDE.md`;
- backups under `~/.claude/html-explainer/backups/<timestamp>/`.

The `CLAUDE.md` guide is marked with:

```text
<!-- html-explainer:start -->
<!-- html-explainer:end -->
```

Future installs update only that block. Existing `CLAUDE.md` content is not overwritten.

## Credit First

This project starts from three public contributions that deserve clear credit:

- [`visual-explainer`](https://github.com/nicobailon/visual-explainer) by Nico Bailon, credited as the upstream HTML artifact capability this repo can install and build around.
- ["The unreasonable effectiveness of HTML"](https://thariqs.github.io/html-effectiveness/) by Thariq S. Bate, credited as the conceptual foundation for using HTML when it keeps humans more in the loop than Markdown.
- [`skills`](https://github.com/mattpocock/skills) by Matt Pocock, credited as inspiration for small, composable skill-shaped agent instructions.

`html-explainer` is an independent complementary layer. It does not replace those projects, claim affiliation, or copy their work as product output. It packages an intent-first workflow around them so Claude Code can decide when HTML is worth using, inspect evidence first, and end with a useful next prompt.

See [`CREDITS.md`](CREDITS.md) for the full attribution.

## Update

If you already cloned the repo:

```bash
cd /tmp/html-explainer
git pull origin main
DRY_RUN=1 bash install.sh
bash install.sh
```

If the old clone is gone:

```bash
rm -rf /tmp/html-explainer
git clone https://github.com/ramsani/html-explainer.git /tmp/html-explainer
cd /tmp/html-explainer
DRY_RUN=1 bash install.sh
bash install.sh
```

## Commands

```text
/pick-the-right-html
/make-the-right-html
/check-the-plan
/check-the-diff
/reenter-project
/build-decision-tool
/audit-html
/think-with-me-about
```

| Command | Use it when you want to... |
|---|---|
| `/pick-the-right-html` | Decide whether HTML is worth it and which artifact fits. |
| `/make-the-right-html` | Generate the right verified HTML artifact. |
| `/check-the-plan` | Review a plan before coding. |
| `/check-the-diff` | Review a diff or PR before accepting it. |
| `/reenter-project` | Understand a repo quickly and see the next action. |
| `/build-decision-tool` | Build a temporary editor, triage board, tuner, or config tool. |
| `/audit-html` | Check whether an existing artifact is actually useful. |
| `/think-with-me-about` | Turn a vague topic into a visual thinking surface with evidence, stress testing, action, and re-entry. |

## Results By Use Case

| User need | What html-explainer delivers | User benefit |
|---|---|---|
| Decide if HTML is worth it | Pattern choice, budget, evidence needs, and next command. | Avoids wasting time on decorative artifacts. |
| Generate a decision artifact | Self-contained HTML with evidence, risk, recommendation, and next action. | Turns scattered context into a clear decision surface. |
| Review a plan | Fit check, assumptions, missing proof, risks, and approve/revise/reject path. | Prevents weak plans from becoming weak implementation. |
| Review a diff or PR | Changed-file summary, findings, missing checks, severity, and merge decision. | Makes accept/request/block decisions easier and safer. |
| Re-enter a repo | Project identity, current state, evidence, risks, and next high-value action. | Restores context quickly without rereading everything. |
| Build a decision tool | Temporary editor, tuner, triage board, or config tool with export. | Lets the user manipulate choices and copy usable output. |
| Audit an artifact | Score, hard fails, evidence gaps, HTML gaps, and fix path. | Separates useful artifacts from polished noise. |
| Think through an idea | Framing, evidence, tensions, stress test, conclusion, action, and re-entry. | Converts vague thinking into a usable next move. |
| Save useful work | Metadata, validity, freshness, privacy, and re-entry guidance. | Prevents good artifacts from being lost or stale artifacts from being trusted. |
| Keep control | Quiet choices, copy/export actions, and optional deeper thinking. | The user sees what they can do next without being pushed. |

## Quick Usage

Start by choosing the right artifact:

```text
/pick-the-right-html revisa esta tarea y dime qué artefacto HTML conviene crear. No generes todavía el HTML.
```

Then generate it:

```text
/make-the-right-html genera el artefacto HTML correcto con evidencia, riesgos, incertidumbre, siguiente acción y prompt listo para copiar.
```

For common repo work:

```text
/reenter-project ayúdame a entender este repo y ver sus áreas de oportunidad usando HTML.
/check-the-plan revisa este plan contra el repo real antes de implementar.
/check-the-diff revisa el diff actual y dime qué aceptar, corregir o revertir.
/build-decision-tool convierte esta decisión en una herramienta HTML editable con exportación.
/think-with-me-about cómo debería decidir si esta idea merece convertirse en producto.
```

## Natural Workflow

Use the commands like working modes:

| Situation | Use | Example prompt |
|---|---|---|
| You have a vague idea or hard question | `/think-with-me-about` | `/think-with-me-about si esta idea debería convertirse en producto o solo quedarse como aprendizaje.` |
| You are not sure HTML is worth it | `/pick-the-right-html` | `/pick-the-right-html revisa esta tarea y dime qué artefacto conviene crear. No generes todavía el HTML.` |
| You already want the artifact | `/make-the-right-html` | `/make-the-right-html crea el artefacto correcto con evidencia, riesgos, siguiente acción y memoria reutilizable.` |
| You have a plan before implementation | `/check-the-plan` | `/check-the-plan revisa este plan antes de implementarlo: <plan>` |
| Files already changed | `/check-the-diff` | `/check-the-diff revisa los cambios actuales y dime si debo aceptar, corregir, verificar o dividir.` |
| You are returning to a repo | `/reenter-project` | `/reenter-project ayúdame a entender dónde está este repo, qué está sólido, qué falta y cuál es el siguiente paso.` |
| You need to compare or tune options | `/build-decision-tool` | `/build-decision-tool crea una herramienta para priorizar estas tareas por valor, riesgo y esfuerzo.` |
| You already have an HTML artifact | `/audit-html` | `/audit-html revisa este artefacto HTML y dime si realmente ayuda o solo se ve bonito.` |

Typical sequence:

```text
/think-with-me-about <idea or decision>
/pick-the-right-html <same topic, after the thinking pass>
/make-the-right-html <recommended artifact>
/check-the-plan <plan before implementation>
/check-the-diff <changes before accepting>
```

Generated artifacts should be saved in a practical local path, opened in the browser when the environment allows it, and returned with a clickable absolute path.

## Local Artifact Memory

`html-explainer` can generate artifacts that remain useful after the current chat. The repo now includes a local-first artifact memory path for saving generated HTML outputs outside the repository.

The core boundary is:

```text
The repo is the system.
The local output folder is the user's artifact memory.
```

Recommended local output root:

```text
~/.claude/html-explainer/outputs/
```

The artifact memory system implements a local file path and defines:

- lifespan classes: `temporal`, `replaceable`, `evergreen`, `superseded`, `private`, and `do-not-reuse`;
- metadata and index schemas;
- freshness, privacy, re-entry, and supersession rules;
- an actionable knowledge base model for search, relations, quick-reference cards, and next actions;
- a static explorer template that follows the same decision-ready HTML principles as the rest of the project;
- local scripts to audit, save, index, relate, resurface, and browse artifacts without a server or database.

The local knowledge base page is:

```text
~/.claude/html-explainer/outputs/index.html
```

It is regenerated after saving useful artifacts. It shows Maps of Content, resurfacing suggestions, backlinks, related pages, filters, annotations, and copy-ready re-entry prompts.

User-facing artifacts should expose this value as a tiny receipt, not a technical report:

```text
Saved for later: Project decisions
Find it fast: ask for "show the last repo review"
```

If the work is not worth preserving:

```text
Not saved: this was only useful for this example.
```

Start here:

- [`docs/ARTIFACT_MEMORY.md`](docs/ARTIFACT_MEMORY.md)
- [`docs/MEMORY_ACCESS.md`](docs/MEMORY_ACCESS.md)
- [`docs/ARTIFACT_METADATA_SCHEMA.md`](docs/ARTIFACT_METADATA_SCHEMA.md)
- [`docs/ACTIONABLE_KNOWLEDGE_BASE.md`](docs/ACTIONABLE_KNOWLEDGE_BASE.md)
- [`templates/artifact-explorer.html`](templates/artifact-explorer.html)
- [`examples/artifact-index.example.json`](examples/artifact-index.example.json)
- [`examples/artifact-metadata.example.json`](examples/artifact-metadata.example.json)

## Artifact Direction System

The repo now treats recurring artifact work as small packages instead of one-off prompts.

Start here:

- [`docs/USER_VALUE.md`](docs/USER_VALUE.md)
- [`docs/LANGUAGE_POLICY.md`](docs/LANGUAGE_POLICY.md)
- [`docs/ARTIFACT_DIRECTIONS.md`](docs/ARTIFACT_DIRECTIONS.md)
- [`docs/ARTIFACT_MODES.md`](docs/ARTIFACT_MODES.md)
- [`docs/ARTIFACT_CHECKLISTS.md`](docs/ARTIFACT_CHECKLISTS.md)
- [`docs/ANTI_SLOP.md`](docs/ANTI_SLOP.md)
- [`docs/PATTERN_PACKAGE_PROTOCOL.md`](docs/PATTERN_PACKAGE_PROTOCOL.md)
- [`docs/OPEN_DESIGN_LEARNINGS.md`](docs/OPEN_DESIGN_LEARNINGS.md)

## When HTML Is Worth It

Use HTML when the output replaces something people would skim or misunderstand:

| Work type | HTML should add |
|---|---|
| Exploration & Planning | Side-by-side options, trade-offs, dependencies, recommendation. |
| Code Review | Annotated diff, risk map, findings by severity, next action. |
| Design | Visual directions, component states, tokens, responsive states. |
| Prototyping | Clickable flows, sliders, knobs, live preview, export. |
| Diagrams | Architecture, workflows, failure paths, boundaries. |
| Decks | Shareable decision or progress story. |
| Research | Criteria, evidence quality, recommendation by use case. |
| Reports | Timeline, scorecard, risks, reentry checklist. |
| Custom Editors | Drag, sort, tune, validate, then copy the result out. |

Do not use HTML for short answers, single commands, tiny facts, or low-consequence notes.

## What Good Output Must Do

Every artifact should:

- answer the user's main intent directly;
- cover obvious secondary needs when they affect the decision;
- show the evidence inspected;
- separate facts, inferences, assumptions, and unknowns;
- use the smallest useful artifact size;
- explain why HTML beats Markdown for this case;
- respect system light/dark mode;
- keep visual design minimal, flat, readable, and professional;
- end with a clear next action, an editable next prompt, and an archive recommendation when the result may be useful later.

If interaction is included, it must change something meaningful and export usable output: Markdown, JSON, config, issue body, checklist, or prompt.

## Internal Shape

The default agent path is intentionally small:

```text
DECISION_GATE -> PATTERN_GUIDE -> pattern file -> FACT_SHEET -> STYLE -> QUALITY_BAR -> CHAIN -> DELIVERY -> ARTIFACT_MEMORY
```

Detailed older docs live in `docs/reference/`. They are available when needed, but they are not the default path.

## What It Adds Over visual-explainer

`visual-explainer` is excellent at generating rich HTML artifacts.

`html-explainer` is for users who want more control over the reasoning before and after the artifact:

- language-matched responses and artifacts for the user's audience;
- intent selection before generation;
- evidence-first workflow;
- pattern routing;
- quality bar;
- lean artifact budget;
- next-step prompts that preserve context;
- local-first artifact memory;
- safe installer and uninstaller;
- brief `CLAUDE.md` guide so the agent remembers how to use the system.

Use `visual-explainer` when you mainly want quick HTML output.

Use `html-explainer` when the HTML should help make or review a real decision.

## What This Is Not

- Not a standalone web app.
- Not an official Anthropic or Claude Code project.
- Not a replacement for `visual-explainer`.
- Not a general visual design tool.
- Not HTML for every answer.

Use it when HTML helps the user make or review a real decision.

## Contributing

Contributions are welcome when they strengthen the core path:

```text
intent -> evidence -> visual understanding -> decision -> next action -> reusable memory
```

See [`CONTRIBUTING.md`](CONTRIBUTING.md) before opening a PR.

## Safe Uninstall

Preview:

```bash
DRY_RUN=1 bash uninstall.sh
```

Restore latest backup, or remove managed files if no backup exists:

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

The uninstaller removes only the managed `CLAUDE.md` block. It does not rewrite the rest of your memory file.

## Installer Flags

```bash
# Skip upstream visual-explainer
INSTALL_UPSTREAM=0 bash install.sh

# Optionally download external Thariq reference pages
FETCH_EXAMPLES=1 bash install.sh

# Install into another Claude home
CLAUDE_HOME="$HOME/.claude" bash install.sh
```

## Verify Locally

```bash
bash -n install.sh uninstall.sh scripts/*.sh
scripts/validate-patterns.sh
scripts/validate-commands.sh
scripts/validate-examples.sh
scripts/validate-golden-artifacts.sh
scripts/validate-scenarios.sh
DRY_RUN=1 INSTALL_UPSTREAM=0 FETCH_EXAMPLES=0 bash install.sh
scripts/smoke-install.sh
scripts/smoke-uninstall.sh
```

## Credits

This project is an independent integration layer inspired by and built around:

- [visual-explainer](https://github.com/nicobailon/visual-explainer) by Nico Bailon;
- Thariq S. Bate's HTML effectiveness approach;
- Matt Pocock's skill and workflow style for practical engineering prompts.

It is not an official project of Nico Bailon, Thariq S. Bate, Matt Pocock, Anthropic, or Claude Code.

See [`CREDITS.md`](CREDITS.md) and [`CHANGELOG.md`](CHANGELOG.md).
