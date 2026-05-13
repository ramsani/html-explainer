# Quality Claims

This document separates what the repo is designed to prevent from what it does not yet statistically guarantee.

## Designed To Prevent

`html-explainer` is designed to prevent three common agent failures:

1. sounding clear without inspected evidence;
2. creating visual output that does not improve the decision;
3. ending without a useful next step.

It does this through:

- Decision Gate: rejects HTML when Markdown is enough.
- Pattern Guide: routes the work to one primary artifact type.
- Fact Sheet: separates facts, inferences, assumptions, and unknowns.
- Quality Bar: blocks unsupported claims, decorative HTML, missing next action, and weak memory decisions.
- Scenario validation: checks common routing cases and negative no-HTML cases.
- Example validation: blocks examples that lack intent, evidence, language, risk, next prompt, or memory decision.
- Smoke tests: verify install and uninstall behavior.

## What We Can Claim Now

- The repo has a documented process for deciding when HTML is worth it.
- The repo has command, pattern, example, and scenario validation.
- The repo requires serious artifacts to expose intent, evidence, uncertainty, risk, recommendation, next action, and memory guidance.
- The repo rejects common shallow examples through local validation.
- The installed generation path has a local delivery command that blocks artifacts below the configured score.
- The repo can save approved artifacts into a local file-based memory index.
- The repo keeps generated user artifact history outside the repository.
- The repo is documented in English and instructs agents to answer in the user's language.

## What We Do Not Claim Yet

- No statistical success rate such as 95%.
- No guarantee that every agent will follow the installed command path if it bypasses the repo instructions.
- No guarantee that every generated artifact is useful without judgment for the user's real situation.
- No hosted service, database, background sync, or automatic memory indexer.

## Path To Stronger Claims

Stronger claims require repeated real use and recorded failure cases.

Before claiming a high success rate, the repo should collect:

- real prompts across each command;
- pass/fail outcomes against the Quality Bar;
- examples where Markdown was correctly chosen instead of HTML;
- examples where generated artifacts were refreshed, superseded, or discarded;
- cases where a future agent successfully re-entered from artifact memory.

Until then, the correct claim is:

```text
html-explainer is engineered to reduce common agent failures by forcing evidence, decision value, next action, and reusable memory into the artifact process.
```
