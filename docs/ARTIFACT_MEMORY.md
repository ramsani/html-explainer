# Artifact Memory

`html-explainer` can generate HTML artifacts that are useful beyond the current chat. This document defines how those artifacts should be saved, classified, explored, refreshed, superseded, and reused without committing user-generated outputs into this repository.

Artifact memory is the storage and lifecycle layer. The actionable knowledge base is the retrieval, relationship, and action layer built on top of it. See [`ACTIONABLE_KNOWLEDGE_BASE.md`](ACTIONABLE_KNOWLEDGE_BASE.md) for the knowledge model.

## Intent

Create a local-first artifact memory system for generated HTML outputs.

The repo provides the system: conventions, schemas, templates, explorer UI, and guidance.

The user's local output folder stores the actual generated artifacts.

```text
The repo is the system.
The local output folder is the user's artifact memory.
```

## Why This Exists

Generated artifacts do not all have the same lifespan.

Some artifacts are temporary because they depend on a date, repo state, dependency version, tool behavior, external source, pricing page, API behavior, or active decision context.

Some artifacts are replaceable because a better future artifact should become the current reference.

Some artifacts are evergreen because they capture durable architecture, reasoning, prompts, rubrics, workflow models, or project understanding.

Without a memory system, useful artifacts become hard to find, stale artifacts look current, and future agents lose context that could accelerate re-entry.

## Non-Negotiable Boundary

Generated user artifacts should not be committed into this repository as historical output.

This repository should provide:

- local output conventions;
- metadata schema;
- index schema;
- explorer template;
- classification rules;
- freshness rules;
- supersession rules;
- re-entry workflow;
- privacy guidance.

The user's machine should store:

- generated HTML artifacts;
- artifact metadata;
- local index files;
- local attachments and exports.

## Default Local Output Root

Default path:

```text
~/.claude/html-explainer/outputs/
```

Optional user-facing alternative:

```text
~/html-explainer-outputs/
```

Future versions may support configurable output roots. The first version should document the default path and keep the model file-based.

## Suggested Local Folder Structure

```text
~/.claude/html-explainer/outputs/
  index.html
  index.json
  artifacts/
    temporal/
    replaceable/
    evergreen/
    superseded/
    private/
    do-not-reuse/
  metadata/
    temporal/
    replaceable/
    evergreen/
    superseded/
    private/
    do-not-reuse/
  attachments/
  exports/
```

## Lifespan Classes

Every saved artifact should be classified by useful lifespan.

### temporal

Use when the artifact depends on time-sensitive facts or a specific state.

Examples:

- repo review tied to a specific commit;
- tool comparison based on current pricing;
- dependency analysis based on current versions;
- research using current external sources;
- status report;
- release readiness review;
- incident report during an active incident.

Required behavior:

- show freshness warning;
- include source date or commit when available;
- include recommended review date;
- avoid treating it as permanent truth.

### replaceable

Use when the artifact is useful now but expected to be replaced by a better future version.

Examples:

- first repo map;
- initial project recap;
- early architecture diagram;
- draft prompt tuner;
- provisional implementation plan.

Required behavior:

- include supersession metadata;
- allow `superseded_by` links;
- preserve old version without making it look current.

### evergreen

Use when the artifact contains durable value.

Examples:

- stable architecture explanation;
- reusable prompt pattern;
- decision model;
- workflow principle;
- long-term project map;
- quality rubric;
- conceptual explainer.

Required behavior:

- mark as reusable;
- make easy to find;
- include re-entry prompt;
- optionally link to related artifacts.

### private

Use when the artifact may contain sensitive, local, client, financial, legal, medical, credential, or personal information.

Required behavior:

- keep local only;
- show privacy warning;
- do not encourage sharing;
- avoid public export assumptions;
- avoid storing credentials, secrets, private keys, or tokens in metadata.

### do-not-reuse

Use when an artifact should not be preserved as knowledge.

Examples:

