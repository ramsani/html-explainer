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

## Font Pairings

Font choices signal tone before the user reads a word. Rotate pairings across consecutive artifacts to avoid a house style.

### Forbidden Fonts (AI Slop Signals)

Never use these as `--font-body`:

- **Inter** — the most overused AI default font.
- **Roboto** — generic Android/Google default.
- **Arial, Helvetica** — system defaults with no character.
- **system-ui alone** without a named font — signals zero design intent.

### Recommended Pairings

| Body / Headings | Mono / Labels | Feel | Best for |
|---|---|---|---|
| DM Sans | Fira Code | Friendly, developer | Blueprint, technical docs |
| Instrument Serif | JetBrains Mono | Editorial, refined | Plan reviews, decision logs |
| IBM Plex Sans | IBM Plex Mono | Reliable, readable | Architecture diagrams |
| Bricolage Grotesque | Fragment Mono | Bold, characterful | Data tables, dashboards |
| Plus Jakarta Sans | Azeret Mono | Rounded, approachable | Status reports, audits |
| Outfit | Space Mono | Clean geometric | Flowcharts, pipelines |
| Sora | IBM Plex Mono | Technical, precise | ER diagrams, schemas |
| Crimson Pro | Noto Sans Mono | Scholarly, serious | RFC reviews, specs |
| Fraunces | Source Code Pro | Warm, distinctive | Project recaps |

### Typography by Content Voice

Match font to the content's voice:

| Voice | Fonts | Best for |
|-------|-------|----------|
| **Literary / Thoughtful** | Literata, Lora, Newsreader, Merriweather | Essays, personal posts, long-form |
| **Technical / Precise** | IBM Plex Sans + Mono, Geist + Geist Mono | Documentation, READMEs, API refs |
| **Bold / Contemporary** | Bricolage Grotesque, Space Grotesk, DM Sans | Product pages, feature announcements |
| **Minimal / Focused** | Source Serif 4 + Source Sans 3, Karla + Inconsolata | Tutorials, how-tos, focused reading |

### Loading Fonts

Load Google Fonts with `display=swap` for fast rendering:

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">
```

Define as CSS variables for easy reference:

```css
:root {
  --font-body: 'Outfit', system-ui, sans-serif;
  --font-mono: 'Space Mono', 'SF Mono', Consolas, monospace;
}
```

## Quality Tests

Run these before delivering any artifact.

### Squint Test

Close your eyes or blur your vision. Look at the artifact from across the room or by squinting at the screen. Ask:

- What is the first thing that jumps out?
- Does that match the primary intent?
- Is the visual hierarchy aligned with the information hierarchy?

If the answer to "what jumps out" is not the primary recommendation or next action, the visual hierarchy is misaligned. Fix the dominant element before delivery.

### Swap Test

Switch between light and dark mode. Check:

- Every text element remains legible.
- Depth tiers are preserved (elevated still looks elevated, recessed still looks recessed).
- Status colors (green/amber/red) remain distinguishable.
- No element disappears or changes meaning between modes.

If something breaks in one mode, fix it — do not assume the broken mode is less important.

### Reduced Motion Check

If the artifact uses animation, verify:

- The page is fully functional with `@media (prefers-reduced-motion: reduce)` active.
- No content is hidden behind animation (always-visible content only).
- No user action is blocked until animation completes.
