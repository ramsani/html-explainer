# html-explainer

[![CI](https://github.com/ramsani/html-explainer/actions/workflows/ci.yml/badge.svg)](https://github.com/ramsani/html-explainer/actions/workflows/ci.yml)
![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)
![Patterns](https://img.shields.io/badge/patterns-22-blue.svg)

## What It Does

`html-explainer` helps Claude Code create HTML artifacts that are worth opening.

It is not HTML for decoration. It is HTML when a browser view helps someone inspect evidence, understand risk, compare options, make a decision, continue work, or save useful context for later.

Core path:

```text
intent -> evidence -> visual understanding -> decision -> next action -> reusable memory
```

The user sees a clear artifact. The repo provides the quiet process behind it: routing, evidence checks, delivery audit, local memory, and re-entry prompts.

## Who It Is For

Use it when Claude Code work needs more than a chat answer:

- repo recaps and re-entry;
- plan, diff, and PR reviews;
- architecture and workflow maps;
- research comparisons;
- decision decks;
- prompt or agent behavior tuning;
- thinking through unclear ideas;
- saving useful artifacts into a local knowledge base.

Do not use it for short answers, single commands, tiny facts, or low-consequence notes.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/ramsani/html-explainer/main/install.sh | bash
```

Restart Claude Code after installation.

To inspect first:

```bash
git clone https://github.com/ramsani/html-explainer.git /tmp/html-explainer
cd /tmp/html-explainer
DRY_RUN=1 INSTALL_UPSTREAM=0 FETCH_EXAMPLES=0 bash install.sh
bash install.sh
```

The installer adds slash commands, the `thariq-html-effectiveness` skill, docs, patterns, runtime scripts, examples, and a managed block in `~/.claude/CLAUDE.md`. Existing content is backed up before replacement.

## First Command To Try

Start here when you are not sure HTML is worth it:

```text
/pick-the-right-html revisa esta tarea y dime qué artefacto HTML conviene crear. No generes todavía el HTML.
```

If you already know you want the artifact:

```text
/make-the-right-html genera el artefacto HTML correcto con evidencia, riesgos, incertidumbre, siguiente acción y prompt listo para copiar.
```

## Core Commands

| Command | Use it when you want to... |
|---|---|
| `/pick-the-right-html` | Decide whether HTML is worth it and which artifact fits. |
| `/make-the-right-html` | Generate a verified HTML artifact. |
| `/check-the-plan` | Review a plan before coding. |
| `/check-the-diff` | Review a diff or PR before accepting it. |
| `/reenter-project` | Understand a repo quickly and see the next action. |
| `/build-decision-tool` | Build a temporary editor, triage board, tuner, or config tool. |
| `/audit-html` | Check whether an existing artifact is actually useful. |
| `/think-with-me-about` | Turn a vague topic into a visual thinking surface with evidence, stress testing, action, and re-entry. |
| `/open-html-explainer-memory` | Open the local knowledge base of saved artifacts. |

## What Good Output Looks Like

A good artifact makes the next useful action obvious.

It should show:

- what the user is trying to decide;
- what evidence was inspected;
- what is fact, inference, assumption, or unknown;
- why HTML helps more than Markdown;
- the recommendation, risk, and next action early;
- a copy-ready next prompt;
- whether to save, keep private, refresh, supersede, discard, or not save it.

Interactive artifacts must produce usable output: copied prompt, Markdown, JSON, config, checklist, issue body, or another exportable result.

Open the quick demo:

```text
examples/before-after-decision.example.html
```

## Local Memory

Useful artifacts can be saved outside the repo under:

```text
~/.claude/html-explainer/outputs/
```

The local knowledge base is:

```bash
open ~/.claude/html-explainer/outputs/index.html
```

It shows saved pages, topics, Maps of Content, resurfacing suggestions, related artifacts, metadata, local annotations, and copy-ready re-entry prompts.

From Claude Code, use:

```text
/open-html-explainer-memory
```

## Autonomous Closeout

For longer work, use Claude Code's `/goal` so Claude keeps going until a verifiable finish line is met:

```text
/goal html-explainer V1 is complete when all validation scripts and smoke tests pass, README/CI/CONTRIBUTING list the same checks, and git status shows no generated junk.
```

Use it for audits, PR closure, artifact delivery, memory validation, and V1-style verification. Do not use it for small questions.

`/goal` is the intelligent closeout layer. The scripts remain the cheap CI floor; `/goal` decides whether the whole job is actually finished from the evidence Claude reports.

More examples: [`docs/GOAL_WORKFLOWS.md`](docs/GOAL_WORKFLOWS.md).

## Verify Locally

Run the same checks expected from contributors and CI:

```bash
bash -n install.sh uninstall.sh scripts/*.sh
scripts/validate-patterns.sh
scripts/validate-commands.sh
scripts/validate-examples.sh
scripts/validate-golden-artifacts.sh
scripts/validate-scenarios.sh
scripts/smoke-install.sh
scripts/smoke-uninstall.sh
scripts/smoke-artifact-memory.sh
DRY_RUN=1 INSTALL_UPSTREAM=0 FETCH_EXAMPLES=0 bash install.sh
```

For the docs reading order, see [`docs/DOCS_MAP.md`](docs/DOCS_MAP.md).

## Uninstall

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

## Credits

This project is an independent integration layer inspired by and built around:

- [`visual-explainer`](https://github.com/nicobailon/visual-explainer) by Nico Bailon;
- ["The unreasonable effectiveness of HTML"](https://thariqs.github.io/html-effectiveness/) by Thariq S. Bate;
- [`skills`](https://github.com/mattpocock/skills) by Matt Pocock.

It is not an official project of Nico Bailon, Thariq S. Bate, Matt Pocock, Anthropic, or Claude Code.

See [`CREDITS.md`](CREDITS.md), [`CHANGELOG.md`](CHANGELOG.md), and [`CONTRIBUTING.md`](CONTRIBUTING.md).
