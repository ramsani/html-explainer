# Goal Workflows

Use `/goal` when the work is too long for one turn and has a clear finish line.

Do not use it for short answers, one-command help, tiny facts, or low-risk notes.

## How To Write A Useful Goal

A good goal has:

- a measurable end state;
- the verification commands Claude must run;
- constraints that should not be broken;
- a stop condition if the work cannot finish.

The evaluator only sees what Claude reports in the conversation. Claude must show the checks it ran and the result.

## V1 Closeout

```text
/goal html-explainer V1 is complete when bash -n install.sh uninstall.sh scripts/*.sh passes, validate-patterns, validate-commands, validate-examples, validate-golden-artifacts, validate-scenarios, smoke-install, smoke-uninstall, and smoke-artifact-memory all pass, README/CI/CONTRIBUTING list the same required checks, and git status shows no generated junk.
```

## Artifact Delivery

```text
/goal the HTML artifact is delivered only when deliver-artifact.py approves it at 90+, the artifact path exists, the final response includes the open path, and any save/private/refresh/supersede/discard decision is stated.
```

## Artifact Memory

```text
/goal artifact memory is working when audit-artifact.py approves the fixture, deliver-artifact.py --save creates outputs/index.json, outputs/index.html, artifacts, metadata, and annotations, rebuild-knowledge-base.py runs successfully, and smoke-artifact-memory.sh passes.
```

## Repo Audit

```text
/goal the repo audit is complete when every obvious gap found is either fixed or documented honestly, no new commands/patterns/runtime systems were added, all verification scripts pass, and git status contains only intentional changes.
```

## PR Or Diff Review

```text
/goal the PR is ready when each finding has an accept/fix/block decision, required tests or explicit missing-test risks are shown, the final recommendation is clear, and git status has no generated junk.
```

## Issues And PR Queue

```text
/goal the GitHub queue is done when every open issue and PR has a merge/close/skip decision with evidence, merged changes pass the repo verification set, and no pending item remains untriaged.
```

## When To Stop Early

Stop and return control to the user if:

- the goal depends on credentials or permissions Claude does not have;
- the verification command is unavailable;
- the requested result would require adding a new system the user did not approve;
- three attempts fail for the same reason.
