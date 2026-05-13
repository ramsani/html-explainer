# V1 Function Audit

This audit checks the repo function by function against two V1 rules:

1. Invert first: identify likely failure modes, internal weaknesses, and environmental threats, then turn them into rules, checks, examples, limits, or user-facing advantages.
2. Keep the chain intact:

```text
intent -> evidence -> visual understanding -> decision -> next action -> reusable memory
```

If a function does not strengthen that chain, it should be removed, simplified, or deferred.

## V1 Judgment

V1 is not judged by whether the idea sounds strong. It is judged by whether each user-facing function has been stress-tested against predictable failure and redesigned so the protection becomes part of the product.

The repo now treats quality as required artifact behavior:

- route before generating;
- inspect evidence before claiming;
- use HTML only when it reduces user work;
- show risk and uncertainty;
- recommend a next action;
- preserve useful work without creating stale noise;
- keep the interface human, optional, and minimal.
- confirm required parts before delivery without exposing internal checks.

## Function Map

| Function | User promise | What can go wrong | V1 guardrail |
|---|---|---|---|
| Pattern selection | Choose whether HTML is worth it and which artifact fits. | HTML becomes decoration or the wrong pattern is selected. | Decision Gate, Pattern Guide, scenario tests, no-HTML negative case. |
| Artifact generation | Produce the smallest useful HTML artifact. | Artifact looks polished but hides evidence, risk, or next action. | Quality Bar, semantic example validation, required evidence and next prompt. |
| Language matching | Respond and generate artifacts in the user's language while documenting the repo in English. | User feels the system is for developers, not for them. | Language Policy, command checks, README promise. |
| User-facing copy | Make the artifact feel clear and helpful instead of procedural. | User sees internal labels and feels friction. | User-Facing Copy guide, Style rule, example validation against internal labels. |
| Human interface | Invite action without pressure and preserve user freedom. | Artifact pushes one path or feels like machinery. | Human Interface guide, every pattern contract, Quality Bar hard fails. |
| Plan review | Decide whether a plan is safe before implementation. | Agent approves a plan without inspecting real constraints. | `/check-the-plan`, pattern 02, evidence sheet, missing-check visibility. |
| Diff review | Decide accept, revise, block, split, or verify. | Review sounds confident without tests or file-risk evidence. | `/check-the-diff`, pattern 03, before/after diff demo, validation markers. |
| Project re-entry | Help a user regain context and choose the next action. | Recap becomes a generic README summary. | `/reenter-project`, pattern 17, required repo evidence and next prompt. |
| Decision tool building | Build temporary editors, tuners, triage boards, or config tools. | Tool has controls but no exportable output. | `/build-decision-tool`, interactive budget rule, copy/export requirement. |
| Artifact audit | Decide whether an existing artifact is worth trusting. | Audit becomes taste feedback instead of decision-quality review. | `/audit-html`, Quality Bar scoring, hard fail conditions. |
| Invisible quality gate | Confirm artifacts contain required parts before they are trusted. | Quality becomes a manual opinion instead of repeatable behavior. | `scripts/audit-artifact.py`, good/bad fixtures, golden artifact validation. |
| Thinking surface | Turn unclear thinking into conclusion and action. | Becomes theory-heavy brainstorming with no decision. | `/think-with-me-about`, Insight Surface Loop, stress-test panel, archive recommendation. |
| Artifact memory | Preserve useful outputs without polluting the repo. | Stale or private artifacts become trusted public knowledge. | lifespan classes, freshness rules, privacy class, do-not-reuse class. |
| Memory access | Show the user how to find saved work again without showing archive mechanics. | Saved work feels invisible or memory guidance becomes bulky. | Memory Access guide, example receipts, command validation. |
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
| Visible copy exposed internal process labels. | User would see the workshop instead of the value. | Added `USER_FACING_COPY.md`, updated examples, and blocked internal visible headings. |
| Saved work did not clearly tell the user how to find it later. | Knowledge base value would be hidden or intrusive. | Added `MEMORY_ACCESS.md`, tiny saved/not-saved receipts, and validation. |
| Pattern files did not all declare user agency. | Some artifacts could recommend action without preserving user freedom. | Added `HUMAN_INTERFACE.md`, required a Human Interface Contract in all 22 patterns, and added command validation. |
| README under-presented the human value. | A visitor could see mechanics before feeling the product promise. | Added "What It Feels Like", control/freedom benefits, and quiet invitation language. |
| Quality Bar had no executable artifact gate. | A weak HTML could look valid because only strings and files were checked. | Added `scripts/audit-artifact.py`, good/bad fixtures, and `scripts/validate-golden-artifacts.sh`. |

## Function-By-Function V1 Verdict

| Function | V1 status | Reason |
|---|---|---|
| Pattern selection | Green | HTML is rejected when Markdown is enough, and routing scenarios protect the decision. |
| Artifact generation | Green | Quality Bar, Style, User-Facing Copy, Human Interface, and examples constrain output shape. |
| Plan review | Green | Requires repo evidence, risk, decision, next prompt, and memory guidance. |
| Diff review | Green | Requires changed-file evidence, validation gaps, severity, and accept/revise/block path. |
| Project re-entry | Green | Uses real repo sources and ends with next high-value action. |
| Decision tools | Green | Interactive budget is allowed only when controls change state or export useful output. |
| Artifact audit | Green | Audits artifacts against decision value, evidence, interface, memory, and hard fails. |
| Invisible quality gate | Green | Local fixtures prove the gate accepts complete artifacts and rejects weak ones. |
| Thinking surface | Green | Invited only when the user is still forming the question or needs deeper reasoning. |
| Artifact memory | Green | Defines lifespan, freshness, privacy, supersession, and do-not-reuse rules. |
| Memory access | Green | Shows a tiny receipt without making the user learn archive mechanics. |
| Language policy | Green | Repo stays English; user-facing output matches the user or intended audience. |
| Human interface | Green | All patterns must preserve optionality and useful control. |
| Installer/uninstaller | Green | Dry-run, backup, managed block, smoke install, and smoke uninstall are validated. |
| Examples/scenarios | Green | Examples and routing scenarios now enforce the product behavior floor. |

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
scripts/validate-golden-artifacts.sh
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

## Final V1 Decision

No remaining V1 gap justifies adding a new command, pattern category, service, database, or automation before release.

The V1 close line is:

```text
The repo is ready for V1 when the final gap check passes on a clean worktree.
```
