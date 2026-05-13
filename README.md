# html-explainer

`html-explainer` helps Claude Code create HTML artifacts that people actually read.

It is not "HTML because it looks nice." It is HTML when a browser view helps the user understand, decide, review, compare, tune, or continue work better than Markdown.

Core path:

```text
intent -> evidence -> visual understanding -> decision -> expert next prompt
```

`visual-explainer` gives Claude the HTML artifact capability.

`html-explainer` adds the operating discipline: when to use HTML, what evidence to inspect, how to keep the user in the loop, and how to end with the next useful prompt.

## Install

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

Restart Claude Code after installation.

The installer adds:

- the `thariq-html-effectiveness` skill;
- intent-first slash commands;
- local pattern and quality docs under `~/.claude/html-explainer/`;
- a short managed guide in `~/.claude/CLAUDE.md`;
- backups under `~/.claude/html-explainer/backups/<timestamp>/`.

The `CLAUDE.md` guide is marked with:

```text
<!-- html-explainer:start -->
<!-- html-explainer:end -->
```

Future installs update only that block. Existing `CLAUDE.md` content is not overwritten.

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
```

Generated artifacts should be saved in a practical local path, opened in the browser when the environment allows it, and returned with a clickable absolute path.

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
- end with a clear next action and an editable next prompt.

If interaction is included, it must change something meaningful and export usable output: Markdown, JSON, config, issue body, checklist, or prompt.

## What It Adds Over visual-explainer

`visual-explainer` is excellent at generating rich HTML artifacts.

`html-explainer` is for users who want more control over the reasoning before and after the artifact:

- intent selection before generation;
- evidence-first workflow;
- pattern routing;
- quality bar;
- lean artifact budget;
- next-step prompts that preserve context;
- safe installer and uninstaller;
- brief `CLAUDE.md` guide so the agent remembers how to use the system.

Use `visual-explainer` when you mainly want quick HTML output.

Use `html-explainer` when the HTML should help make or review a real decision.

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

# Skip downloading local reference examples
FETCH_EXAMPLES=0 bash install.sh

# Install into another Claude home
CLAUDE_HOME="$HOME/.claude" bash install.sh
```

## Verify Locally

```bash
bash -n install.sh uninstall.sh scripts/*.sh
scripts/validate-patterns.sh
scripts/validate-commands.sh
scripts/validate-examples.sh
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
