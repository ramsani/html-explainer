# Goal Workflows

Use `/goal` when the work is too long for one turn and has a clear finish line.

Do not use it for short answers, one-command help, tiny facts, or low-risk notes.

Goal contracts and the `/goal` loop are different:

- goal contracts live in `goals/` and define what done means;
- `/goal` is the Claude Code loop that keeps working, and it runs only when invoked explicitly.

## Architecture Role

`/goal` is the autonomous closeout layer.

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
goal contracts = reusable finish line
/goal = autonomous quality loop when explicitly invoked
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

## Goal As Quality Evaluator

The strongest use of `/goal` is not "keep working." It is "keep improving until the result is truly useful."

Write goals that judge the user outcome:

- Can the user understand the point in the first screen?
- Can the user see what evidence supports the recommendation?
- Can the user tell what is fact, inference, assumption, and unknown?
- Can the user make a decision or choose a next action without asking for a second explanation?
- Can the user find or reuse the artifact later without learning the internal machinery?

Avoid goals that only judge labels:

```text
Weak: /goal the artifact mentions intent, evidence, risk, and next action.
Strong: /goal the artifact is ready when a user can open it and immediately see what decision it supports, what evidence was inspected, the main risk, the recommended next move, and how to reuse or discard it later.
```

This lets `/goal` replace fragile semantic checklists where the real question is usefulness, clarity, and decision value.

## Quality Goals

### Decision-Ready Artifact

```text
/goal the artifact is decision-ready when the first screen lets a user understand the decision, evidence basis, main risk, recommendation, next action, and memory choice without reading internal process labels; deliver-artifact.py approves it at 90+; and the final response includes the file path and one useful next command.
```

### Human Interface Quality

```text
/goal the artifact feels simple and powerful when the visible copy is plain, non-technical, respectful, and in the user's language; every button or interaction changes state or exports useful output; the user has at least one graceful alternative to the recommended path; and no internal engineering philosophy is exposed.
```

### Knowledge Base Value

```text
/goal the saved artifact adds real memory value when it has clear title, intent, summary, tags or topics, freshness risk, privacy class, next action, find-it-fast text, metadata, annotation sidecar, and appears in the regenerated knowledge base with a useful re-entry prompt.
```

### Anti-Slop Artifact Review

```text
/goal the artifact is not slop when it cannot be reduced to the same information in simpler Markdown without losing comparison, inspection, interaction, decision support, or reusable memory; if Markdown is enough, stop and return the simpler answer.
```

### README Product Clarity

```text
/goal the README is ready when a new user can understand in under two minutes what html-explainer installs, when to use it, what command to try first, what good output looks like, how local memory works, how to verify locally, and how to uninstall.
```

## Goal Contract Files

Reusable goal contracts live in `goals/`.

Use them as copy/paste finish lines:

- `goals/artifact-ready.goal.md`
- `goals/plan-review-complete.goal.md`
- `goals/diff-review-complete.goal.md`
- `goals/memory-ready.goal.md`
- `goals/docs-coherent.goal.md`
- `goals/repo-v1-complete.goal.md`
- `goals/pattern-package-complete.goal.md`

The command file explains how to work. The goal file explains when to stop.

Keep that split strict. Do not copy the goal's full checklist into command files. Commands should stay short enough for the agent to act quickly; goals should carry the deeper quality judgment.

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
/goal html-explainer V1 is complete when bash -n install.sh uninstall.sh scripts/*.sh passes, validate-patterns, validate-commands, validate-examples, validate-goals, validate-golden-artifacts, validate-scenarios, smoke-install, smoke-uninstall, and smoke-artifact-memory all pass, README/CI/CONTRIBUTING list the same required checks, and git status shows no generated junk.
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
