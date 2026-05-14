# Goal Workflows

Use `/goal` when the work is too long for one turn and has a clear finish line.

Do not use it for short answers, one-command help, tiny facts, or low-risk notes.

## Architecture Role

`/goal` is the intelligent closeout layer.

It replaces:

- repeated "continue" prompts from the user;
- long manual checklists inside a conversation;
- vague reminders to "make sure it is done";
- semantic judgment that depends on a fresh reading of the conversation.

It does not replace:

- CI checks that must run without Claude Code;
- installer and uninstaller smoke tests;
- file existence checks;
- deterministic artifact memory checks;
- cheap structural gates that block obviously weak artifacts.

The simple architecture is:

```text
deterministic scripts = cheap floor
/goal = intelligent finish line
human = final product judgment when stakes are high
```

Do not add new hooks, servers, databases, MCPs, or extra commands just to use `/goal`.

## How To Write A Useful Goal

A good goal has:

- a measurable end state;
- the verification commands Claude must run;
- constraints that should not be broken;
- a stop condition if the work cannot finish.

The evaluator only sees what Claude reports in the conversation. Claude must show the checks it ran and the result.

## What To Remove From Future Work

When `/goal` is available, avoid adding new docs or scripts that only say:

- keep going until done;
- remember to run the checks;
- judge whether the output is good;
- repeat this review after every turn.

Write a concrete `/goal` condition instead.

Keep a script only when it can verify something without model judgment.

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
