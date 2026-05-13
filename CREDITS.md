# Credits and attribution

`html-explainer` is an independent Claude Code skill and installer that combines two prior contributions into a practical workflow layer.

## Visual Explainer

- Project: `visual-explainer`
- Creator: Nico Bailon
- Repository: https://github.com/nicobailon/visual-explainer

`visual-explainer` is credited as the upstream implementation foundation for rich HTML artifacts in agent workflows.

`html-explainer` can install `visual-explainer` and then adds additional Claude Code commands, selection rules, fact-sheet discipline, and a 21-pattern operating library.

This repository is not a fork unless explicitly changed in GitHub metadata. It is a complementary installer and skill layer.

## HTML effectiveness approach

- Author: Thariq S. Bate
- Work: "The unreasonable effectiveness of HTML"
- Site: https://thariqs.github.io/html-effectiveness/

Thariq's work is credited as the conceptual approach behind the pattern library: HTML as a better medium for many agent outputs because it can represent visual hierarchy, comparison, interactivity, spatial structure, and decision context better than flat Markdown.

`html-explainer` does not copy the examples as product output. It operationalizes the approach into reusable agent patterns, such as plan reviews, diff reviews, architecture maps, project recaps, triage boards, design-system inspections, prototypes, reports, and prompt tuners.

## Skills for real engineers

- Author: Matt Pocock
- Project: `skills`
- Repository: https://github.com/mattpocock/skills

Matt Pocock's skills repo is credited as an inspiration for the next-step prompt discipline in `html-explainer`: small composable skills, durable work briefs, shared language, vertical slices, feedback loops, behavioral contracts, acceptance criteria, and explicit scope boundaries.

`html-explainer` does not copy Matt's skills as product output. It adapts the engineering style into `docs/SENIOR_CHAINED_PROMPTS.md`, which helps generated HTML artifacts end with next prompts that another capable agent can execute without losing the user's original intent.

## This project

- Project: `html-explainer`
- Maintainer: Ramón Sandoval / `ramsani`
- Repository: https://github.com/ramsani/html-explainer

This project contributes:

- safe installation workflow;
- Claude Code skill layer;
- slash commands;
- 21-pattern operating library;
- fact-sheet protocol;
- pattern selection guide;
- explicit rules for evidence-first HTML generation.
- senior chained prompt discipline for intent-led follow-up work.
- expert prompt gates distilled from staged app-generation practice.

## Independence notice

This project is not officially affiliated with, endorsed by, sponsored by, or maintained by Nico Bailon, Thariq S. Bate, or Matt Pocock.

The purpose of this file is to give clear credit and make the relationship between the projects transparent.
