# Thariq HTML Effectiveness — 20 Case Library

This library converts the 20 HTML effectiveness examples into operational guidance for agents.

Use it to select the right artifact type and to avoid the main failure mode: generating visually attractive HTML that does not improve understanding or decision quality.

## Category 1 — Exploration and planning

The core idea: planning work is comparative and spatial. Markdown makes alternatives look sequential, even when the real decision requires side-by-side trade-offs, timelines, dependencies, and blast radius.

### 01. Code approach comparison

Intent: compare multiple implementation approaches before choosing.

Use when: the user asks how to implement something, there are several plausible paths, or the wrong architectural choice would create rework.

HTML should include:

- problem statement
- alternatives side by side
- trade-offs
- complexity
- files likely affected
- risks
- recommendation
- when not to choose each option

Avoid:

- declaring a winner without evidence
- hiding assumptions
- comparing vibes instead of constraints

### 02. Visual implementation plan

Intent: turn a selected approach into an executable plan.

Use when: the next step may be implementation by an agent.

HTML should include:

- goal
- staged plan
- dependency order
- files to inspect or change
- validation points
- rollback path
- definition of done

Avoid:

- implementation before plan validation
- plans that do not map to real files
- broad refactors disguised as small tasks

## Category 2 — Code review and understanding

The core idea: diffs, call graphs, and impact maps are spatial. A normal diff is linear, but the reviewer needs a map of risk and intent.

### 03. Annotated PR / diff review

Intent: make a change reviewable.

Use when: code has already changed, a PR exists, or the user wants to decide whether to accept work.

HTML should include:

- diff summary
- changed files
- severity-coded findings
- inline annotations when useful
- tests reviewed
- blast radius
- release risk
- accept / request changes recommendation

Avoid:

- reviewing only filenames
- praising implementation style without checking behavior
- saying tests pass if not verified

### 04. Module map

Intent: understand a code area before touching it.

Use when: the repo or module is unfamiliar.

HTML should include:

- entry points
- internal components
- data flow
- imports and dependencies
- hot paths
- ownership boundaries
- gotchas

Avoid:

- mapping the whole repo when only one module matters
- confusing folder structure with runtime behavior

## Category 3 — Design systems and UI surfaces

The core idea: design is inherently visual. Tokens, states, variants, spacing, and component relationships are poorly represented in plain text.

### 05. Design token contact sheet

Intent: expose the real visual language of a project.

Use when: before UI changes, redesigns, theming, or consistency audits.

HTML should include:

- colors
- typography
- spacing
- radii
- shadows
- components using each token
- inconsistencies

Avoid:

- proposing new styles before reading existing ones
- inventing a design system that the repo does not have

### 06. Component state matrix

Intent: show UI components across states and variants.

Use when: reviewing buttons, cards, inputs, empty states, forms, dashboards, or navigation.

HTML should include:

- component variants
- normal / hover / disabled / loading / error states when applicable
- responsive considerations
- accessibility notes
- implementation references

Avoid:

- static mockups that ignore state
- pretty components that do not match the repo constraints

## Category 4 — Prototyping

The core idea: some UX decisions cannot be judged from text. They need a working miniature.

### 07. Interactive flow prototype

Intent: let the user feel a flow before implementation.

Use when: the decision involves clicks, transitions, progressive disclosure, or form flow.

HTML should include:

- clickable states
- state transitions
- visible user path
- edge states
- notes on implementation cost

Avoid:

- prototypes that look final but are not technically grounded
- adding interactions that are outside the actual product scope

### 08. Animation or microinteraction sandbox

Intent: evaluate motion, timing, visibility, and feedback.

Use when: loading states, onboarding, confirmation, drag/drop, collapse/expand, or feedback loops matter.

HTML should include:

- controls for speed/state when useful
- before/after comparison
- reduced-motion consideration
- implementation notes

Avoid:

- animation as decoration
- motion that slows task completion

## Category 5 — Diagrams and systems

The core idea: systems are relationships. HTML/SVG/Mermaid can show structure, failure points, and flow better than prose.

### 09. Architecture diagram

Intent: make system structure visible.

Use when: backend/frontend boundaries, services, queues, agents, workflows, or APIs are involved.

HTML should include:

