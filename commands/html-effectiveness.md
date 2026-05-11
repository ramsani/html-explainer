# /html-effectiveness

Generate a self-contained HTML artifact using the HTML effectiveness operating model.

## Intent

Create an artifact that helps the user inspect, compare, verify, decide, or re-enter context better than Markdown.

## Mandatory process

1. Decide whether HTML is justified. If Markdown is clearer, say so and do not generate HTML.
2. Use `docs/pattern-router.md` to select one primary pattern.
3. Open the matching file in `patterns/` and apply its evidence requirements, prompt template, HTML structure, quality checklist, failure modes, and acceptance criteria.
4. Inspect real sources before generation.
5. Build a fact sheet using `docs/fact-sheet-protocol.md`.
6. Separate facts, inferences, unsupported claims, and unknowns.
7. Generate the smallest useful HTML artifact.
8. Apply `docs/QUALITY_BAR.md` before finalizing.
9. Include uncertainty visibly.
10. Save the artifact to a reasonable local path when tool access allows it.

## Required artifact sections

- Intent
- Selected pattern
- Evidence inspected
- Fact sheet
- Current state
- Visual model, comparison, map, timeline, table, prototype, or editor
- Risks
- Assumptions
- Unknowns
- Recommendation
- Success criteria
- Next action

## HTML requirements

- Single self-contained HTML file.
- Inline CSS and JS unless local project rules require otherwise.
- Clear navigation.
- Use the visual form required by the selected pattern.
- Tables, diagrams, cards, timelines, or controls only when they clarify.
- No external network dependency unless explicitly requested.
- Accessible enough: readable contrast, semantic headings, keyboard-friendly controls if interactive.
- Interactive artifacts must include copy/export output.

## Final self-check

Before responding, verify:

- Did the artifact use the right pattern?
- Did it inspect evidence?
- Did it separate facts from inference?
- Did it make uncertainty visible?
- Did it improve decision quality over Markdown?
- Did it stay as small as possible?

## Final chat response

Keep it short:

```text
Created: <path>
Pattern used: <pattern>
Decision supported: <decision>
Quality-bar result: <pass / needs revision>
Main uncertainty: <uncertainty or none>
```

Do not paste the full HTML into chat unless requested.
