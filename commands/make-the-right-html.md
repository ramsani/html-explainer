# /make-the-right-html

Generate a self-contained HTML artifact using the HTML effectiveness operating model.

## Intent

Create an artifact that helps the user inspect, compare, verify, decide, or re-enter context better than Markdown.

## Mandatory process

1. Decide whether HTML is justified. If Markdown is clearer, say so and do not generate HTML.
2. Open `docs/INTENT_DISTILLATION.md` and define primary intent, obvious secondary intents, base concept, and fastest path to value.
3. Use `docs/pattern-router.md` to select one primary pattern.
4. Open the matching file in `patterns/` and apply its evidence requirements, prompt template, HTML structure, quality checklist, failure modes, and acceptance criteria.
5. Open `docs/HTML_UX_STANDARD.md` and define the artifact's UX contract.
6. Inspect real sources before generation.
7. Build a fact sheet using `docs/fact-sheet-protocol.md`.
8. Separate facts, inferences, unsupported claims, and unknowns.
9. Generate the smallest useful HTML artifact.
10. Apply `docs/QUALITY_BAR.md` before finalizing.
11. Include uncertainty visibly.
12. Save the artifact to a reasonable local path when tool access allows it.

## Required artifact sections

- Intent
- Intent distillation
- Selected pattern
- UX contract
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
- First screen shows decision, evidence, recommendation, risk, and next action.
- First screen answers the primary intent directly.
- Obvious secondary intents are covered only when they support the primary intent.
- Use the visual form required by the selected pattern.
- Tables, diagrams, cards, timelines, or controls only when they clarify.
- No external network dependency unless explicitly requested.
- Accessible enough: readable contrast, semantic headings, keyboard-friendly controls if interactive.
- Interactive artifacts must include copy/export output.
- Responsive layout must remain coherent on mobile.

## Final self-check

Before responding, verify:

- Did the artifact use the right pattern?
- Did it answer the primary intent directly?
- Did it cover obvious secondary intents without bloating the artifact?
- Did it distill the base concept into a simple visible model?
- Did the first screen make the supported decision obvious?
- Did it inspect evidence?
- Did it separate facts from inference?
- Did it make uncertainty visible?
- Did it improve decision quality over Markdown?
- Did every interaction create useful state or exportable output?
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
