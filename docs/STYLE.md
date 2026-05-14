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
- CSS transitions or animations with easing curves only when they clarify timing, feedback, or state change;
- reduced motion support with `@media (prefers-reduced-motion: reduce)` when animation exists.

Avoid:

- decorative dashboards;
- large gradients;
- generic purple visual-explainer styling;
- repeated CSS;
- oversized cards inside cards;
- labels that explain the UI instead of the work;
- interaction that does not change a decision.
- animation that is only there to impress.

## First Screen

The first screen must show:

- what this artifact is for;
- the main recommendation or decision;
- the evidence basis;
- the main risk or uncertainty;
- the next action.

## Visible Copy

Apply `docs/USER_FACING_COPY.md`.

The user should see plain labels such as "What you need", "What I checked", "What could go wrong", "Best next move", "Continue from here", and "Save this?".

Avoid exposing internal labels such as "Primary intent", "Artifact budget", "HTML advantage", "Pattern routing", "Quality gate", or "Fact sheet" in the visible artifact unless the user specifically asks for implementation detail.

## Human Interface

Apply `docs/HUMAN_INTERFACE.md`.

Invite the user into the next useful action without pressure. The artifact may recommend one best next move, but it should also leave the user free to compare, revise, think this through, save for later, or stop.

If interaction exists, it must put useful power in the user's mouse: compare, tune, preview, copy, export, save, or continue.

## Lean Rendering

Keep the HTML small:

- one CSS token set;
- reusable primitives;
- no external network dependency unless requested;
- only necessary JavaScript;
- no duplicate summaries.
