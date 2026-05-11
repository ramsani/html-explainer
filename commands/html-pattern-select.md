# /html-pattern-select

Select the correct HTML artifact pattern before generating anything.

## Task

Analyze the user's request and choose the smallest useful HTML artifact pattern.

Do not generate HTML yet.

## Required references

Use:

- `docs/pattern-router.md` to map task signals to the right pattern.
- The selected file in `patterns/` to determine evidence requirements, HTML structure, quality checklist, failure modes, and acceptance criteria.
- `docs/QUALITY_BAR.md` to decide whether HTML is justified at all.

## Process

1. Identify the decision the user needs to make.
2. Determine whether HTML is justified or Markdown is better.
3. Use the router to select one primary pattern.
4. Open/read the matching pattern file.
5. Optionally select up to two supporting sections.
6. State what evidence must be inspected before generation.
7. State the minimum validation required.
8. State the next command/prompt to run.

## Output

Return:

```text
Intent:

HTML justified: yes | no

Recommended pattern:

Pattern file:

Why this pattern:

Do not use HTML if:

Evidence to inspect first:

Required HTML sections:

Quality checklist:

Risks to avoid:

Acceptance criteria:

Next prompt to run:
```

## Rules

- If Markdown is enough, say so.
- Prefer simple artifacts.
- Use one primary pattern.
- Do not create dashboards by default.
- Do not generate HTML before verification.
- Do not select a pattern without checking the pattern file.
