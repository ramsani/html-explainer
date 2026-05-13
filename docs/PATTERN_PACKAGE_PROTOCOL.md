# Pattern Package Protocol

A pattern is not just a Markdown file. It is a small package that tells future agents how to produce one valuable artifact reliably.

## Minimum Package

```text
patterns/NN-name.md
examples/name.example.html
validation hook when possible
README or docs link when the pattern affects user behavior
```

## Pattern Metadata

Each pattern should be understandable through this metadata:

```yaml
pattern: NN-name
mode: review | map | decide | tune | remember | think | explain
artifact_direction: teach | decide | review | map | tune | remember
recommended_budget: compact | standard | interactive
requires_evidence:
  - source or context required
outputs:
  primary: html
  secondary:
    - next_prompt
    - archive_recommendation
quality_gates:
  - evidence_visible
  - risk_visible
  - next_action_visible
memory:
  default_validity: temporal | replaceable | evergreen | private | do-not-reuse
  freshness_risk: low | medium | high
```

## Merge Bar

Do not merge a new pattern unless:

- its command or routing path is clear;
- the example passes semantic validation;
- it states when not to use HTML;
- it ends with a continuation path;
- it does not add heavy runtime behavior without a separate decision.
