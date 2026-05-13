# /make-the-right-html

Generate a self-contained HTML artifact using the HTML effectiveness operating model.

## Intent

Create an artifact that helps the user inspect, compare, verify, decide, or re-enter context better than Markdown.

## Mandatory process

1. Decide whether HTML is justified. If Markdown is clearer, say so and do not generate HTML.
2. Open `docs/INTENT_DISTILLATION.md` and define primary intent, obvious secondary intents, base concept, and fastest path to value.
   Treat the primary intent as the spine of the artifact: every major section, finding, risk, and next action must move the user toward it.
3. Open `docs/CONTEXT_PACKS.md` and choose the smallest context pack that can support the decision.
4. Open `docs/EXPLAINER_CLARITY.md` and define the reader contract.
5. Open `docs/VISUAL_EXPLAINER_PLAYBOOK.md` and choose the primary visual model.
6. Open `docs/THARIQ_SITE_LEARNINGS.md` and apply the distilled lessons.
7. Open `docs/USER_IN_THE_LOOP.md` and define how the artifact invites inspection, choice, challenge, editing, or export.
8. Open `docs/VISUAL_STYLE_STANDARD.md` and use system light/dark with minimal, flat, professional styling.
9. Open `docs/LEAN_HTML_RENDERING.md` and define the lean rendering guard.
10. Open `docs/DECISION_COST_GATE.md` when the task is a plan, architecture choice, PR review, design direction, or implementation approach.
11. Open `docs/HTML_ADVANTAGE_GATE.md` and prove HTML beats Markdown for this task.
12. Open `docs/ARTIFACT_BUDGET.md` and choose compact, standard, or interactive.
13. Use `docs/pattern-router.md` to select one primary pattern.
14. Open the matching file in `patterns/` and apply its evidence requirements, prompt template, HTML structure, visual explainer contract, quality checklist, failure modes, and acceptance criteria.
15. Open `docs/HTML_UX_STANDARD.md` and define the artifact's UX contract.
16. Inspect real sources before generation.
17. Build a fact sheet using `docs/fact-sheet-protocol.md`.
18. Separate facts, inferences, unsupported claims, and unknowns.
19. Separate repo/product files from local generated session artifacts.
20. Generate the smallest useful HTML artifact.
21. Apply `docs/QUALITY_BAR.md` before finalizing.
22. Compare against `docs/GOLDEN_OUTPUTS.md` when the artifact is a PR review, visual exploration, or project reentry.
23. Include uncertainty visibly.
24. Apply `docs/HTML_ARTIFACT_CHAINS.md` when the work naturally needs exploration, planning, review, or handoff across multiple artifacts.
25. Apply `docs/SHARE_AND_REENTRY.md` when the artifact may be shared or used by another agent later.
26. Apply `docs/NEXT_ACTION_HANDOFF.md` so the artifact ends with a copy-ready next step.
27. Apply `docs/HTML_DELIVERY.md` so the final response includes a clickable absolute path and opens the artifact when tool access allows it.
28. Save the artifact to a reasonable local path when tool access allows it.

## Required artifact sections

- Intent
- Intent distillation
- HTML advantage
- Artifact budget and cost justification
- Selected pattern
- Reader contract
- Primary visual model
- User-in-the-loop value
- Visual style
- Lean rendering guard
- Decision cost
- UX contract
- Evidence inspected
- Fact sheet
- Local artifact classification when the repo contains generated outputs
- Current state
- Visual model, comparison, map, timeline, table, prototype, or editor
- Risks
- Assumptions
- Unknowns
- Share-ready summary when useful
- Agent reentry block when useful
- Recommendation
- Success criteria
- Next action handoff with one recommended prompt and three logical copy/edit options when useful
- Delivery: clickable path, and browser opened when available

## HTML requirements

- Single self-contained HTML file.
- Saved to a reasonable local path.
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
- Final response must include a clickable absolute path to the artifact.

## Final self-check

Before responding, verify:

- Did the artifact use the right pattern?
- Did it answer the primary intent directly?
- Did it cover obvious secondary intents without bloating the artifact?
- Did every major finding and next action advance the primary intent?
- Did any secondary issue hijack the recommendation?
- Did it make the reader feel understood in the first screen?
- Did it distill the base concept into a simple visible model?
- Did it choose the smallest sufficient artifact budget?
- Did it keep CSS/JS as small as the decision allows?
- Did it justify why HTML beats Markdown?
- Did it create at least one real browser advantage: interaction, visible structure, concrete output, or 5-second decision?
- Did the first screen make the supported decision obvious?
- Did it inspect evidence?
- Did it separate facts from inference?
- Did it avoid turning local generated HTML into a product risk unless evidence supports that?
- Did it verify CI/tags/examples before claiming they are missing?
- Did it make uncertainty visible?
- Did it improve decision quality over Markdown?
- Did every interaction create useful state or exportable output?
- Did it stay as small as possible?
- Did the final section give one recommended next action, one copy-ready prompt, and three logical copy/edit options when follow-up work is likely?
- Can the generated artifact act as useful input for the next command or next agent?
- If this belongs in a chain, did it state chain position and the next useful artifact?
- If this belongs in an intent-led process, did the next step carry forward the original intent and evidence?
- If someone else will read it, did it include a share-ready summary or agent reentry block?
- Did the next options match the user's most likely next moves?
- Did the final response remove opening friction with a clickable path or browser-open action?

## Final chat response

Keep it short:

```text
Created: <path>
Open: <clickable absolute path>
Pattern used: <pattern>
Budget used: <compact / standard / interactive>
Decision supported: <decision>
Quality-bar result: <pass / needs revision>
Main uncertainty: <uncertainty or none>
Next command: <copy-ready command or prompt>
```

Do not paste the full HTML into chat unless requested.
