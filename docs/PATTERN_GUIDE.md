# Pattern Guide

Use this to choose one primary artifact pattern.

## Routing Table

| Signal | Pattern |
|---|---|
| 2+ implementation options | 01 Code approach comparison |
| Plan before code | 02 Visual implementation plan |
| Diff, PR, patch, changed files | 03 Annotated PR / diff review |
| Understand one repo area | 04 Module map |
| Tokens, theme, styling | 05 Design token reference sheet |
| UI variants or component states | 06 Component state matrix |
| Click flow or friction | 07 Interactive flow prototype |
| Motion, timing, feedback | 08 Microinteraction sandbox |
| Services, APIs, agents, data flow, boundaries | 09 Architecture diagram |
| Sequential workflow, deploy, automation, n8n | 10 Process / workflow flowchart |
| Stakeholder decision | 11 Technical decision deck |
| Progress or milestone update | 12 Project progress deck |
| Teach a concept | 13 Concept explainer |
| Compare tools or vendors | 14 Research comparison map |
| Incident, regression, failure | 15 Incident / postmortem report |
| Audit against standards | 16 Audit report |
| Reenter repo/project | 17 Project recap |
| Sort many tasks/issues/features | 18 Ticket triage board |
| Config, flags, settings, permissions | 19 Feature flag / config editor |
| Prompt, agent behavior, rubric, skill | 20 Prompt / agent behavior tuner |
| Visual direction or UI tone options | 21 Visual direction explorer |
| Think through a topic, idea, strategy, risk, or unclear decision | 22 Insight Surface Loop |

## Tie-Breakers

- If the user asks "what should I do?", prefer comparison, plan, recap, audit, or triage.
- If the user asks "is this safe?", prefer plan review, diff review, architecture, workflow, or incident.
- If the user must manipulate values, prefer editor, triage board, tuner, or prototype.
- If the user must choose look and feel, prefer visual direction explorer.
- If future HTML must match product taste, create design token reference first.
- If the user is still forming the question or conclusion, prefer Insight Surface Loop.

## Minimum Viable Pattern

Every pattern must contain:

- evidence required;
- prompt template;
- HTML structure;
- at least 5 quality checks;
- at least 3 failure modes;
- at least 1 tie-breaker or "do not use when" rule;
- acceptance criteria;
- human interface contract;
- visual explainer contract.

## Use Pattern Files

After routing, open the matching file under `patterns/`.

Do not rely only on the table. The pattern file carries the evidence, structure, failure modes, and acceptance criteria.

## Human Interface Contract

Every pattern must apply `docs/HUMAN_INTERFACE.md`.

The artifact must show the user one recommended next move and a small set of optional actions. It should invite deeper functions such as compare, review, think this through, save, or continue only when they help the user's intent.

## Diagram Type Selection

When a pattern calls for a Mermaid diagram, use this table to select the right syntax.

| You want to show... | Use | Syntax keyword |
|---|---|---|
| Process flow, decisions, pipelines | Flowchart | `graph TD` / `graph LR` |
| Request/response, API calls, temporal interactions | Sequence diagram | `sequenceDiagram` |
| Database tables and relationships | ER diagram | `erDiagram` |
| OOP classes, domain models with methods | Class diagram | `classDiagram` |
| System architecture at multiple zoom levels | C4-style | `graph TD` + `subgraph` (not native `C4Context`) |
| State transitions, lifecycles | State diagram | `stateDiagram-v2` |
| Hierarchical breakdowns, brainstorms | Mind map | `mindmap` |

### When to Use Mermaid vs. CSS

**Use Mermaid** for: complex graphs with 8+ nodes, branching paths, cycles, multiple edge crossings — anything where automatic edge routing saves real effort.

**Use CSS** for: simple linear flows (A → B → C sequences), build steps, deployment stages. CSS cards give full control over sizing and typography.

**Rule of thumb**: if the diagram has more than one row of nodes or any branching, use `flowchart TD`. The extra vertical space makes labels readable.

**Max 10-12 nodes per diagram.** Beyond that, split across diagrams or use a hybrid approach: a simple 5-8 node overview + CSS Grid cards with detailed breakdowns.

### Layout Direction: TD vs. LR

- **TD (top-down)**: almost always better. Uses vertical space, labels stay readable.
- **LR (left-to-right)**: only for simple linear flows with 3-4 nodes and no branching.

If a diagram has more than one row or any branching, default to `TD`.

### Mermaid Gotchas

- **Never set `color:` in classDef or per-node style.** It hardcodes text color that breaks in the opposite color scheme. Let CSS overrides handle text color via `var(--text)`.
- **Use semi-transparent fills (8-digit hex) for node backgrounds.** They layer over Mermaid's base theme, producing a tint that works in both light and dark modes.
- **Quote labels with special characters.** Parentheses, colons, commas, brackets, and ampersands break the parser when unquoted.
- **Use `<br/>` for line breaks in flowchart labels**, not `\n`.
- **Sequence diagram messages must be plain text.** Curly braces, square brackets, angle brackets, and `&` silently break the parser.
- **Max 10-12 nodes.** Beyond that, readability collapses even with zoom controls. Split the diagram.

### Dark Mode with Mermaid

Mermaid initializes once at load time and cannot reactively switch themes. Read `prefers-color-scheme` inside the `<script type="module">` block and pick light or dark values accordingly:

```javascript
const isDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
// Use isDark to pick light or dark themeVariables values
```

CSS overrides on `.mermaid .nodeLabel` and `.mermaid .edgeLabel` using `var(--text)` and `var(--text-dim)` will still respond to color scheme changes — only the SVG internals are static.
