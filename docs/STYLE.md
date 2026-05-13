# Style

Use this when generating HTML.

## Visual Direction

Keep artifacts minimal, flat, readable, and professional.

Use:

- system fonts;
- restrained color;
- clear hierarchy;
- lightweight cards or sections;
- tables, timelines, diagrams, or controls only when they clarify;
- system light/dark mode with `prefers-color-scheme`;
- reduced motion support when animation exists.

Avoid:

- decorative dashboards;
- large gradients;
- generic purple visual-explainer styling;
- repeated CSS;
- oversized cards inside cards;
- labels that explain the UI instead of the work;
- interaction that does not change a decision.

## First Screen

The first screen must show:

- what this artifact is for;
- the main recommendation or decision;
- the evidence basis;
- the main risk or uncertainty;
- the next action.

## Lean Rendering

Keep the HTML small:

- one CSS token set;
- reusable primitives;
- no external network dependency unless requested;
- only necessary JavaScript;
- no duplicate summaries.
