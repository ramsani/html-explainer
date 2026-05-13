# Visual Explainer Playbook

Intent: make every pattern use HTML as a visual thinking surface, not a styled Markdown report.

Use this with every pattern file.

## Core rule

Each HTML artifact must include one primary visual model that makes the idea easier to understand than prose.

Tables can support the artifact. A table alone is not enough unless the task is truly tabular.

## Pattern visual contracts

| Pattern | Primary visual model | Useful interaction | First-screen answer | 10x over Markdown |
|---|---|---|---|---|
| 01 Code approach comparison | Side-by-side option map with trade-off bars | Toggle constraints or expand risks | Which approach should I choose? | Prevents comparing options from scattered prose |
| 02 Visual implementation plan | Phase timeline with dependency arrows | Expand phase details, copy checklist | Can this plan be approved? | Makes sequence, risk, and validation visible together |
| 03 Annotated PR / diff review | Decision ladder plus file-risk map | Filter findings by severity/file | Accept, fix, verify, split, or share? | Turns raw diff into decision surface |
| 04 Module map | System/module graph with entry points | Highlight paths or expand modules | Where do I edit safely? | Shows relationships that Markdown flattens |
| 05 Design token reference sheet | Token/contact sheet plus component examples | Toggle light/dark, copy tokens | What style already exists? | Makes taste visible instead of described |
| 06 Component state matrix | State grid across variants | Toggle viewport or state group | Is this UI complete? | Reveals missing states quickly |
| 07 Interactive flow prototype | Clickable flow with visible state changes | Click through main path | Does this flow reduce friction? | Lets the user feel the workflow |
| 08 Microinteraction sandbox | Before/after animation lab | Sliders for duration/easing/state | Which motion feels right? | Turns timing into something tunable |
| 09 Architecture diagram | Data-flow and boundary map | Toggle layers or failure paths | What talks to what, and where is risk? | Makes hidden dependencies visible |
| 10 Process/workflow flowchart | Happy path plus failure/retry paths | Toggle success/failure view | Where can this process break? | Shows operational paths at once |
| 11 Technical decision deck | Slide-like decision narrative | Section navigation | What decision should stakeholders align on? | Makes the argument shareable |
| 12 Project progress deck | Milestone/status timeline | Filter by risk or owner | Are we on track and what blocks us? | Separates progress from status theater |
| 13 Concept explainer | Simple model -> deeper model -> examples | Reveal layers or examples | What is the concept and how do I apply it? | Teaches with structure, not walls of text |
| 14 Research comparison map | Criteria matrix with source confidence | Filter by use case | Which option fits this context? | Prevents rankings without criteria |
| 15 Incident report | Timeline plus cause/prevention map | Toggle confirmed vs inferred | What failed and what prevents it? | Separates facts from hypotheses visually |
| 16 Audit report | Scorecard plus gap map | Filter issues by severity | What must be fixed first? | Makes priorities visible |
| 17 Project recap | Orientation map plus reentry path | Search entry points or copy checklist | What is this repo and what do I do next? | Restores context without rereading everything |
| 18 Ticket triage board | Now/Next/Later/Cut board | Drag/filter/sort and export | What should we do first? | Turns backlog into a decision tool |
| 19 Feature/config editor | Form with dependency graph and output diff | Toggle flags and copy diff | Which config is valid? | Prevents invalid combinations |
| 20 Prompt/agent tuner | Side-by-side prompt editor with scenario previews | Adjust dimensions and copy final prompt | What instruction should I use? | Makes prompt trade-offs visible |
| 21 Visual direction explorer | Live alternatives grid | Compare/toggle surfaces | Which visual direction should we choose? | Lets the user choose by seeing, not imagining |

## First-screen model

The first screen should show:

- the plain-language answer;
- the primary visual model;
- the recommendation;
- the highest risk or uncertainty;
- the next action.

If the first screen is mostly metadata, revise it.

## Interaction rule

Use interaction only when it changes understanding or produces output:

- filter;
- sort;
- expand;
- compare;
- toggle;
- simulate;
- tune;
- drag;
- copy/export.

No decorative interaction.

## Visual forms to prefer

- decision ladder;
- before/after model;
- risk map;
- file-risk heatmap;
- system map;
- flowchart;
- state matrix;
- timeline;
- option grid;
- storyboard;
- scorecard;
- editor with live preview;
- copy/export block.

## Hard fails

Revise the artifact if:

- it is mostly cards of prose;
- it uses only a table where a map, flow, matrix, or comparison would explain faster;
- the primary visual does not answer the user's main decision;
- interaction does not change state or export output;
- the first screen looks like a technical checklist instead of an explanation.
