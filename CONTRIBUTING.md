# Contributing

Thanks for improving `html-explainer`.

The project should stay small and useful. Every change should strengthen this path:

```text
intent -> evidence -> visual understanding -> decision -> expert next prompt
```

## Good Contributions

- Better pattern failure modes.
- Better examples.
- Clearer command behavior.
- Stronger validation scripts.
- Safer install/uninstall behavior.
- Simpler docs that remove confusion.

## Before Opening a PR

Run:

```bash
bash -n install.sh uninstall.sh scripts/*.sh
scripts/validate-patterns.sh
scripts/validate-commands.sh
scripts/validate-examples.sh
DRY_RUN=1 INSTALL_UPSTREAM=0 FETCH_EXAMPLES=0 bash install.sh
scripts/smoke-install.sh
scripts/smoke-uninstall.sh
```

## Adding Or Changing A Pattern

Each pattern must include:

- intent;
- use case;
- evidence required;
- prompt template;
- HTML structure;
- quality checklist;
- failure modes;
- tie-breakers;
- acceptance criteria;
- visual explainer contract.

If the pattern represents a common workflow, add or update an example in `examples/`.

## Adding Examples

Examples must include:

- primary intent;
- secondary intent coverage;
- base concept;
- HTML advantage;
- artifact budget;
- mental work removed;
- evidence;
- risk or uncertainty;
- next prompt or exportable output;
- system light/dark support.

Interactive examples must include copy/export output.

## What To Avoid

- Adding a new doc when an existing one can be improved.
- Adding a new command for a narrow case.
- Decorative HTML that does not improve a decision.
- Claims without evidence.
- Expanding the process without removing friction somewhere else.
