# Actionable Knowledge Base

The artifact memory system should not become a passive archive. It should become a local, searchable, multi-explorable, action-oriented knowledge base built from generated HTML artifacts and their metadata.

## Intent

Turn saved `html-explainer` artifacts into fast reusable knowledge.

The user should be able to answer quickly:

- What do we know?
- Where did that knowledge come from?
- Is it still valid?
- What does it affect?
- What should I open next?
- What should I do next?
- Which artifact replaces this one?
- Which old artifact is still valuable?

## Core Model

```text
artifact -> metadata -> knowledge card -> relation graph -> search facets -> action queue -> re-entry prompt
```

This model keeps the raw artifact available, but it does not force the user to reopen every HTML file to recover value.

## Zero-Friction Promise

The user should not classify, tag, link, index, or remember folders.

When an artifact is approved and saved, the system should automatically save the HTML, write metadata, update backlinks, refresh Maps of Content, update the resurfacing queue, create an annotation sidecar, and regenerate the local `index.html` explorer.

The user-facing receipt should stay small:

```text
Saved for later: <topic>
Find it fast: "<natural phrase>"
Open knowledge base: ~/.claude/html-explainer/outputs/index.html
```

## Distinction From Archive

An archive stores files.

A knowledge base helps the user decide, locate, compare, reuse, refresh, and act.

The explorer should therefore surface:

- durable insights;
- current decisions;
- stale or risky knowledge;
- related artifacts;
- supersession chains;
- action prompts;
- review triggers;
- confidence and evidence boundaries.

## Knowledge Card

Every indexed artifact should be reducible to a short knowledge card.

A knowledge card is the fast-reference layer shown before opening the full HTML artifact.

Recommended fields:

```json
{
  "artifact_id": "",
  "title": "",
  "one_line_value": "",
  "knowledge_type": "decision | map | review | prompt | workflow | research | principle | status | incident | design",
  "current_use": "reuse | refresh | supersede | compare | inspect | ignore | private-review",
  "validity": "temporal | replaceable | evergreen | superseded | private | do-not-reuse",
  "freshness_risk": "low | medium | high | unknown",
  "confidence": "low | medium | high | unknown",
  "evidence_basis": "",
  "known_limits": [],
  "next_best_action": "",
  "reentry_prompt": "",
  "tags": []
}
```

## Knowledge Types

Use `knowledge_type` to describe what reusable value the artifact contains.

Recommended values:

| Type | Use when the artifact preserves... |
|---|---|
| `decision` | A recommendation, trade-off, or selected direction. |
| `map` | Architecture, repo, module, workflow, or process understanding. |
| `review` | Diff, PR, plan, quality, or risk review. |
| `prompt` | Prompt, agent, skill, rubric, or instruction behavior. |
| `workflow` | Sequential process, automation, n8n flow, deployment, or operations path. |
| `research` | Comparison, vendor/tool analysis, external-source synthesis. |
| `principle` | Durable concept, model, heuristic, or quality standard. |
| `status` | Time-bound project or milestone state. |
| `incident` | Failure, regression, postmortem, or recovery analysis. |
| `design` | Visual direction, UI state, design tokens, or UX exploration. |

## Relation Model

Artifacts should support explicit relationships beyond simple supersession.

Recommended relation types:

```text
supersedes
superseded_by
related_to
derived_from
supports
contradicts
updates
blocks
unblocks
applies_to
same_project
same_decision
same_evidence
same_pattern
follow_up_to
```

Each relation should be represented as a lightweight edge:

```json
{
  "from": "artifact-a",
  "to": "artifact-b",
  "type": "updates",
  "reason": "New artifact reviews the same repo after the pattern system changed."
}
```

## Multi-Explorable Views

The explorer should support multiple ways to enter the same knowledge base.

Minimum future views:

### By next action

Show artifacts grouped by what the user should do:

- open now;
- refresh;
- supersede;
- reuse;
- compare;
- ignore;
- private review.

### By project

Show artifacts related to the same repo, client, product, workflow, or initiative.

### By knowledge type

Show decisions, maps, reviews, prompts, workflows, research, principles, status reports, incidents, and design artifacts.

### By freshness

Show current, review-soon, stale, high-risk, and superseded artifacts.

### By validity

Show temporal, replaceable, evergreen, superseded, private, and do-not-reuse artifacts.

### By pattern

Show which `html-explainer` pattern produced the artifact.

### By evidence

Show artifacts that inspected the same repo, commit, file, source, workflow, or external reference.

### By relation graph

Show chains such as:

```text
initial repo map -> repo recap -> refreshed architecture map -> current implementation plan
```

### Maps of Content

Generate lightweight topic hubs from tags and topics. Each MOC should show current pages, pages that need review, superseded history, and a prompt to continue the theme.

### Backlinks

Every artifact card should show incoming and outgoing relationships. Backlinks may be explicit from metadata or inferred from shared project, tag, pattern, source, or supersession chain.

### Resurfacing

