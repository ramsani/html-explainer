# 14 — Research Comparison Map

Intent: compare tools, sources, libraries, frameworks, vendors, approaches, or workflows using explicit criteria.

Use when a decision depends on current information, trade-offs, or source quality.

Evidence required: source list, dates when relevant, criteria, constraints, user context, source reliability.

Prompt template:
```text
Generate a self-contained HTML research comparison map. Use explicit criteria, cite inspected sources when available, separate facts from inference, and recommend by use case.
```

HTML structure: intent, criteria, sources inspected, comparison matrix, source quality, assumptions, recommendations by use case, risks.

Quality checklist: criteria are explicit, source freshness is visible, recommendation follows the user's constraints.

Failure modes: ranking without criteria, outdated sources, mixing fact and opinion.

Acceptance criteria: the user can choose an option and understand why it fits their context.

## Visual explainer contract

Apply `docs/VISUAL_EXPLAINER_PLAYBOOK.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
