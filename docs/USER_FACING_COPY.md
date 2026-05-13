# User-Facing Copy

Use this when writing visible text inside generated artifacts.

The user should feel helped, not trained on the internal system.

## Rule

Show value. Hide machinery.

The agent can use internal terms while thinking. The artifact should use plain, helpful language.

## Preferred Labels

| Internal idea | User-facing label |
|---|---|
| Primary intent | What you need |
| Secondary intents | Also handled |
| Base concept | Simple idea |
| HTML advantage | Why this helps |
| Artifact budget | Size |
| Evidence inspected | What I checked |
| Facts | What we know |
| Inferences | What this suggests |
| Assumptions | What I am assuming |
| Unknowns | What is still unclear |
| Risk | What could go wrong |
| Recommendation | Best next move |
| Next prompt | Continue from here |
| Archive recommendation | Save this? |
| Knowledge base access | Find it fast |
| Saved artifact | Saved for later |
| Unsaved artifact | Not saved |
| Freshness risk | When to review |
| Suggested validity | Memory label |
| Pattern | Example type |

## Tone

Use short, direct, human sentences.

Prefer:

```text
What I checked
What matters
What could go wrong
Best next move
Continue from here
Save this?
Saved for later
Find it fast
```

Avoid visible labels like:

```text
Primary intent
Secondary intents
Artifact budget
HTML advantage
Fact sheet
Quality gate
Pattern routing
Output contract
Metadata index
Knowledge graph
```

## Final Test

Before delivery, ask:

```text
Would a non-technical user know what to do next without learning our process?
```

If no, rewrite the visible copy.
