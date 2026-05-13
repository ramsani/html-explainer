# Artifact Modes

Modes are workflow containers. They sit above individual patterns.

| Mode | Patterns it can route to | Purpose |
|---|---|---|
| `explain` | concept explainer, research comparison | Turn unclear material into a useful model. |
| `review` | plan review, diff review, audit report | Decide whether work is safe, weak, or blocked. |
| `map` | architecture diagram, workflow flowchart, module map | Make relationships and failure paths visible. |
| `decide` | approach comparison, decision deck, decision tool | Choose a path with evidence and trade-offs. |
| `tune` | prompt tuner, config editor, component matrix | Improve behavior through controlled dimensions and export. |
| `remember` | project recap, artifact explorer, knowledge base | Preserve useful context and re-enter later. |
| `think` | insight surface loop | Move from vague topic to provisional conclusion and next action. |

## Routing Rule

Pick mode before pattern.

```text
user need -> mode -> pattern -> budget -> evidence -> artifact
```

If two modes fit, choose the one closest to the user's next decision.
