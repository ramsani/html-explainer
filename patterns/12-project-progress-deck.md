# 12 — Project Progress Deck

Intent: summarize project state for review, handoff, or alignment.

Use for weekly review, milestone review, client/internal updates, or reentry after a pause.

Evidence required: recent commits, issues/PRs, docs, changelog, plans, current blockers.

Prompt template:
```text
Generate a self-contained HTML project progress deck. Inspect project evidence first. Show what changed, what works, what is blocked, risks, decisions needed, and next steps.
```

HTML structure: project snapshot, evidence, progress, blockers, risks, decisions needed, next steps.

Quality checklist: status is evidence-backed, blockers are actionable, next decisions are clear, dates/scope are explicit, and risks are not softened.

Failure modes: status theater, hiding open questions, summarizing without next action, vague progress labels, no owner for blocked work.

Acceptance criteria: the user can understand project state and decide what to do next.

## Tie-breakers

Use progress deck for stakeholder status. Use project recap when the user needs operational reentry into the repo.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
