# Lean HTML Rendering

Intent: generate faster, smaller, more elegant HTML without losing the user's decision value.

Lean HTML is not cheap-looking HTML. It is focused HTML.

## Core rule

Minimize rendering cost before reducing meaning.

Keep:

- primary visual model;
- evidence;
- recommendation;
- uncertainty;
- next action;
- export when the user edits or tunes something.

Cut:

- repeated CSS;
- decorative cards;
- verbose labels;
- duplicate summaries;
- unused states;
- custom JavaScript that does not change understanding or export output.

## Budget limits

These are soft caps. Exceed them only when the decision clearly needs it.

| Budget | Sections | CSS | JS | Visuals | Interaction |
|---|---:|---|---|---|---|
| compact | 3-5 | tiny shared CSS | none or copy only | 1 primary visual | none unless copy/export |
| standard | 5-8 | small shared CSS | minimal toggles/copy | 1 primary visual + 1 support visual | filter/toggle/details only |
| interactive | as needed | shared CSS + tool styles | required for tool state | editor/prototype/sandbox | stateful controls + export |

## CSS rules

Use a small token set:

```css
:root{color-scheme:light dark;--bg:#faf9f5;--surface:#fff;--text:#171717;--muted:#6b6b66;--line:#dedbd2;--accent:#d97757}
@media(prefers-color-scheme:dark){:root{--bg:#141413;--surface:#1d1c1a;--text:#f4f1ea;--muted:#aaa59a;--line:#383631;--accent:#e59b77}}
```

Prefer reusable primitives:

- `.wrap`
- `.hero`
- `.grid`
- `.panel`
- `.muted`
- `.tag`
- `.vis`
- `.actions`

Avoid one-off classes for every section unless the interaction needs them.

## HTML structure rules

Prefer:

- semantic sections;
- short headings;
- one primary visual above the fold;
- `<details>` for depth;
- lists over paragraphs when scanning matters;
- tables only for real comparisons;
- inline SVG only when it replaces a long explanation.

Avoid:

- nested cards;
- more sections than decisions;
- repeated "Intent / Budget / UX contract" blocks when they do not help the reader;
- metadata-first layout;
- long prose inside cards.

## JavaScript rules

Use no JavaScript unless it:

- filters;
- toggles views;
- simulates state;
- updates preview;
- validates inputs;
- copies or exports output.

Copy/export JavaScript should be tiny.

## Copy rules

Use short action language.

Do not show every internal process field unless it helps the reader decide.

Internal process can be summarized:

```text
Why HTML: shows trade-offs side by side and exports the next prompt.
```

Instead of:

```text
Intent distillation, artifact budget, HTML advantage, visual model, UX contract...
```

## When not to compress

Do not compress away:

- safety warnings;
- factual uncertainty;
- inspected evidence;
- reasoning behind a recommendation;
- export output;
- failure paths in plans, workflows, incidents, auth, data, deploy, payment, or security work.

## Hard fails

Revise the artifact if:

- CSS is longer than the explanation;
- JS exists but does not change state or export output;
- there are many visually identical cards;
- the first screen is metadata instead of answer;
- the artifact has more sections than decisions;
- the artifact feels slower to read than a clean Markdown answer.
