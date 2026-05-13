# /audit-html

Audit an existing HTML artifact against the html-explainer quality bar.

## Intent

Decide whether the artifact is useful, evidence-backed, readable, and decision-ready.

## Required References

Use:

- `docs/DECISION_GATE.md`
- `docs/PATTERN_GUIDE.md`
- matching `patterns/NN-*.md` file when the pattern is identifiable
- `docs/FACT_SHEET.md`
- `docs/STYLE.md`
- `docs/QUALITY_BAR.md`
- `docs/CHAIN.md`

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
10. Check the next action and copy-ready prompt.
11. Score with `docs/QUALITY_BAR.md`.
12. Recommend accept, revise, reject, or simplify to Markdown.

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

Best next prompt:
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
