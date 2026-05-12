# Share and Reentry

Intent: make important HTML artifacts useful beyond the current chat.

An artifact should be easy for a human to open, skim, share, and hand to another agent.

## When to apply

Apply this for:

- PR reviews;
- implementation plans;
- project recaps;
- research reports;
- incident reports;
- decision decks;
- design references;
- artifacts that another agent may use later.

Skip it for tiny throwaway artifacts.

## Share-ready summary

For shareable artifacts, include a short section near the top:

```text
Share-ready summary:
Audience:
Decision:
Recommendation:
Evidence base:
Risk:
Next action:
```

This is not marketing copy. It is a fast briefing for someone who was not in the chat.

## Agent reentry block

For artifacts that may guide later implementation or verification, include:

```text
Agent reentry:
What was decided:
What is still unknown:
Files or sources inspected:
Do-not-touch boundaries:
Next command or prompt:
Validation required:
```

The purpose is to let a new agent continue without rereading the whole conversation.

## Sharing rules

- Keep the first screen decisive.
- Keep evidence visible.
- Make uncertainty explicit.
- Use links, anchors, and headings that survive sharing.
- Prefer a single self-contained HTML file.
- Do not depend on external network resources unless the user asked for them.
- Do not include secrets, private tokens, or unsupported claims.

## Reentry rules

- A reentry block must be factual, not motivational.
- It must distinguish decisions from open questions.
- It must name the next command or prompt.
- It must name validation before production or merge when relevant.

## Good example

```text
Agent reentry:
What was decided: use optimistic updates, but fix query cancellation first.
What is still unknown: whether retry idempotency is covered by tests.
Files inspected: src/hooks/useOptimisticTasks.ts, src/api/tasks.ts, TaskList tests.
Do-not-touch boundaries: do not change unrelated task filtering.
Next command: /check-the-diff verify the optimistic update fix after cancelQueries and stable idempotency keys are added.
Validation required: unit tests for success, rollback, and retry behavior.
```
