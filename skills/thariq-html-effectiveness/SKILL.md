# Thariq HTML Effectiveness

Use this skill when a task would be easier to inspect, compare, verify, decide, or re-enter as an HTML artifact instead of a Markdown answer.

This skill extends visual-explainer with a pattern library based on the 20 HTML effectiveness cases. The intent is not decoration. The intent is cognition: make structure visible.

## Mandatory operating model

Never generate the HTML first.

Always follow:

1. Decide whether HTML is justified. If Markdown is clearer, do not use HTML.
2. Open `docs/INTENT_DISTILLATION.md` and identify primary intent, obvious secondary intents, base concept, and fastest path to value.
3. Open `docs/CONTEXT_PACKS.md` and select the smallest context pack that can support the decision.
4. Open `docs/EXPLAINER_CLARITY.md` and define the reader contract in plain language.
5. Open `docs/VISUAL_EXPLAINER_PLAYBOOK.md` and select the primary visual model for the chosen pattern.
6. Open `docs/HTML_ADVANTAGE_GATE.md` and identify why HTML beats Markdown point by point.
7. Open `docs/ARTIFACT_BUDGET.md` and choose compact, standard, or interactive. Default to compact.
8. Use `docs/pattern-router.md` to choose one primary pattern.
9. Open the matching file in `patterns/` and apply its evidence requirements, HTML structure, visual explainer contract, quality checklist, failure modes, and acceptance criteria.
10. Open `docs/HTML_UX_STANDARD.md` and define the first-screen contract, interaction contract, and export requirement.
11. Explore sources.
12. Verify facts.
13. Build a fact sheet using `docs/fact-sheet-protocol.md`.
14. Generate the smallest useful HTML artifact.
15. Apply `docs/QUALITY_BAR.md` before finalizing.
16. Compare against `docs/GOLDEN_OUTPUTS.md` when the artifact matches a golden case.
17. Mark uncertainty visibly.
18. Apply `docs/HTML_ARTIFACT_CHAINS.md` when the work is better handled as exploration -> plan -> review or similar.
19. Apply `docs/SHARE_AND_REENTRY.md` when the artifact should be shareable or useful to another agent.
20. Apply `docs/NEXT_ACTION_HANDOFF.md` so the next command is obvious and copy-ready.
21. Give the user a minimal decision summary.

## When to use

Use for:

- architecture maps
- implementation plans
- plan review
- diff review
- pull request review
- repo recap
- module exploration
- design system inspection
- visual direction exploration
- empty-state exploration
- artifact chains for exploration, planning, review, and handoff
- interactive prototypes
- diagrams and flows
- decks
- research explainers
- incident reports
- status reports
- ticket triage
- custom editors
- prompt tuning interfaces

Do not use for:

- simple answers
- tiny bug fixes
- one-command replies
- questions that fit clearly in 10 lines
- cases where HTML would only make the response look more impressive

## Core rule

HTML is a review surface, not a substitute for analysis.

If a statement in the HTML is not supported by read source, command output, repo evidence, user-provided content, or explicit inference, label it as uncertain.

## Pattern files

The skill includes 20 operational pattern files under `patterns/`:

1. Code approach comparison
2. Visual implementation plan
3. Annotated PR / diff review
4. Module map
5. Design token reference sheet
6. Component state matrix
7. Interactive flow prototype
8. Microinteraction sandbox
9. Architecture diagram
10. Process / workflow flowchart
11. Technical decision deck
12. Project progress deck
13. Concept explainer
14. Research comparison map
15. Incident / postmortem report
16. Audit report
17. Project recap
18. Ticket triage board
19. Feature flag / config editor
20. Prompt / agent behavior tuner
21. Visual direction explorer

Do not rely only on the general list. Select and apply the specific pattern file.

## Required HTML sections

Every serious artifact should include:

- Intent
- Intent distillation: primary intent, obvious secondary intents, base concept
- HTML advantage: why browser output beats Markdown
- Artifact budget: compact, standard, or interactive
- Selected pattern
- UX contract: audience, decision, primary action, export when relevant
- What was inspected
- Fact sheet
- Reader contract
- Primary visual model
- Artifact chain position when useful
- Share-ready summary when useful
- Agent reentry block when useful
- Current state
- Proposed or changed state when applicable
- Visual structure: diagram, map, comparison, timeline, table, prototype, or editor
- Risks
- Assumptions
- Unknowns
- Decision or recommendation
- Success criteria
- Next action handoff

## UX contract

Before generating HTML, write this contract internally and make the relevant parts visible in the artifact:

```text
Audience:
Decision supported:
First-screen answer:
Primary action:
Visual form:
Interaction, if any:
Exportable output, if any:
Mobile requirement:
States required:
Next action handoff:
```

If the contract is weak, do not compensate with styling. Revise the artifact shape.

## Intent discipline

Before generating HTML, the artifact must pass this check:

```text
Primary intent answered directly:
Obvious secondary intents covered:
Base concept distilled:
Fastest path to value visible:
Surprising ease opportunity:
Wall of text replaced:
Mental work removed:
Not doing:
```

The primary intent must dominate the first screen. Secondary intents support it; they do not compete with it.

## Explanation discipline

Every artifact must feel like an explanation, not an inventory.

Apply `docs/EXPLAINER_CLARITY.md`:

- define who is reading;
- state what they came to do;
- make the first 30 seconds decisive;
- use plain action language;
- include a visual model that explains the core concept;
- offer the next options the user is most likely to need.

The base concept should be simple enough to explain in one sentence. If it takes a paragraph, distill again.

## Budget discipline

Before generating HTML, the artifact must pass this check:

```text
HTML advantage:
Artifact budget:
Why this budget:
Markdown cost:
HTML benefit:
Mental work removed:
Token/complexity guard:
```

Default to `compact`. Upgrade to `standard` only when evidence, risk, or structure need it. Upgrade to `interactive` only when controls change a decision or produce exportable output.

## HTML advantage discipline

HTML must beat Markdown in at least one of four ways:

```text
Interaction removes manual work:
Structure becomes visible:
Concrete output produced:
First screen decides in 5 seconds:
```

If all four are weak, do not generate HTML.

## Failure modes to avoid

- Beautiful but unverifiable output
- Generic dashboards with no decision value
- Spending more tokens and attention than the artifact saves
- Failing to name why HTML is better than Markdown
- Choosing interactive when compact would answer the intent
- Choosing standard when compact would answer the intent
- Answering adjacent needs while missing the user's main intent
- Treating secondary intents as feature creep instead of decision support
- Hiding the base concept under many sections
- Repeating Markdown inside HTML
- Explaining without evidence
- Hiding the recommendation below decoration
- Interactive controls that do not change a meaningful decision
- Editors without exportable output
- Mobile layouts that force horizontal reading except for intentional wide tables
- Inventing files, modules, behavior, tests, routes, or dependencies
- Hiding uncertainty
- Using charts or diagrams that do not clarify the decision
- Creating an interactive editor without exportable output
- Combining too many patterns into a bloated artifact

## Minimal response after generating HTML

After generating an HTML artifact, respond briefly:

- artifact path
- primary pattern used
- artifact budget used
- what decision it supports
- quality-bar result
- major uncertainty if any

Do not rewrite the entire artifact in chat.