- trivial output;
- low-confidence artifact;
- obsolete failed attempt;
- artifact with unsupported claims;
- output that was useful only as scratch work.

Required behavior:

- do not index by default;
- optionally keep only if the user explicitly requests.

## Archive Recommendation

When `html-explainer` generates an artifact, it should recommend an archive decision when the artifact may have future value.

Recommended format:

```text
Archive recommendation:
- save / do not save
- suggested validity class
- freshness risk
- suggested filename
- suggested review trigger
- reason
```

The agent should not save automatically unless the user explicitly asks.

## Re-Entry Workflow

A future user or agent should be able to reopen an old artifact and understand:

- what it was created for;
- what evidence it used;
- whether it is still likely valid;
- what may have changed since creation;
- whether to reuse, refresh, supersede, ignore, or keep private.

Re-entry decisions:

```text
reuse: artifact is still valid enough;
refresh: same artifact type, updated evidence needed;
supersede: create a new replacement artifact;
ignore: no longer useful;
archive-private: keep but do not surface broadly.
```

## Supersession Workflow

Artifacts should not disappear when obsolete.

When a new artifact replaces an older one:

- the old artifact is marked or moved as `superseded`;
- old metadata receives `superseded_by`;
- new metadata receives `supersedes`;
- the explorer shows the current artifact first;
- superseded artifacts remain available for history.

## Freshness Model

Freshness is not only about date.

The system should distinguish between:

- time freshness;
- repo-state freshness;
- source freshness;
- decision freshness;
- user-context freshness.

Examples:

- a repo recap may become stale after major file changes;
- a pricing comparison may become stale quickly;
- an architecture principle may remain evergreen;
- a prompt tuner may need review after model or tool changes.

## Explorer Requirement

The explorer page must itself follow the core `html-explainer` principle:

```text
intent -> evidence -> visual understanding -> decision -> next action -> reusable memory
```

It should not be a generic archive table.

The explorer should make the user's next decision obvious:

- what artifact should I open now?
- which artifacts are still valid?
- which artifacts are stale or risky?
- which artifacts have been superseded?
- which artifacts are evergreen and reusable?
- which artifact should be refreshed, ignored, or replaced?
- what is the next useful prompt for re-entry?

## Explorer Quality Bar

The explorer should:

- show its primary intent on the first screen;
- expose evidence basis through metadata;
- separate current, stale, superseded, private, and evergreen artifacts;
- surface uncertainty and freshness risk visibly;
- avoid decorative UI that does not help decision-making;
- support search and filters only where they reduce real user work;
- include copy-ready re-entry and handoff prompts;
- make temporal validity and supersession relationships obvious;
- remain local-first and privacy-first.

## Privacy Rules

The system must assume generated artifacts may contain sensitive information.

Rules:

- do not commit local output artifacts to the repo;
- do not assume artifacts are safe to share;
- classify sensitive artifacts as `private`;
- avoid credentials, secrets, tokens, private keys, or unnecessary personal data in metadata;
- warn before exporting or sharing private artifacts;
- keep the system local-first by default.

## First Implementation Boundary

The first implementation should provide:

- this architecture document;
- a metadata schema document;
- an actionable knowledge base model;
- sample `index.json`;
- sample artifact metadata;
- a static explorer template.

It should not add:

- database;
- cloud sync;
- hosted service;
- authentication;
- automatic background indexing;
- automatic deletion;
- AI ranking;
- installer behavior changes unless a later PR explicitly scopes them.

## Future Capabilities To Keep Open

The design should not block:

- command-assisted saving;
- automatic metadata generation;
- local index regeneration;
- stale artifact detection;
- review reminders;
- artifact graph visualization;
- project-based artifact spaces;
- import/export bundles;
- Obsidian-compatible markdown index;
- GitHub issue generation from artifact next actions;
- integration with `/reenter-project`;
- integration with `/audit-html`;
- artifact quality scoring;
- search across summaries and tags;
- optional local-only embeddings or semantic search.
