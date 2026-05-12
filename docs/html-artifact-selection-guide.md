# HTML Artifact Selection Guide

Use this guide before generating an HTML artifact.

## First question

What decision should the artifact help the user make?

If there is no decision, no comparison, no review burden, no spatial structure, and no interactive value, use Markdown instead.

## Selection matrix

| User need | Best artifact | Command |
|---|---|---|
| Choose between implementation options | Code approach comparison | `/make-the-right-html` |
| Validate a plan before coding | Plan review | `/check-the-plan` |
| Review code after changes | Diff review | `/check-the-diff` |
| Understand a repo/module | Project recap or module map | `/reenter-project` |
| Understand service/workflow behavior | Architecture/process diagram | `/make-the-right-html` |
| Evaluate UI consistency | Design token/contact sheet | `/make-the-right-html` |
| Test a UX idea before coding | Interactive prototype | `/make-the-right-html` |
| Communicate a technical decision | HTML deck | `/make-the-right-html` |
| Diagnose failure | Incident/postmortem report | `/make-the-right-html` |
| Prioritize many tasks/issues | Custom triage editor | `/build-decision-tool` |
| Tune prompts/agents | Prompt tuner editor | `/build-decision-tool` |

## Complexity rule

Choose the simplest artifact that makes the hidden structure visible.

Bad: large dashboard for a small decision.
Good: one comparison table plus one diagram plus risk list.

## Evidence rule

The artifact must show what was inspected.

Examples:

- files read
- commands run
- diffs reviewed
- docs inspected
- user-provided requirements
- inferred assumptions
- unknowns

## Pattern composition rule

Use one primary pattern and at most two supporting sections.

Example:

- Primary: plan review
- Supporting: architecture diagram + risk matrix

Do not combine all patterns into one bloated HTML file.

## Stop conditions

Do not generate HTML if:

- the answer is obvious and short
- no evidence was inspected
- the user asked for a direct command
- the artifact would only reformat text
- the model cannot verify the key claims

## Minimal artifact contract

Every artifact must answer:

1. What is this for?
2. What evidence was used?
3. What is the current state?
4. What are the options or changes?
5. What could go wrong?
6. What should the user do next?
7. What remains uncertain?
