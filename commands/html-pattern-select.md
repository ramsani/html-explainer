# /html-pattern-select

Select the correct HTML artifact pattern before generating anything.

## Task

Analyze the user's request and choose the smallest useful HTML artifact pattern.

Do not generate HTML yet.

## Process

1. Identify the decision the user needs to make.
2. Determine whether HTML is justified.
3. Select one primary pattern from the 20-case library.
4. Optionally select up to two supporting sections.
5. State what evidence must be inspected before generation.
6. State the minimum validation required.

## Output

Return:

```text
Intent:

Recommended pattern:

Why this pattern:

Do not use HTML if:

Evidence to inspect first:

Required sections:

Risks to avoid:

Next prompt to run:
```

## Rules

- If Markdown is enough, say so.
- Prefer simple artifacts.
- Do not create dashboards by default.
- Do not generate HTML before verification.
