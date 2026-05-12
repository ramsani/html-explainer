# Thariq HTML Effectiveness

Use this skill when a task would be easier to inspect, compare, verify, decide, or re-enter as an HTML artifact instead of a Markdown answer.

This skill extends visual-explainer with a pattern library based on the 20 HTML effectiveness cases. The intent is not decoration. The intent is cognition: make structure visible.

## Mandatory operating model

Never generate the HTML first.

Always follow:

1. Decide whether HTML is justified. If Markdown is clearer, do not use HTML.
2. Use `docs/pattern-router.md` to choose one primary pattern.
3. Open the matching file in `patterns/` and apply its evidence requirements, HTML structure, quality checklist, failure modes, and acceptance criteria.
4. Open `docs/HTML_UX_STANDARD.md` and define the first-screen contract, interaction contract, and export requirement.
5. Explore sources.
6. Verify facts.
7. Build a fact sheet using `docs/fact-sheet-protocol.md`.
8. Generate the smallest useful HTML artifact.
9. Apply `docs/QUALITY_BAR.md` before finalizing.
10. Mark uncertainty visibly.
11. Give the user a minimal decision summary.

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
5. Design token contact sheet
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

Do not rely only on the general list. Select and apply the specific pattern file.

## Required HTML sections

Every serious artifact should include:

- Intent
- Selected pattern
- UX contract: audience, decision, primary action, export when relevant
- What was inspected
- Fact sheet
- Current state
- Proposed or changed state when applicable
- Visual structure: diagram, map, comparison, timeline, table, prototype, or editor
- Risks
- Assumptions
- Unknowns
- Decision or recommendation
- Success criteria
- Next action

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
```

If the contract is weak, do not compensate with styling. Revise the artifact shape.

## Failure modes to avoid

- Beautiful but unverifiable output
- Generic dashboards with no decision value
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
- what decision it supports
- quality-bar result
- major uncertainty if any

Do not rewrite the entire artifact in chat.
