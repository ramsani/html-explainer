# V1 Function Audit

This audit checks the repo function by function against two V1 rules:

1. Invert first: identify likely failure modes, then turn them into rules, checks, examples, or limits.
2. Keep the chain intact:

```text
intent -> evidence -> visual understanding -> decision -> next action -> reusable memory
```

If a function does not strengthen that chain, it should be removed, simplified, or deferred.

## Function Map

| Function | User promise | Failure under inversion | V1 defense |
|---|---|---|---|
| Pattern selection | Choose whether HTML is worth it and which artifact fits. | HTML becomes decoration or the wrong pattern is selected. | Decision Gate, Pattern Guide, scenario tests, no-HTML negative case. |
| Artifact generation | Produce the smallest useful HTML artifact. | Artifact looks polished but hides evidence, risk, or next action. | Quality Bar, semantic example validation, required evidence and next prompt. |
| Plan review | Decide whether a plan is safe before implementation. | Agent approves a plan without inspecting real constraints. | `/check-the-plan`, pattern 02, evidence sheet, missing-check visibility. |
| Diff review | Decide accept, revise, block, split, or verify. | Review sounds confident without tests or file-risk evidence. | `/check-the-diff`, pattern 03, before/after diff demo, validation markers. |
| Project re-entry | Help a user regain context and choose the next action. | Recap becomes a generic README summary. | `/reenter-project`, pattern 17, required repo evidence and next prompt. |
| Decision tool building | Build temporary editors, tuners, triage boards, or config tools. | Tool has controls but no exportable output. | `/build-decision-tool`, interactive budget rule, copy/export requirement. |
| Artifact audit | Decide whether an existing artifact is worth trusting. | Audit becomes taste feedback instead of decision-quality review. | `/audit-html`, Quality Bar scoring, hard fail conditions. |
| Thinking surface | Turn unclear thinking into conclusion and action. | Becomes theory-heavy brainstorming with no decision. | `/think-with-me-about`, Insight Surface Loop, inversion panel, archive recommendation. |
| Artifact memory | Preserve useful outputs without polluting the repo. | Stale or private artifacts become trusted public knowledge. | lifespan classes, freshness rules, privacy class, do-not-reuse class. |
| Pattern package system | Let the repo grow without turning into prompt sprawl. | New docs and patterns accumulate without a quality floor. | Pattern Package Protocol, Artifact Modes, Artifact Directions, Anti-Slop rules. |
| Installer | Install commands/docs/patterns safely. | Installer overwrites user memory or omits new commands. | dry-run, backup, managed block, smoke install, smoke uninstall. |
| Examples | Show the value before install and define quality shape. | Examples pass by existing but do not demonstrate decision value. | semantic validation, before/after demos, screenshot preview. |
| Scenarios | Verify routing behavior without an LLM. | Structural checks pass while behavior drifts. | `tests/scenarios/pattern-routing.json` and `scripts/validate-scenarios.sh`. |

## Gaps Found And Closed

| Gap | Risk | Closure |
|---|---|---|
| Core path ended at next prompt in key docs. | Memory looked optional instead of part of V1. | Updated README, Decision Gate, Quality Bar, Chain, Delivery, installer guide, and smoke test to include reusable memory. |
| Pattern Guide omitted pattern 22. | `/think-with-me-about` existed but was not routed by the main guide. | Added Insight Surface Loop to routing and tie-breakers. |
| Contribution checklist omitted scenario validation. | Future changes could bypass routing behavior tests. | Added `scripts/validate-scenarios.sh` to contribution verification. |
| V1 audit existed only as conversation. | Future agents could reopen the same questions without the failure analysis. | Added this file as the closeout record. |
| Examples did not all carry a memory decision. | Reusable memory could remain a slogan instead of a delivery behavior. | `scripts/validate-examples.sh` now requires an archive or memory decision, and all examples include one. |

## V1 Cut Line

V1 should not add new product surfaces after this point.

Allowed before V1 close:

- fix contradictions in existing docs;
- strengthen validators;
- repair examples that fail the chain;
- clarify installer or uninstall safety;
- document a real gap found by audit.

Not allowed before V1 close:

- new commands;
- new pattern categories;
- hosted service;
- database;
- background sync;
- connector/MCP implementation;
- broad redesign.

## Final V1 Gap Check

Before tagging or declaring V1 complete, run:

```bash
bash -n install.sh uninstall.sh scripts/*.sh
scripts/validate-patterns.sh
scripts/validate-commands.sh
scripts/validate-examples.sh
scripts/validate-scenarios.sh
DRY_RUN=1 INSTALL_UPSTREAM=0 FETCH_EXAMPLES=0 bash install.sh
scripts/smoke-install.sh
scripts/smoke-uninstall.sh
```

Then inspect:

- README claims match installed files;
- Pattern Guide covers all commands and patterns;
- examples pass semantic validation;
- every serious artifact has a next action and memory decision;
- no generated user history is committed to the repo.
