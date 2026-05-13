# 14 — Research Comparison Map

Intent: compare tools, sources, libraries, frameworks, vendors, approaches, or workflows using explicit criteria.

Use when a decision depends on current information, trade-offs, or source quality.

Evidence required: source list, dates when relevant, criteria, constraints, user context, source reliability.

Prompt template:
```text
Generate a self-contained HTML research comparison map. Use explicit criteria, cite inspected sources when available, separate facts from inference, and recommend by use case.
```

HTML structure: intent, criteria, sources inspected, comparison matrix, source quality, assumptions, recommendations by use case, risks.

Quality checklist: criteria are explicit, source freshness is visible, recommendation follows the user's constraints, confidence is stated, and trade-offs are comparable.

Failure modes: ranking without criteria, outdated sources, mixing fact and opinion, hiding uncertainty, recommending one option without use-case fit.

Acceptance criteria: the user can choose an option and understand why it fits their context.

## Tie-breakers

Use research comparison when sources and criteria drive the decision. Use code approach comparison when the options are implementation paths inside the repo.

## Human interface contract

Apply `docs/HUMAN_INTERFACE.md`. The artifact must recommend one best next move while keeping optional actions visible: continue, revise, compare, think this through, save for later, or stop when enough. Any interaction must give the user real control, not decoration.

## Visual explainer contract

Apply `docs/PATTERN_GUIDE.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
