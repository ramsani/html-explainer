# User In The Loop

Intent: make HTML artifacts keep the user involved in decisions instead of letting the agent silently choose everything.

This is the core workflow lesson from the HTML effectiveness argument.

## Core idea

Markdown often fails because users stop reading long plans, specs, and reviews.

When the user stops reading, the agent keeps making choices alone.

A good HTML artifact should reverse that:

- easier to open;
- easier to scan;
- easier to click through;
- easier to challenge;
- easier to share;
- easier to turn into the next prompt.

## Loop contract

Every serious artifact should answer:

```text
What choice is the user being invited back into?
What can they inspect without reading everything?
What can they change, filter, compare, or export?
What next prompt or action does this artifact make easier?
```

If the artifact does not invite review, choice, or action, it may still be correct but it is not doing the best HTML work.

## Readability economics

HTML can cost more to generate than Markdown.

That cost is justified when it increases the chance the user or teammate actually reads and uses the artifact.

Use HTML when it turns:

- a wall of text into a visual decision;
- a hidden structure into a diagram;
- a difficult choice into side-by-side options;
- an awkward text request into a small editor;
- a plan into a reviewable workflow;
- a PR into an annotated review surface.

Do not use HTML when the user would get the same value from a short answer.

## Claude Code advantage

HTML artifacts are strongest when they are informed by real local context:

- filesystem;
- source files;
- git history;
- diffs;
- tests;
- docs;
- generated HTML artifacts already in the repo;
- MCP sources such as Slack, Linear, GitHub, or browser context when available and relevant.

The artifact should not be generic. It should be grounded in the user's real work.

## Custom editor rule

Use a throwaway HTML editor when text is a poor way to express the decision.

Good use cases:

- reorder tickets;
- tune animation values;
- adjust feature flags;
- edit JSON/YAML/config with constraints;
- tune prompts with live examples;
- tag or approve dataset rows;
- annotate a transcript or diff;
- choose visual values such as colors, easing curves, crops, cron schedules, or regexes.

Every editor must end with a copy/export button.

## Shareability rule

For specs, plans, PR writeups, reports, and recaps, assume the artifact may be opened by someone outside the chat.

Include:

- a plain-language summary;
- anchors or navigation;
- visual explanation;
- evidence inspected;
- unknowns;
- next action.

## Hard fails

Revise the artifact if:

- it is technically correct but unlikely to be read;
- it hides the user's actual choice;
- it does not invite inspection, comparison, editing, or approval;
- it could not help another person understand the state without the chat;
- it produces an editor without copy/export;
- it ignores real local context and feels generic.
