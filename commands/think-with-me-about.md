# /think-with-me-about

Create a decision-ready HTML thinking surface using the Insight Surface Loop.

Completion goal: `goals/artifact-ready.goal.md`.

Use when the user wants to think through a topic, idea, decision, strategy, problem, opportunity, or unclear question.

Do not use for simple facts, single commands, tiny edits, or low-consequence notes where Markdown is enough.

## Mandatory Process

1. Apply `docs/DECISION_GATE.md`.
2. Apply `docs/LANGUAGE_POLICY.md`.
3. Use HTML only if the topic benefits from a visual thinking surface.
4. Apply `docs/INSIGHT_SURFACE_LOOP.md`.
5. Apply `docs/FACT_SHEET.md`.
6. Separate facts, inferences, assumptions, hypotheses, and unknowns.
7. Select the smallest useful artifact budget.
8. Generate one self-contained HTML file.
9. Apply `docs/STYLE.md`.
10. Apply `docs/HUMAN_INTERFACE.md`.
11. Apply `docs/QUALITY_BAR.md`.
12. Confirm the required user-facing parts in `docs/INVISIBLE_QUALITY.md`.
13. Apply `docs/CHAIN.md` for the next prompt.
14. Apply `docs/MEMORY_ACCESS.md` for a quiet saved/not-saved receipt.
15. Apply `docs/DELIVERY.md`.

When artifact memory docs are present, recommend whether to preserve the artifact using `docs/ARTIFACT_MEMORY.md`.

## Required Loop

```text
Frame -> Expand -> Ground -> Stress -> Synthesize -> Decide -> Preserve -> Re-enter
```

## Required Artifact Sections

- North Star.
- Evidence Board.
- Perspective Map.
- Tension Map.
- Stress Test.
- Insight Card.
- Action Queue.
- Preserve / Re-enter.

## P0 Gates

Do not deliver a serious artifact unless it passes these gates:

- Topic and real question are clear.
- HTML advantage is explicit.
- Facts, inferences, assumptions, hypotheses, and unknowns are separated.
- At least one critical tension or risk is visible.
- Stress testing is included.
- There is a provisional conclusion, or a clear reason one is not justified.
- There is a concrete next action.
- There is a copy-ready next prompt.
- There is an archive recommendation.
- No fake certainty, fake metrics, or unsupported claims are present.

## HTML Requirements

- Single self-contained HTML file.
- No external network dependency unless explicitly requested.
- System light/dark mode.
- Responsive layout.
- First screen shows topic, real question, provisional conclusion, confidence, risk, and next action.
- Facts, inferences, assumptions, hypotheses, and unknowns are separated.
- Interaction is minimal and only included when it reduces cognitive load.
- Include copy/export for the next prompt when interaction is present.
- Final response includes a clickable absolute path.

## Archive Recommendation

End the artifact with:

```text
Archive recommendation:
Save / do not save:
Suggested validity:
Freshness risk:
Suggested title:
Suggested tags:
Reason:
```

Suggested validity values:

```text
temporal
replaceable
evergreen
private
do-not-reuse
```

## Final Self-Check

Before responding:

- Did it help the user think better, not merely read more?
- Did it avoid unsupported claims?
- Did it test how the idea could fail?
- Did it make the next action obvious?
- Did it include a next prompt that preserves context?
- Did it use the smallest useful HTML surface?
- Did it avoid academic theory overload?
- Did it explain whether to preserve the artifact?

## Final Chat Response

```text
Created:
Open:
Method: Insight Surface Loop
Budget:
Primary insight:
Confidence:
Next action:
Archive recommendation:
Next command:
```

Do not paste the full HTML into chat unless requested.

## Done Means

- Primary intent was answered.
- Required evidence was inspected or the lack of evidence was stated.
- HTML was generated only if it beats Markdown.
- The artifact or response includes risk, uncertainty, recommendation, and next action.
- Save / private / refresh / supersede / discard decision was made.
- If HTML was delivered, deliver-artifact.py approved it.
