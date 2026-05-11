# 17 — Project Recap

Intent: re-enter a repo or project quickly with operational context.

Use when returning to a project after time away or when onboarding an agent/human.

Evidence required: README, package/config files, source tree, recent git activity, docs, tests, plans, issues if available.

Prompt template:
```text
Generate a self-contained HTML project recap. Inspect actual project evidence. Show project identity, architecture, entry points, recent activity, constraints, risks, open questions, and recommended next action.
```

HTML structure: intent, evidence, project identity, architecture, entry points, workflows, recent activity, decisions, risks, next action, reentry checklist.

Quality checklist: not README-only, recent activity is considered, next action is concrete.

Failure modes: marketing summary, ignoring git activity, no operational context.

Acceptance criteria: the user can resume work without re-exploring the repo from zero.
