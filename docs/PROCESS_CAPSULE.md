# Process Capsule

Intent: make each HTML artifact reusable as the next step's input without building a heavier app or custom runtime.

This is the KISS bridge between today's HTML artifact and tomorrow's more process-aware agent workflows.

## Why

Markdown was good for writing.
HTML is better for reading, comparing, and deciding.

The next useful step is not a new visual format. It is preserving enough process state so the user or next agent can continue without losing intent.

## Rule

For any artifact that may lead to follow-up work, include a small process capsule.

The capsule must be:

- short;
- factual;
- copyable;
- visible to humans;
- reusable by another agent;
- small enough not to bloat the artifact.

Skip it for tiny one-off artifacts.

## Required fields

```text
Process capsule:
Process stage: <explore | deepen | decide | plan | implement | review | share | handoff>
Primary intent: <what the user came to accomplish>
Secondary intents: <only the ones that affect the decision>
Decision so far: <what this artifact decided or clarified>
Evidence used: <short list of sources inspected>
Open risks or unknowns: <only what affects the next step>
Recommended next prompt: <copy-ready prompt>
Option prompts: <three logical copy/edit options when useful>
Success criteria for next step: <how the user knows the next step worked>
```

## Optional machine-readable form

When useful, add the same capsule as a small JSON block near the end of the HTML:

```html
<script type="application/json" id="html-explainer-process-capsule">
{
  "processStage": "plan",
  "primaryIntent": "review the implementation plan before coding",
  "decisionSoFar": "plan is usable after one auth boundary is clarified",
  "evidenceUsed": ["README.md", "app/api/auth/route.ts", "lib/session.ts"],
  "openRisks": ["unclear session expiry behavior"],
  "recommendedNextPrompt": "/check-the-plan revise the auth boundary section using this artifact as context",
  "successCriteria": ["auth risk is explicit", "validation command is named"]
}
</script>
```

Use valid JSON. Keep it compact. Do not include secrets, long diffs, private tokens, or full file contents.

## Process stages

- `explore`: compare directions or discover opportunities.
- `deepen`: explain one concept, module, workflow, or risk.
- `decide`: choose between options.
- `plan`: turn a decision into steps.
- `implement`: guide code changes.
- `review`: check diff, plan, or output.
- `share`: prepare another human to understand.
- `handoff`: prepare another agent to continue.

## KISS limits

- Do not create a database of artifacts.
- Do not require a browser extension.
- Do not create external dependencies.
- Do not include the full artifact content in JSON.
- Do not add the capsule when the next step is obvious and tiny.

The capsule exists only to reduce lost context.

## Quality checks

Before finalizing, ask:

- Does this preserve the user's original intent?
- Can the next agent continue without rereading everything?
- Are the next prompts still editable by the user?
- Is the capsule short enough to ignore if the user does not need it?
- Does it avoid turning the artifact into a process platform?

## Hard fails

Revise the artifact if:

- the capsule changes the user's intent;
- the capsule repeats the whole report;
- the capsule contains unsupported claims;
- the capsule includes secrets or sensitive data;
- the recommended next prompt cannot be pasted into an agent.