The explorer should bring back old knowledge when it becomes useful again. The first local score can use freshness risk, validity class, age, next action presence, known limits, and previous resurface count.

### Annotations

Annotations should not modify the original HTML. Store notes, highlights, and review decisions beside metadata so the original artifact remains traceable.

## Search Facets

Search should cover more than title.

At minimum, searchable fields should include:

- title;
- summary;
- one-line value;
- project;
- artifact type;
- knowledge type;
- pattern;
- tags;
- validity;
- freshness risk;
- confidence;
- source context;
- key decisions;
- known limits;
- next action;
- handoff prompt.

Future search may include extracted text from HTML artifacts, but the first implementation can search metadata and knowledge cards.

## Action Queue

A knowledge base should produce actions, not only search results.

Recommended action values:

```text
open
reuse
refresh
supersede
compare
extract-issue
turn-into-checklist
open-related
audit
archive-private
ignore
```

Each artifact should be able to expose a recommended action and a copy-ready prompt.

Example:

```json
{
  "recommended_action": "refresh",
  "reason": "The artifact is temporal and its source context may have changed.",
  "prompt": "/reenter-project refresh this artifact using the current repo state..."
}
```

## Truth And Confidence Model

The knowledge base must avoid treating all saved artifacts as equal truth.

Each artifact should distinguish:

- verified fact;
- supported inference;
- assumption;
- hypothesis;
- historical output;
- stale claim;
- evergreen principle.

Recommended confidence values:

```text
high
medium
low
unknown
```

Confidence should be based on evidence quality, freshness, and whether the artifact explicitly separates facts, inferences, assumptions, and unknowns.

## Current Knowledge vs Historical Knowledge

The explorer must make it obvious whether an artifact is current reference or historical record.

Suggested display rules:

- current artifacts appear first;
- evergreen artifacts are marked reusable;
- temporal artifacts show review warnings;
- superseded artifacts remain findable but visually de-emphasized;
- private artifacts are clearly local-only;
- do-not-reuse artifacts are hidden by default.

## Re-Entry Contract

A future agent should be able to use a knowledge card without opening the full artifact first.

A good re-entry prompt should carry:

- original intent;
- artifact title and ID;
- source context;
- validity class;
- freshness risk;
- confidence;
- known limits;
- relation to newer or older artifacts;
- requested decision: reuse, refresh, supersede, compare, or ignore.

Template:

```text
Use artifact <id> as local context. First inspect its metadata and knowledge card. Decide whether to reuse, refresh, supersede, compare, or ignore it. Preserve its original intent, source context, known limits, confidence, freshness risk, and relation links. If generating a replacement, update supersedes/superseded_by metadata.
```

## Explorer First-Screen Requirement

The first screen should answer:

```text
What should I trust, what should I review, and what should I do next?
```

It should not begin with a large undifferentiated list of files.

Recommended first-screen blocks:

- recommended artifact to open now;
- artifacts needing review;
- evergreen references;
- stale/superseded warning count;
- private/local-only count;
- next best prompt.

## File-Based Index Expansion

The local `index.json` can evolve to include these sections:

```json
{
  "schema_version": "0.2.0",
  "generated_at": "",
  "output_root": "~/.claude/html-explainer/outputs",
  "artifacts": [],
  "knowledge_cards": [],
  "relations": [],
  "facets": {
    "projects": [],
    "knowledge_types": [],
    "patterns": [],
    "tags": [],
    "actions": [],
    "freshness": []
  },
  "review_queue": [],
  "current_references": [],
  "mocs": []
}
```

`scripts/rebuild-knowledge-base.py` generates this expanded index and the local `index.html` explorer from saved metadata.

## Minimum Viable Knowledge Base

The minimum viable local knowledge base is:

- `index.json` with artifact entries;
- sidecar metadata files;
- knowledge-card fields in metadata or index;
- static explorer page;
- filters by project, validity, freshness, and search text;
- recommended re-entry prompt;
- visible current/stale/private/superseded distinction.
- automatic explorer regeneration after saving;
- Maps of Content from topics/tags;
- local resurfacing queue;
- backlinks and related links;
- annotation surface that does not mutate the original HTML.

## Strong Knowledge Base

A stronger future version adds:

- extracted text search;
- relation graph;
- review queue;
- action queue;
- current reference set;
- project spaces;
- Obsidian markdown index;
- issue extraction;
- local-only semantic search;
- artifact quality score;
- stale detection based on repo commits, dates, and source context.

## Acceptance Criteria

The artifact memory system can be called an actionable knowledge base only when:

- artifacts are findable by more than filename;
- each artifact has a quick-reference knowledge card;
- each artifact exposes a recommended action;
- freshness and confidence are visible;
- temporal and superseded knowledge cannot be mistaken for current truth;
- related artifacts can be discovered;
- re-entry prompts preserve enough context for a future agent;
- private artifacts are visibly protected;
- the explorer helps the user decide what to trust, open, refresh, or reuse.
