# /html-effectiveness

Generate a self-contained HTML artifact using the HTML effectiveness operating model.

## Intent

Create an artifact that helps the user inspect, compare, verify, decide, or re-enter context better than Markdown.

## Mandatory process

1. Decide whether HTML is justified.
2. Select one primary pattern from the 20-case library.
3. Inspect real sources before generation.
4. Build a fact sheet.
5. Separate facts, inferences, and unknowns.
6. Generate the smallest useful HTML artifact.
7. Include uncertainty visibly.
8. Save the artifact to a reasonable local path when tool access allows it.

## Required artifact sections

- Intent
- Evidence inspected
- Fact sheet
- Current state
- Visual model or interaction
- Risks
- Assumptions
- Unknowns
- Recommendation
- Success criteria

## HTML requirements

- Single self-contained HTML file.
- Inline CSS and JS unless local project rules require otherwise.
- Clear navigation.
- Tables, diagrams, cards, timelines, or controls only when they clarify.
- No external network dependency unless explicitly requested.
- Accessible enough: readable contrast, semantic headings, keyboard-friendly controls if interactive.

## Final chat response

Keep it short:

```text
Created: <path>
Pattern used: <pattern>
Decision supported: <decision>
Main uncertainty: <uncertainty or none>
```

Do not paste the full HTML into chat unless requested.
