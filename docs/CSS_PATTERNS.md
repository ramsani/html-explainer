# CSS Patterns

Practical CSS patterns for generating decision-ready HTML artifacts. These solve real problems the LLM encounters when writing HTML.

Use these when the artifact benefits from layout structure, visual hierarchy, or interactive diagrams. Prefer simplicity — add only what the decision requires.

## Overflow Protection

Grid and flex children default to `min-width: auto`, which prevents shrinking. Long text, inline code badges, and non-wrapping elements blow out containers.

```css
/* Every grid/flex child must shrink */
.grid > *, .flex > *,
[style*="display: grid"] > *,
[style*="display: flex"] > * {
  min-width: 0;
}

/* Long text wraps */
body {
  overflow-wrap: break-word;
}
```

### Side-by-side comparison panels

```css
.comparison {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
}

.comparison > * {
  min-width: 0;
  overflow-wrap: break-word;
}

@media (max-width: 768px) {
  .comparison { grid-template-columns: 1fr; }
}
```

### List markers with inline code

Never use `display: flex` on `<li>` for marker characters — it creates anonymous flex items that can't shrink. Use absolute positioning instead:

```css
/* WRONG — overflow with inline code badges */
li {
  display: flex;
  align-items: baseline;
  gap: 6px;
}
li::before {
  content: '›';
  flex-shrink: 0;
}

/* RIGHT — text wraps normally */
li {
  padding-left: 14px;
  position: relative;
}
li::before {
  content: '›';
  position: absolute;
  left: 0;
}
```

### Lists inside bordered containers

```css
/* WRONG — markers overlap border */
.card ol, .card ul {
  padding-left: 20px;
}

/* RIGHT — inside positioning */
.card ol, .card ul {
  list-style-position: inside;
}

/* OR — adequate padding */
.card ol, .card ul {
  padding-left: 2em;
}
```

## Code Blocks

Code blocks need explicit whitespace preservation and height constraints. Without these, code runs together and long files overwhelm the page.

### Basic pattern

```css
.code-block {
  font-family: var(--font-mono);
  font-size: 13px;
  line-height: 1.5;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 16px;
  overflow-x: auto;
  /* CRITICAL: preserve line breaks */
  white-space: pre-wrap;
  word-break: break-word;
}

/* Constrain height */
.code-block--scroll {
  max-height: 400px;
  overflow-y: auto;
}
```

### With file header

```css
.code-file {
  border: 1px solid var(--border);
  border-radius: 8px;
  overflow: hidden;
}

.code-file__header {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 10px 16px;
  background: var(--surface);
  border-bottom: 1px solid var(--border);
  font-family: var(--font-mono);
  font-size: 12px;
  color: var(--text-dim);
}

.code-file__body {
  font-family: var(--font-mono);
  font-size: 13px;
  line-height: 1.5;
  padding: 16px;
  background: var(--surface-elevated);
  white-space: pre-wrap;
  word-break: break-word;
  max-height: 500px;
  overflow: auto;
}
```

## Data Tables

Use real `<table>` for tabular data. Wrap in scrollable container for wide tables.

```css
.table-wrap {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 12px;
  overflow: hidden;
}

.table-scroll {
  overflow-x: auto;
  -webkit-overflow-scrolling: touch;
}

.data-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 13px;
  line-height: 1.5;
}

.data-table thead {
  position: sticky;
  top: 0;
  z-index: 2;
}

.data-table th {
  background: var(--surface2);
  font-family: var(--font-mono);
  font-size: 11px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 1px;
  color: var(--text-dim);
  text-align: left;
  padding: 12px 16px;
  border-bottom: 2px solid var(--border-bright);
  white-space: nowrap;
}

.data-table td {
  padding: 12px 16px;
  border-bottom: 1px solid var(--border);
  vertical-align: top;
}

.data-table tbody tr:last-child td {
  border-bottom: none;
}

.data-table tbody tr:hover {
  background: var(--accent-dim);
}

/* Right-align numeric columns */
.data-table td.num,
.data-table th.num {
  text-align: right;
  font-variant-numeric: tabular-nums;
  font-family: var(--font-mono);
}

/* Code inside cells */
.data-table code {
  font-family: var(--font-mono);
  font-size: 11px;
  background: var(--accent-dim);
  color: var(--accent);
  padding: 1px 5px;
  border-radius: 3px;
}
```

### Status indicators

```css
.status {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  font-family: var(--font-mono);
  font-size: 11px;
  font-weight: 500;
  padding: 3px 10px;
  border-radius: 6px;
  white-space: nowrap;
}

.status--match {
  background: var(--green-dim);
  color: var(--green);
}

.status--gap {
  background: var(--red-dim);
  color: var(--red);
}

.status--warn {
  background: var(--amber-dim);
  color: var(--amber);
}
```

## Depth Tiers

Vary card depth to signal importance — not everything should pop equally.

