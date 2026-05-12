# Artifact Budget

Use this before generating HTML.

HTML has a cost. It spends model tokens, user attention, and browser complexity. Use it only when it removes more work than it adds.

## Budget decision

Choose one budget:

```text
compact
standard
interactive
```

Choose the budget only after applying `docs/HTML_ADVANTAGE_GATE.md`.

## Compact

Use `compact` when the user needs orientation, a quick choice, or a lightweight review.

Shape:

- one self-contained page;
- no more than 4 core sections;
- no custom controls unless copy/export is essential;
- one visible recommendation;
- one next action.

Best for:

- pattern selection;
- small diff review;
- small plan review;
- quick repo reentry;
- concept summary.

## Standard

Use `standard` when the user needs evidence, structure, risks, and decisions in one place.

Shape:

- first-screen summary;
- navigation;
- evidence section;
- main visual model;
- risk/unknowns;
- recommendation;
- next action.

Best for:

- serious project recap;
- architecture map;
- implementation plan;
- audit report;
- incident timeline;
- research comparison.

## Interactive

Use `interactive` only when interaction changes the decision or produces reusable output.

Shape:

- controls that change visible state;
- validation warnings when states are invalid;
- preview of resulting decision/config/prompt/plan;
- copy/export output;
- reset/default state.

Best for:

- ticket triage;
- feature flags;
- prompt tuning;
- animation/microinteraction tuning;
- clickable prototypes.

Do not choose `interactive` only because HTML can do it.

## Cost justification

Before generating HTML, state:

```text
Artifact budget:
Why this budget:
Markdown cost:
HTML benefit:
Mental work removed:
Token/complexity guard:
HTML advantage:
```

Examples:

- "Markdown cost: user must compare three options across separate paragraphs."
- "HTML benefit: side-by-side matrix makes trade-offs visible at once."
- "Mental work removed: reconstructing sequence, dependencies, and risk."
- "Token/complexity guard: compact artifact, no custom JS."
- "HTML advantage: searchable commands and exportable reentry checklist."

## Thariq value test

The artifact should replace one of these burdens:

- a wall of markdown;
- a table that wraps badly;
- a sequence the user must reconstruct;
- a diff that is hard to scan;
- a design choice the user must imagine;
- a configuration state the user must mentally simulate;
- a prompt/result loop that should be tightened with export.

If the artifact does not replace a real burden, use Markdown.

## Anti-overbuild rules

Fail or shrink the artifact if:

- a compact artifact would answer the need;
- interaction does not change a decision;
- interaction does not create exportable output when the artifact is a tool;
- the artifact has more sections than decisions;
- visual polish consumes attention without reducing confusion;
- generating the artifact costs more work than reading the answer.

## Default

Default to `compact`.

Move to `standard` only when evidence, risk, or structure require it.

Move to `interactive` only when the user needs to manipulate state or export a result.
