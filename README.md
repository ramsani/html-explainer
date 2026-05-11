# html-explainer

Installer and Claude Code skill that extends `visual-explainer` with the operating model from Thariq S. Bate's "The unreasonable effectiveness of HTML" examples.

The goal is not prettier reports. The goal is to make agent work easier to inspect, compare, verify, decide, and re-enter.

## What this installs

- Upstream `visual-explainer` when available.
- A Claude Code skill: `thariq-html-effectiveness`.
- Claude commands for selecting and generating the right HTML artifact.
- A 20-case pattern library inspired by the HTML effectiveness examples.
- A fact-sheet protocol to avoid attractive but unverifiable HTML.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/ramsani/html-explainer/main/install.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/ramsani/html-explainer.git
cd html-explainer
bash install.sh
```

## Use in Claude Code

Inside a repo:

```text
/html-pattern-select revisa esta tarea y dime qué patrón HTML conviene usar. No generes todavía el HTML.
```

Then:

```text
/html-effectiveness genera el artefacto HTML correcto usando fact sheet, evidencia, riesgos, incertidumbre y criterio de éxito.
```

For technical repo workflows:

```text
/html-plan-review-plus revisa este plan contra el repo real antes de implementar.
/html-diff-review-plus revisa el diff actual antes de aceptar el cambio.
/html-project-recap-plus crea un recap visual del repo para reentrar contexto.
/html-custom-editor-plus diseña un editor HTML temporal con exportación para esta decisión.
```

## Operating rule

Use HTML only when the work has spatial, comparative, interactive, or review-heavy structure: architecture, plans, diffs, flows, timelines, design systems, prototypes, reports, or custom editing loops.

Do not use HTML for simple answers, tiny fixes, or anything that fits clearly in a short Markdown response.

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

## Why this exists

Markdown flattens certain kinds of work. Diffs, call graphs, timelines, UI states, dependency maps, trade-offs, and ticket triage are spatial or interactive information. HTML lets an agent produce a review surface instead of a wall of prose.

This package turns that idea into an installable, low-friction protocol for Claude Code and compatible agent workflows.
