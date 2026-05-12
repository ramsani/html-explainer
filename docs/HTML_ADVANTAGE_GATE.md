# HTML Advantage Gate

Use this before generating any artifact.

HTML must be better than Markdown point by point. If it is only prettier, it fails.

## The four advantages

A generated HTML artifact must provide at least one strong advantage and should name it explicitly.

### 1. Interaction removes manual work

Markdown shows. HTML can filter, sort, search, toggle, simulate, and export.

Use HTML when interaction removes work such as:

- filtering risks by severity;
- sorting tickets by priority, type, and size;
- searching commands by keyword;
- toggling a diff between touched files and full context;
- changing prompt/config inputs and seeing the output update.

If controls do not change what the user sees, decides, or exports, they are decoration.

### 2. Structure becomes visible

Markdown describes relationships. HTML should make them visible.

Use HTML when the user would otherwise reconstruct:

- plan sequence and dependencies;
- critical path;
- architecture boundaries;
- failure paths;
- incident timeline;
- comparison trade-offs;
- UI states.

If the same understanding is equally easy in Markdown, use Markdown.

### 3. A concrete output is produced

When an artifact has controls, the output is the product.

Examples:

- prompt tuner -> final prompt;
- feature flag editor -> JSON config;
- ticket triage -> prioritized list;
- decision tool -> documented decision;
- project recap -> reentry checklist.

If an interactive artifact cannot export or copy a useful result, it fails.

### 4. The first screen decides in 5 seconds

The first screen is what the user sees before scrolling.

It must answer:

- what this is;
- why it exists;
- what decision it supports;
- what the main recommendation is;
- what to do next.

If the user must hunt for the purpose, recommendation, or next action, the artifact fails.

## Required gate output

Before generating HTML, state:

```text
HTML advantage:
Markdown would force the user to:
HTML will let the user:
5-second first screen:
Output produced:
Decision:
```

`Decision` must be one of:

```text
Use Markdown
Use compact HTML
Use standard HTML
Use interactive HTML
```

## Project Recap special rule

A project recap must be more than a prettier README.

A strong recap should provide at least one of these:

- searchable/filterable entry points;
- pattern or command explorer;
- clickable sections with details collapsed by default;
- exportable reentry checklist;
- current-vs-previous state comparison when history exists;
- risk map that makes safe and unsafe zones obvious.

If the recap only reorganizes README content, use compact HTML or Markdown.

## Visual exploration special rule

A visual exploration must be more than "four pretty cards."

It must compare live directions by:

- tone;
- density;
- primary action clarity;
- state fit;
- light/dark resilience when relevant;
- accessibility risk;
- best-use context.

The HTML advantage is that the user can compare real rendered alternatives instead of imagining them from prose.

If the alternatives are only color/style swaps, revise or use Markdown.

## Hard fail conditions

Fail or shrink the artifact if:

- it does not name the HTML advantage;
- it has controls that do not change useful state;
- it has controls but no exportable output;
- it needs scrolling before the user knows the main recommendation;
- it mostly reproduces Markdown sections as cards;
- it is more expensive to generate/read than the decision deserves.
