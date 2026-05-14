# Artifact Metadata Schema

This document defines the first local metadata model for generated `html-explainer` artifacts.

The schema is intentionally file-based, portable, and simple enough to maintain manually before automation exists.

## Core Rule

Metadata describes local generated artifacts. It should help users and agents decide whether an artifact is current, reusable, stale, private, superseded, or not worth reusing.

Metadata must not store secrets, tokens, credentials, private keys, or unnecessary personal data.

## Sidecar Location

Suggested sidecar path:

```text
~/.claude/html-explainer/outputs/metadata/<validity>/<artifact-id>.json
```

The matching artifact path should be:

```text
~/.claude/html-explainer/outputs/artifacts/<validity>/<artifact-id>.html
```

## Validity Values

Allowed `validity` values:

```text
temporal
replaceable
evergreen
superseded
private
do-not-reuse
```

## Freshness Risk Values

Allowed `freshness_risk` values:

```text
low
medium
high
unknown
```

## Privacy Values

Allowed `privacy` values:

```text
local
private
shareable
unknown
```

`shareable` should be used cautiously. It means the artifact appears safe to share after user review, not that it should be uploaded automatically.

## Required Fields

```json
{
  "id": "",
  "title": "",
  "created_at": "",
  "artifact_path": "",
  "artifact_type": "",
  "pattern": "",
  "validity": "",
  "freshness_risk": "",
  "privacy": "",
  "summary": "",
  "knowledge_type": "",
  "topics": [],
  "aliases": [],
  "recommended_action": "",
  "confidence": "unknown",
  "source_context": [],
  "known_limits": [],
  "handoff_prompt": "",
  "tags": []
}
```

## Recommended Full Schema

```json
{
  "schema_version": "0.1.0",
  "id": "repo-recap-html-explainer-2026-05-13-a1bc24a",
  "title": "html-explainer repo recap",
  "created_at": "2026-05-13T00:00:00-07:00",
  "updated_at": "2026-05-13T00:00:00-07:00",
  "artifact_path": "artifacts/replaceable/repo-recap-html-explainer-2026-05-13-a1bc24a.html",
  "metadata_path": "metadata/replaceable/repo-recap-html-explainer-2026-05-13-a1bc24a.json",
  "artifact_type": "project-recap",
  "pattern": "17-project-recap",
  "validity": "replaceable",
  "freshness_risk": "medium",
  "privacy": "local",
  "project": "html-explainer",
  "source_context": [
    {
      "type": "repo",
      "name": "ramsani/html-explainer",
      "ref": "a1bc24a",
      "inspected": [
        "README.md",
        "install.sh",
        "commands/",
        "patterns/",
        "scripts/",
        ".github/workflows/ci.yml"
      ]
    }
  ],
  "claims_scope": "Valid for the inspected repo state and files listed in source_context.",
  "summary": "Explains repo purpose, operating model, current strengths, risks, and next best action.",
  "knowledge_type": "map",
  "topics": [
    "html-explainer",
    "repo understanding"
  ],
  "aliases": [
    "repo recap",
    "html-explainer map"
  ],
  "recommended_action": "inspect",
  "confidence": "medium",
  "key_decisions": [
    "Treat generated HTML as decision surfaces, not decoration.",
    "Preserve evidence, uncertainty, and next prompts."
  ],
  "known_limits": [
    "Does not prove behavior quality across scenario tests.",
    "May become stale after major README, installer, command, or pattern changes."
  ],
  "supersedes": [],
  "superseded_by": null,
  "related_artifacts": [],
  "recommended_review_date": "2026-06-13",
  "review_triggers": [
    "major installer change",
    "pattern system change",
    "README repositioning",
    "new scenario test harness"
  ],
  "original_prompt": "",
  "handoff_prompt": "",
  "next_action": "",
  "resurface_count": 0,
  "last_resurfaced_at": "",
  "annotations_path": "annotations/repo-recap-html-explainer-2026-05-13-a1bc24a.json",
  "tags": [
    "repo-recap",
    "claude-code",
    "html-artifact",
    "decision-surface"
  ]
}
```

## Field Meanings

