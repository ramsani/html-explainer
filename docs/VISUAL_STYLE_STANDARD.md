# Visual Style Standard

Intent: make generated artifacts feel minimal, flat, elegant, readable, and professional in the spirit of Thariq's HTML examples.

This is not a brand clone. It is a style discipline.

## Theme behavior

Every serious artifact should support system light/dark mode:

```css
:root {
  color-scheme: light dark;
  --bg: #faf9f5;
  --surface: #ffffff;
  --text: #171717;
  --muted: #6b6b66;
  --line: #dedbd2;
  --accent: #d97757;
}

@media (prefers-color-scheme: dark) {
  :root {
    --bg: #141413;
    --surface: #1d1c1a;
    --text: #f4f1ea;
    --muted: #aaa59a;
    --line: #383631;
    --accent: #e59b77;
  }
}
```

Use the product's real design tokens when available. Otherwise use restrained neutrals plus one accent.

Apply `docs/LEAN_HTML_RENDERING.md` before writing CSS. Prefer a small shared token set and reusable primitives.

## Visual tone

Prefer:

- flat surfaces;
- thin borders;
- calm spacing;
- system fonts;
- small labels;
- restrained color;
- inline SVG diagrams;
- simple interaction;
- no external assets by default.

Avoid:

- generic dark dashboards;
- glow effects;
- heavy gradients;
- bokeh/orbs;
- excessive shadows;
- neon palettes;
- decorative cards of prose;
- repeated custom CSS for similar sections;
- oversized marketing hero sections;
- one-color purple/blue themes.

## Layout

Use the smallest layout that makes the concept clear:

- narrow reading column for explainers;
- side-by-side grid for comparisons;
- board layout for triage;
- timeline for plans/status/incidents;
- diagram-first layout for architecture/workflows;
- editor layout for tuning/configuration.

The first screen should show the answer and the primary visual model. Do not use the first screen for metadata only.

## Components

Use simple HTML/CSS primitives:

- `<section>` for major areas;
- `<nav>` for anchors when there are four or more sections;
- `<table>` only for true tabular comparison;
- `<details>` for optional depth;
- `<button>` for actions and toggles;
- inline `<svg>` for diagrams and illustrations;
- `<textarea>` or `<pre>` for exportable output.

## Interactions

Interaction must either:

- change the view;
- reveal the relevant detail;
- tune a parameter;
- simulate behavior;
- copy or export output.

If interaction does not change understanding, remove it.

## Typography

- Use system UI fonts.
- Use mono only for code, file paths, commands, and tokens.
- Keep headings direct and short.
- Use body text around 15-17px.
- Avoid dense all-caps labels except tiny metadata.

## Copy and export

When the artifact creates something reusable, include a clear copy/export area.

Examples:

- copy markdown;
- copy prompt;
- copy JSON;
- copy diff;
- download inline SVG;
- copy checklist.

## Hard fails

Revise the artifact if:

- it ignores system light/dark mode;
- it looks like a generic dark admin dashboard;
- it uses decoration instead of explanation;
- it has no primary visual above the fold;
- it depends on network assets without reason;
- its layout would be hard to read on mobile.
