# Thariq Site Learnings

Intent: preserve the practical lessons extracted from `https://thariqs.github.io/html-effectiveness/` and its example pages.

This file is a distilled operating note, not a copy of the site.

## What the examples consistently do well

- They use HTML as a canvas, not just as formatted prose.
- They make the first view carry the main decision or concept.
- They use restrained styling and let structure do the work.
- They make diagrams, grids, flows, timelines, and mockups central.
- They use color sparingly to encode state or contrast.
- They show examples side by side when comparison matters.
- They make code review visual: diff, annotations, severity, and reviewer path.
- They make design exploration concrete: live alternatives, not descriptions.
- They use custom interfaces when text input would be awkward.
- They make artifacts shareable and readable outside the chat.

## What to import into html-explainer

1. Default to a visual model.
   A report without a diagram, matrix, ladder, map, flow, timeline, board, or prototype usually underuses HTML.

2. Favor compact, flat visual design.
   The artifact should feel like a clear document or small tool, not a dashboard theme.

3. Use system light/dark.
   The artifact should respect `prefers-color-scheme` unless project design tokens say otherwise.

4. Make comparison spatial.
   Alternatives, diffs, states, and trade-offs should be visible side by side.

5. Make review directional.
   PR/diff artifacts should lead to accept, fix, verify, split, or share.

6. Make tuning exportable.
   If the user changes values, the artifact should produce something copyable.

7. Make context reusable.
   A good HTML file should help another human or agent understand what happened.

8. Do not overbuild.
   A single purposeful HTML file is better than a generic app shell.

## Style baseline

Use `docs/VISUAL_STYLE_STANDARD.md`.

The baseline is:

- minimal;
- flat;
- elegant;
- professional;
- readable in light and dark mode;
- focused on explanation.

## Anti-patterns

- Styled Markdown with many cards.
- Metadata-heavy first screen.
- Generic dark dashboard.
- Decorative gradients.
- Big tables where a diagram would explain faster.
- Interaction that does not change state or export output.
- HTML that looks impressive but leaves the next action unclear.