- components
- data flow
- trust boundaries
- external dependencies
- failure points
- ownership and responsibility

Avoid:

- architecture diagrams based only on README
- boxes with no operational meaning

### 10. Process / workflow flowchart

Intent: explain a procedural system.

Use when: n8n workflows, deploy flows, auth flows, payment flows, issue pipelines, or agent orchestration are involved.

HTML should include:

- trigger
- steps
- decisions
- success path
- failure path
- retries / idempotency
- logs or validation points

Avoid:

- hiding error paths
- treating sequential diagrams as proof of correctness

## Category 6 — Decks

The core idea: some outputs are for alignment, not just personal understanding. HTML can act as a lightweight deck.

### 11. Technical decision deck

Intent: present a recommendation clearly.

Use when: the user needs to communicate a decision, trade-off, or plan.

HTML should include:

- thesis
- context
- alternatives
- evidence
- decision
- implications
- next steps

Avoid:

- sales-style slides with weak evidence
- more visual polish than substance

### 12. Project progress deck

Intent: summarize state for review.

Use when: weekly review, milestone review, handoff, or reentry.

HTML should include:

- what changed
- what is working
- what is blocked
- risk list
- next decisions
- links or paths to evidence

Avoid:

- status theater
- hiding open questions

## Category 7 — Research and learning

The core idea: explanations improve when concepts, examples, and relationships are visible.

### 13. Concept explainer

Intent: teach a technical or product concept.

Use when: the user needs understanding, not just instructions.

HTML should include:

- simple model
- deeper model
- examples
- counterexamples
- diagrams
- common mistakes

Avoid:

- generic tutorials unrelated to the user's context

### 14. Research comparison map

Intent: compare sources, approaches, or tools.

Use when: choosing libraries, frameworks, products, architectures, or workflows.

HTML should include:

- comparison matrix
- source quality
- assumptions
- constraints
- recommendation by use case

Avoid:

- ranking without criteria
- mixing outdated and current information without dates

## Category 8 — Reports

The core idea: reports are not just summaries. Good reports support diagnosis, accountability, and next action.

### 15. Incident / postmortem report

Intent: understand failure and prevent recurrence.

Use when: bug, outage, regression, broken workflow, failed agent run, or production incident occurs.

HTML should include:

- timeline
- impact
- root cause candidates
- confirmed facts
- unknowns
- immediate mitigation
- prevention actions

Avoid:

- blame
- false certainty
- skipping the timeline

### 16. Audit report

Intent: assess a repo, workflow, prompt, or system against criteria.

Use when: the user asks for serious review.

HTML should include:

- rubric
- evidence
- score or severity
- gaps
- recommended changes
- do-not-change list

Avoid:

- superficial structure review
- unweighted laundry lists

### 17. Project recap

Intent: re-enter context quickly.

Use when: returning to a repo or project after time away.

HTML should include:

- current identity of the project
- architecture
- recent activity
- important decisions
- open risks
- next best action

Avoid:

- summarizing README only
- ignoring git activity

## Category 9 — Custom editors

The core idea: sometimes the right artifact is not a report but a small temporary tool.

### 18. Ticket triage board

Intent: help sort work by value, risk, urgency, or dependency.

Use when: there are many issues, features, bugs, or agent tasks.

HTML should include:

- draggable or filterable cards when possible
- scoring criteria
- exportable result
- grouping by priority

Avoid:

- non-exportable UI
- making the board more complex than the work

### 19. Feature flag / config editor

Intent: safely reason about configuration states.

Use when: feature flags, environment options, workflow settings, user segments, or permissions interact.

HTML should include:

- controls
- resulting config preview
- invalid state warnings
- export/copy output

Avoid:

- editor that cannot produce usable config
- hiding dangerous combinations

### 20. Prompt / agent behavior tuner

Intent: tune agent instructions or prompts with visible trade-offs.

Use when: designing agents, skills, rubrics, or issue templates.

HTML should include:

- input areas
- behavior dimensions
- expected outputs
- failure modes
- final exportable prompt

Avoid:

- vague personality sliders
- tuning for style without operational criteria

## Final selection rule

Choose the artifact that makes the hidden structure visible with the least complexity.

If HTML does not improve decision quality, do not generate it.
