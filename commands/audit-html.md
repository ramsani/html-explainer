# /audit-html

Audit an existing HTML artifact against the html-explainer quality bar.

Completion goal: `goals/artifact-ready.goal.md` when improving the artifact, or `goals/docs-coherent.goal.md` when auditing repo documentation.

## Intent

Decide whether the artifact is useful, evidence-backed, readable, and decision-ready.

## Required References

Use:

- `docs/DECISION_GATE.md`
- `docs/LANGUAGE_POLICY.md`
- `docs/PATTERN_GUIDE.md`
- matching `patterns/NN-*.md` file when the pattern is identifiable
- `docs/FACT_SHEET.md`
- `docs/STYLE.md`
- `docs/HUMAN_INTERFACE.md`
- `docs/QUALITY_BAR.md`
- `docs/INVISIBLE_QUALITY.md`
- `docs/CHAIN.md`
- `docs/MEMORY_ACCESS.md`

## Process

1. Identify the artifact's primary intent.
2. Identify the likely pattern.
3. Compare against the matching pattern file.
4. Check whether HTML beats Markdown for this case.
5. Check evidence visibility.
6. Separate facts, inferences, assumptions, and unknowns.
7. Check first-screen usefulness.
8. Check visual clarity and mobile readability.
9. Check interaction and export if present.
10. Check artifact language against the user or intended audience.
11. Check whether the artifact invites choice without pressure.
12. Check the next action and copy-ready prompt.
13. Check archive recommendation when the artifact may be reused.
14. Check whether memory access is visible but quiet.
15. Check whether the artifact already contains the required user-facing parts.
16. Run `~/.claude/html-explainer/scripts/audit-artifact.py <artifact.html> --json` when a local file is available.
17. Score with `docs/QUALITY_BAR.md`.
18. Recommend accept, revise, reject, or simplify to Markdown.
19. If a revised HTML file is delivered, run `~/.claude/html-explainer/scripts/deliver-artifact.py <artifact.html> --min-score 90`.
20. If delivery is blocked, revise the artifact and run the delivery command again before the final chat response.

## Output

```text
Intent:
Artifact pattern:
Score:
Recommendation: accept | revise | reject | simplify to Markdown

Critical issues:
High-value fixes:
Intent gaps:
Evidence gaps:
HTML advantage gaps:
Budget gaps:
UX and visual gaps:
Interaction/export gaps:
Next-action gaps:
Language gaps:
Human-interface gaps:
Memory gaps:
Memory access:
Completeness gaps:

Best next prompt:
Delivery approval:
```

## Hard Fail Conditions

Fail the artifact if it:

- invents inspected evidence;
- misses the primary intent;
- hides uncertainty;
- does not justify why HTML beats Markdown;
- uses interaction without exportable output;
- is unreadable or incoherent on mobile;
- claims tests passed without proof;
- recommends risky production/security/data changes without evidence;
- leaves the user to invent the next command.
- omits archive guidance when the artifact may become future context.
- hides how reusable work can be found later.
- pushes one path without giving the user a graceful choice.
- omits required user-facing parts.

## Completion

Use the completion goal named above as the completion standard. If the user invoked /goal, keep working until that goal is satisfied; otherwise, report a blocker instead of claiming completion when the standard cannot be met.
