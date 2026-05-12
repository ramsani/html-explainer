# HTML UX Standard

This standard turns the HTML effectiveness idea into concrete product rules.

The goal is not a prettier answer. The goal is a better thinking surface.

## Core promise

Every generated HTML artifact must help the user do at least one of these faster than Markdown:

- compare options;
- inspect evidence;
- understand a structure;
- feel an interaction;
- tune a decision;
- export a usable result;
- re-enter a project;
- decide the next action.

If none of those are true, do not generate HTML.

The artifact must make the browser earn its keep. If the same value fits in a short Markdown answer, use Markdown.

## First-screen contract

Within the first screen, the artifact must answer:

- what this is;
- who it is for;
- what primary intent it answers;
- which obvious secondary intents it covers;
- what base concept makes the issue simple;
- what decision it supports;
- what evidence was inspected;
- what the user should do next.
- what mental work the HTML removes.

Do not hide the recommendation below decorative sections.

The first screen should create relief. The user should see the shape of the answer before reading every detail.

## Artifact fit

Use the form that matches the work:

- alternatives -> side-by-side comparison;
- plan -> timeline, dependency map, risk table;
- diff -> annotated file review and behavior before/after;
- module understanding -> map with entry points and hot paths;
- design system -> swatches, type scale, states;
- prototype -> clickable flow with visible state changes;
- workflow -> flowchart with happy path and failure paths;
- research -> criteria matrix with source quality;
- incident -> timeline, impact, cause, prevention;
- editor -> controls, validation, preview, export.

Do not build a generic dashboard when one precise surface would work.

## Ease and clarity rules

The artifact should reduce the user's mental assembly work.

Required:

- distill the base concept to one sentence or one visible model;
- make the primary action obvious;
- show secondary intents as support, not as competing sections;
- include one "surprising ease" element when useful: export, checklist, side-by-side view, risk map, filter, or copy-ready output.
- keep the chosen artifact budget visible: compact, standard, or interactive.

Do not create delight through decoration. Create it by removing work from the user's head.

## Evidence UX

Evidence must be visible, not buried.

Required:

- Sources inspected.
- Verified facts.
- Inferences.
- Unknowns.
- Risk-bearing claims.
- Minimum validation.

The artifact may look polished only after the evidence is clear.

## Interaction rules

Interaction must reduce thinking work.

Use controls only when the user can change something meaningful:

- filter;
- sort;
- expand;
- compare;
- simulate;
- tune;
- copy or export.

Every interactive editor must include an exportable result:

- Markdown;
- JSON;
- config;
- prompt;
- issue body;
- checklist;
- plan.

No export means the editor is incomplete.

## Visual quality rules

Use visual hierarchy to make decisions easier.

Required:

- readable contrast;
- clear section order;
- useful navigation when there are four or more sections;
- responsive layout for mobile;
- semantic headings;
- tables for tabular data;
- stable spacing and no overlapping text;
- color meaning that is explained by labels, not color alone.

Avoid:

- decorative charts;
- repeated prose in cards;
- dense panels with no scan path;
- generic dark dashboards;
- one-color themes;
- tiny diagrams without zoom or details;
- animations that do not support comprehension.

## State rules for prototypes and tools

User-facing artifacts must show the states that matter:

- default;
- empty;
- loading or pending when relevant;
- error or invalid;
- success or exported.

If the artifact is a prototype, it must be clickable enough to test the main friction.

If the artifact is a report, it must make the next action obvious.

## Thariq alignment checklist

The artifact is aligned with the HTML effectiveness approach when:

- it replaces a wall of text with a readable surface;
- it uses the browser as the medium, not as decoration;
- it makes spatial, visual, or interactive structure visible;
- it keeps the user in the loop;
- it produces a reusable output when the user manipulates state;
- it is self-contained and easy to open;
- it exposes uncertainty instead of hiding it.

## Hard fail conditions

Fail the artifact if it:

- does not improve the decision over Markdown;
- costs more attention than it saves;
- does not answer the primary intent directly;
- ignores obvious secondary intents that affect the decision;
- does not distill the base concept;
- hides evidence or uncertainty;
- has no visible recommendation or next action;
- uses interaction with no useful outcome;
- creates an editor with no export;
- is unreadable on mobile;
- depends on external assets without a clear reason;
- uses beauty to compensate for weak analysis.
