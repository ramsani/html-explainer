# Artifact Directions

Artifact directions prevent the agent from treating every HTML output as the same kind of object.

Each serious artifact should declare one primary direction:

| Direction | Use when | Output promise |
|---|---|---|
| `teach` | The user needs to understand a concept. | A clear model with examples, limits, and next prompt. |
| `decide` | The user must choose. | Options, trade-offs, evidence, recommendation, and action. |
| `review` | The user must accept, reject, or revise work. | Findings, severity, evidence, missing checks, and decision. |
| `map` | The user must see relationships. | Components, flows, boundaries, risks, and safe zones. |
| `tune` | The user must improve behavior or instructions. | Failure modes, scenario tests, output contract, and exportable instruction. |
| `remember` | The user may reuse the result later. | Metadata, validity, freshness, archive recommendation, and re-entry prompt. |

## Required Declaration

Every serious example should make these visible:

```text
Primary intent:
Secondary intents covered:
Base concept:
Artifact direction:
Artifact budget:
HTML advantage:
Mental work removed:
```

## Direction Gate

If no direction changes the user's next action, do not make an HTML artifact. Use Markdown.
