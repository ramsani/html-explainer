# 16 — Audit Report

Intent: assess a repo, workflow, prompt, system, or artifact against explicit criteria.

Use when the user asks for serious review, quality judgment, risk review, or professional evaluation.

Evidence required: rubric, inspected files/artifacts, commands, observed behavior, known constraints.

Prompt template:
```text
Generate a self-contained HTML audit report. Define the rubric first. Inspect evidence. Score findings by severity and impact. Include gaps, do-not-change areas, recommendations, and acceptance criteria.
```

HTML structure: intent, rubric, evidence inspected, scores/severity, findings, risks, prioritized fixes, do-not-change list, next actions.

Quality checklist: rubric is explicit, findings cite evidence, recommendations are prioritized.

Failure modes: superficial structure review, unweighted laundry list, no evidence, touching things only to polish.

Acceptance criteria: the user can distinguish high-impact fixes from noise.

## Visual explainer contract

Apply `docs/VISUAL_EXPLAINER_PLAYBOOK.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
