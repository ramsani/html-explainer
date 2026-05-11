# Thariq HTML Effectiveness

Use this skill when a task would be easier to inspect, compare, verify, decide, or re-enter as an HTML artifact instead of a Markdown answer.

This skill extends visual-explainer with a pattern library based on the 20 HTML effectiveness cases. The intent is not decoration. The intent is cognition: make structure visible.

## Mandatory operating model

Never generate the HTML first.

Always follow:

1. Explore sources.
2. Verify facts.
3. Build a fact sheet.
4. Select the right artifact pattern.
5. Generate the HTML.
6. Mark uncertainty.
7. Give the user a minimal decision summary.

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

## Required HTML sections

Every serious artifact should include:

- Intent
- What was inspected
- Fact sheet
- Current state
- Proposed or changed state
- Visual structure: diagram, map, comparison, timeline, table, or interaction
- Risks
- Assumptions
- Unknowns
- Decision or recommendation
- Success criteria

## Pattern selection

Choose one primary pattern:

1. Code approach comparison
2. Visual implementation plan
3. Annotated PR / diff review
4. Module map
5. Design system contact sheet
6. Interactive flow prototype
7. System diagram
8. HTML deck
9. Research explainer
10. Report / incident / status
11. Custom editor

If multiple patterns apply, choose the one that best helps the user decide. Add secondary sections only when necessary.

## Failure modes to avoid

- Beautiful but unverifiable output
- Generic dashboards with no decision value
- Repeating Markdown inside HTML
- Explaining without evidence
- Inventing files, modules, behavior, tests, routes, or dependencies
- Hiding uncertainty
- Using charts or diagrams that do not clarify the decision
- Creating an interactive editor without exportable output

## Minimal response after generating HTML

After generating an HTML artifact, respond briefly:

- artifact path
- primary pattern used
- what decision it supports
- major uncertainty if any

Do not rewrite the entire artifact in chat.
