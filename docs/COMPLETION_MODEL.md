# Completion Model

html-explainer does not treat work as complete when a file exists.

Work is complete only when its completion condition is satisfied.

```text
Scripts prove that the system is structurally safe.
Goals prove that the work is actually done.
```

## Layers

```text
commands/  = modes of work
patterns/  = artifact shapes
docs/      = policies and criteria
scripts/   = deterministic minimum checks
goals/     = intelligent completion contracts
tests/     = fixtures and scenarios
```

## Use Scripts For

- shell syntax;
- install and uninstall safety;
- required file presence;
- command shape;
- pattern shape;
- basic HTML structure;
- viewport and dark mode;
- local output paths;
- index and metadata creation;
- smoke tests that must run in CI.

Scripts should be cheap, deterministic, and runnable without Claude Code.

## Use Goals For

- artifact usefulness;
- decision readiness;
- evidence sufficiency;
- whether HTML beats Markdown;
- user friction reduction;
- memory value;
- documentation coherence;
- whether a PR or issue is truly done.

Goals should judge the result a capable human would care about.

## Boundary

Do not make regex pretend to be product judgment.

Use regex and scripts to block obvious structural failure. Use `/goal` to keep Claude working until quality is demonstrated in the conversation and output.

## Default Flow

```text
1. User invokes a command.
2. Command selects a pattern and goal contract.
3. Agent inspects evidence.
4. Agent generates or reviews the artifact.
5. Scripts verify structural safety.
6. /goal evaluates professional completion.
7. Claude keeps correcting until the goal is satisfied.
8. Final response reports evidence, path, and next action.
```

## Stop Rule

If a goal cannot be satisfied after three attempts, stop and report:

- what failed;
- what evidence was missing;
- what is safe to trust;
- what the user must decide next.
