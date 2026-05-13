# 11 — Technical Decision Deck

Intent: present a technical decision clearly for alignment.

Use when a recommendation, trade-off, or architecture decision must be communicated to others.

Evidence required: decision context, alternatives, constraints, evidence, risks, recommended path.

Prompt template:
```text
Generate a self-contained HTML technical decision deck. Include thesis, context, alternatives, evidence, trade-offs, decision, implications, and next steps.
```

HTML structure: title/thesis, context, alternatives, evidence, decision, implications, risks, next steps.

Quality checklist: deck is concise, evidence supports the recommendation, alternatives are fair, implications are explicit, and the ask is clear.

Failure modes: sales-style slides, weak evidence, hiding trade-offs, too much visual polish, no concrete decision request.

Acceptance criteria: a stakeholder can understand and challenge the decision quickly.

## Tie-breakers

Use a deck when the artifact must align people. Use comparison or architecture when the user alone needs to make a technical choice.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