| Field | Meaning |
|---|---|
| `schema_version` | Metadata schema version. |
| `id` | Stable local artifact identifier. |
| `title` | Human-readable title. |
| `created_at` | Creation timestamp with timezone when possible. |
| `updated_at` | Last metadata update timestamp. |
| `artifact_path` | Relative path from output root to the HTML artifact. |
| `metadata_path` | Relative path from output root to this metadata file. |
| `artifact_type` | General artifact type, such as `project-recap`, `diff-review`, or `prompt-tuner`. |
| `pattern` | `html-explainer` pattern used, when known. |
| `validity` | Lifespan class. |
| `freshness_risk` | Likelihood the artifact becomes stale. |
| `privacy` | Sharing sensitivity. |
| `project` | Project or topic the artifact belongs to. |
| `source_context` | Evidence or context inspected. |
| `claims_scope` | Boundary of claims made by the artifact. |
| `summary` | Short explanation of artifact value. |
| `knowledge_type` | Reusable value type: decision, map, review, prompt, workflow, research, principle, status, incident, or design. |
| `topics` | Human-friendly themes used for Maps of Content. |
| `aliases` | Natural phrases that should find this artifact. |
| `recommended_action` | What the explorer should invite next: open, reuse, refresh, supersede, compare, inspect, ignore, private-review. |
| `confidence` | Low, medium, high, or unknown confidence in reuse. |
| `key_decisions` | Important decisions or conclusions captured. |
| `known_limits` | Uncertainties, missing evidence, or constraints. |
| `supersedes` | Artifact IDs this artifact replaces. |
| `superseded_by` | Artifact ID that replaced this artifact, if any. |
| `related_artifacts` | Artifact IDs that should be explored together. |
| `recommended_review_date` | Suggested date for review. |
| `review_triggers` | Events that should cause review. |
| `original_prompt` | Prompt that created the artifact, if safe to store. |
| `handoff_prompt` | Prompt to continue from the artifact. |
| `next_action` | Recommended next user or agent action. |
| `resurface_count` | Number of times this artifact has been resurfaced. |
| `last_resurfaced_at` | Last resurfacing timestamp. |
| `annotations_path` | Local sidecar for notes and highlights. |
| `tags` | Search and grouping tags. |

## Index Schema

The local output root should include:

```text
index.json
```

Minimum shape:

```json
{
  "schema_version": "0.1.0",
  "generated_at": "2026-05-13T00:00:00-07:00",
  "output_root": "~/.claude/html-explainer/outputs",
  "artifacts": []
}
```

Recommended artifact entry shape:

```json
{
  "id": "repo-recap-html-explainer-2026-05-13-a1bc24a",
  "title": "html-explainer repo recap",
  "created_at": "2026-05-13T00:00:00-07:00",
  "artifact_path": "artifacts/replaceable/repo-recap-html-explainer-2026-05-13-a1bc24a.html",
  "metadata_path": "metadata/replaceable/repo-recap-html-explainer-2026-05-13-a1bc24a.json",
  "artifact_type": "project-recap",
  "pattern": "17-project-recap",
  "validity": "replaceable",
  "freshness_risk": "medium",
  "privacy": "local",
  "project": "html-explainer",
  "summary": "Repo recap with evidence, risks, and next action.",
  "knowledge_type": "map",
  "topics": ["html-explainer", "repo understanding"],
  "aliases": ["repo recap", "html-explainer map"],
  "recommended_action": "inspect",
  "confidence": "medium",
  "tags": ["repo-recap", "claude-code"]
}
```

The index should duplicate only enough metadata to power the explorer quickly. The sidecar metadata remains the richer source of detail.

## Supersession Rules

When artifact `B` replaces artifact `A`:

- `B.supersedes` includes `A.id`.
- `A.superseded_by` is set to `B.id`.
- `A.validity` may become `superseded`.
- The explorer should surface `B` first but keep `A` available for history.

## Privacy Rules

Metadata should avoid sensitive payloads. Store summary and safe pointers, not secrets.

Do not put these in metadata:

- API keys;
- access tokens;
- private keys;
- credentials;
- sensitive personal data;
- client-confidential details unless the artifact is explicitly `private` and local.

## Validation Guidance

A future validator can check:

- JSON parses successfully;
- required fields exist;
- `validity` uses allowed values;
- `freshness_risk` uses allowed values;
- `privacy` uses allowed values;
- `artifact_path` points to an `.html` file;
- supersession references are consistent;
- private artifacts are not marked shareable.
