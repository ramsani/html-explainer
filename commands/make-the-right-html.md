# /make-the-right-html

Generate a self-contained HTML artifact using the HTML effectiveness operating model.

## Intent

Create an artifact that helps the user inspect, compare, verify, decide, or re-enter context better than Markdown.

## Mandatory process

1. Decide whether HTML is justified. If Markdown is clearer, say so and do not generate HTML.
2. Open `docs/INTENT_DISTILLATION.md` and define primary intent, obvious secondary intents, base concept, and fastest path to value.
3. Open `docs/CONTEXT_PACKS.md` and choose the smallest context pack that can support the decision.
4. Open `docs/EXPLAINER_CLARITY.md` and define the reader contract.
5. Open `docs/HTML_ADVANTAGE_GATE.md` and prove HTML beats Markdown for this task.
6. Open `docs/ARTIFACT_BUDGET.md` and choose compact, standard, or interactive.
7. Use `docs/pattern-router.md` to select one primary pattern.
8. Open the matching file in `patterns/` and apply its evidence requirements, prompt template, HTML structure, quality checklist, failure modes, and acceptance criteria.
9. Open `docs/HTML_UX_STANDARD.md` and define the artifact's UX contract.
10. Inspect real sources before generation.
11. Build a fact sheet using `docs/fact-sheet-protocol.md`.
12. Separate facts, inferences, unsupported claims, and unknowns.
13. Generate the smallest useful HTML artifact.
14. Apply `docs/QUALITY_BAR.md` before finalizing.
15. Compare against `docs/GOLDEN_OUTPUTS.md` when the artifact is a PR review, visual exploration, or project reentry.
16. Include uncertainty visibly.
17. Apply `docs/HTML_ARTIFACT_CHAINS.md` when the work naturally needs exploration, planning, review, or handoff across multiple artifacts.
18. Apply `docs/SHARE_AND_REENTRY.md` when the artifact may be shared or used by another agent later.
19. Apply `docs/NEXT_ACTION_HANDOFF.md` so the artifact ends with a copy-ready next step.
20. Save the artifact to a reasonable local path when tool access allows it.

## Required artifact sections

- Intent
- Intent distillation
- HTML advantage
- Artifact budget and cost justification
- Selected pattern
- Reader contract
- UX contract
- Evidence inspected
- Fact sheet
- Current state
- Visual model, comparison, map, timeline, table, prototype, or editor
- Risks
- Assumptions
- Unknowns
- Share-ready summary when useful
- Agent reentry block when useful
- Recommendation
- Success criteria
- Next action handoff

## HTML requirements

- Single self-contained HTML file.
- Inline CSS and JS unless local project rules require otherwise.
- Clear navigation.
- First screen shows decision, evidence, recommendation, risk, and next action.
- First screen answers the primary intent directly.
- First screen states the artifact budget and the mental work removed.
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
- Did it make the reader feel understood in the first screen?
- Did it distill the base concept into a simple visible model?
- Did it choose the smallest sufficient artifact budget?
- Did it justify why HTML beats Markdown?
- Did it create at least one real browser advantage: interaction, visible structure, concrete output, or 5-second decision?
- Did the first screen make the supported decision obvious?
- Did it inspect evidence?
- Did it separate facts from inference?
- Did it make uncertainty visible?
- Did it improve decision quality over Markdown?
- Did every interaction create useful state or exportable output?
- Did it stay as small as possible?
- Did the final section give one recommended next action, one ready-to-run command, and only useful alternatives?
- If this belongs in a chain, did it state chain position and the next useful artifact?
- If someone else will read it, did it include a share-ready summary or agent reentry block?
- Did the next options match the user's most likely next moves?

## Final chat response

Keep it short:

```text
Created: <path>
Pattern used: <pattern>
Budget used: <compact / standard / interactive>
Decision supported: <decision>
Quality-bar result: <pass / needs revision>
Main uncertainty: <uncertainty or none>
Next command: <copy-ready command or prompt>
```

Do not paste the full HTML into chat unless requested.
