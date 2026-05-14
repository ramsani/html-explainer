# Contributing

Thanks for improving `html-explainer`.

The project should stay small and useful. Every change should strengthen this path:

```text
intent -> evidence -> visual understanding -> decision -> next action -> reusable memory
```

## Good Contributions

- Better pattern failure modes.
- Better examples.
- Clearer command behavior.
- Stronger validation scripts.
- Clearer user value and language-matching behavior.
- Safer install/uninstall behavior.
- Simpler docs that remove confusion.

## Before Opening a PR

Run:

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

These checks confirm required behavior. New artifacts and patterns should include the required user-facing parts before validation runs.

When adding a new principle or product promise, update `docs/ENGINEERING_TRANSLATION.md` with the concrete behavior, affected files, and confirmation check. If the promise affects generated HTML, add or update runtime validation.

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
- archive recommendation when the artifact may be reused;
- quiet memory access receipt;
- invisible quality gate pass;
- user-language output unless a different audience is requested;
- system light/dark support.

Interactive examples must include copy/export output.

## What To Avoid

- Adding a new doc when an existing one can be improved.
- Adding a new command for a narrow case.
- Decorative HTML that does not improve a decision.
- Claims without evidence.
- Expanding the process without removing friction somewhere else.