```css
/* Elevated: key sections that demand attention */
.card--elevated {
  background: var(--surface-elevated);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08), 0 1px 2px rgba(0, 0, 0, 0.04);
}

/* Default: standard content */
.card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 16px 20px;
}

/* Recessed: code blocks, secondary content */
.card--recessed {
  background: color-mix(in srgb, var(--bg) 70%, var(--surface) 30%);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.06);
}
```

## Animation

Use sparingly. Animation earns its place when it clarifies timing, feedback, or state change.

### Staggered fade-in

```css
@keyframes fadeUp {
  from { opacity: 0; transform: translateY(12px); }
  to { opacity: 1; transform: translateY(0); }
}

.card {
  animation: fadeUp 0.4s ease-out both;
  animation-delay: calc(var(--i, 0) * 0.05s);
}
```

Set `--i` per element in HTML to control stagger order.

### Hover lift

```css
.card {
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}
```

### Reduced motion

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

## Mermaid Containers

When the artifact uses Mermaid diagrams, center them and add zoom controls.

### Centering (required)

Mermaid SVGs render at fixed size and default to top-left. Always center:

```css
.mermaid-wrap {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 12px;
  padding: 24px;
  overflow: auto;
}
```

### Zoom controls

```css
.zoom-controls {
  position: absolute;
  top: 8px;
  right: 8px;
  display: flex;
  gap: 2px;
  z-index: 10;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 6px;
  padding: 2px;
}

.zoom-controls button {
  width: 28px;
  height: 28px;
  border: none;
  background: transparent;
  color: var(--text-dim);
  font-family: var(--font-mono);
  font-size: 14px;
  cursor: pointer;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background 0.15s ease;
}

.zoom-controls button:hover {
  background: var(--border);
  color: var(--text);
}
```

### Full diagram shell pattern

```html
<div class="mermaid-wrap">
  <div class="zoom-controls">
    <button type="button" data-action="zoom-in" title="Zoom in">+</button>
    <button type="button" data-action="zoom-out" title="Zoom out">−</button>
    <button type="button" data-action="zoom-fit" title="Fit">↺</button>
  </div>
  <div class="mermaid-viewport">
    <pre class="mermaid">graph TD\n  A --> B</pre>
  </div>
</div>
```

## Directory Trees

For file structures, use `<pre>` with `white-space: pre`. Tree connectors only work when vertically aligned.

```css
.dir-tree {
  font-family: var(--font-mono);
  font-size: 13px;
  line-height: 1.7;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 16px 20px;
  overflow-x: auto;
  white-space: pre;
}
```

## Responsive Nav (TOC)

For multi-section pages with 4+ sections:

```css
/* Sticky sidebar on desktop */
@media (min-width: 900px) {
  .page-layout {
    display: grid;
    grid-template-columns: 200px 1fr;
    gap: 32px;
  }

  .toc-sidebar {
    position: sticky;
    top: 24px;
    height: fit-content;
  }
}

/* Horizontal scroll on mobile */
@media (max-width: 899px) {
  .toc-nav {
    overflow-x: auto;
    gap: 8px;
    display: flex;
    padding-bottom: 8px;
  }
}
```

## Badges and Tags

```css
.tag {
  font-family: var(--font-mono);
  font-size: 10px;
  font-weight: 500;
  padding: 2px 7px;
  border-radius: 4px;
  background: var(--accent-dim);
  color: var(--accent);
}
```

## Collapsible Sections

Native `<details>/<summary>` — zero JS, accessible.

```css
details.collapsible {
  border: 1px solid var(--border);
  border-radius: 10px;
  overflow: hidden;
}

details.collapsible summary {
  padding: 14px 20px;
  background: var(--surface);
  font-family: var(--font-mono);
  font-size: 12px;
  font-weight: 600;
  cursor: pointer;
  list-style: none;
  display: flex;
  align-items: center;
  gap: 8px;
  color: var(--text);
}

details.collapsible summary::-webkit-details-marker { display: none; }

details.collapsible[open] summary::before {
  transform: rotate(90deg);
}

details.collapsible .collapsible__body {
  padding: 16px 20px;
  border-top: 1px solid var(--border);
  font-size: 13px;
  line-height: 1.6;
}
```

## Grid Layouts

### Card grid

```css
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 16px;
}
```

### Architecture (2-column)

```css
.arch-grid {
  display: grid;
  grid-template-columns: 260px 1fr;
  gap: 20px;
  max-width: 1100px;
  margin: 0 auto;
}

@media (max-width: 768px) {
  .arch-grid { grid-template-columns: 1fr; }
}
```

## Pipeline Steps

For linear workflows with numbered steps:

```css
.pipeline {
  display: flex;
  align-items: stretch;
  gap: 0;
  overflow-x: auto;
  padding-bottom: 8px;
}

.pipeline__step {
  min-width: 130px;
  flex-shrink: 0;
  background: var(--surface);
  border: 1px solid var(--border);
  border-top: 3px solid var(--accent);
  border-radius: 8px;
  padding: 16px;
}

.pipeline__arrow {
  display: flex;
  align-items: center;
  padding: 0 4px;
  color: var(--border-bright);
  font-size: 18px;
  flex-shrink: 0;
}
```
