# Decision Cost Gate

Intent: decide when HTML is worth extra tokens because the cost of a wrong human decision is high.

Use this before generating HTML for planning, architecture, PR review, design direction, or implementation options.

## Core rule

HTML is most justified at decision crossroads.

Use HTML when the user must choose a direction and a bad choice would cause rework, unsafe implementation, missed detail, or team misunderstanding.

Use Markdown when the answer is simple, linear, or low consequence.

## High-cost decision signals

HTML is likely worth it when the task includes:

- 2+ implementation options;
- foundation choices such as auth, data model, architecture, framework, payments, deployment, or agent behavior;
- plan mode before coding;
- PR review before merge;
- visual design direction before implementation;
- flow or workflow that has failure paths;
- tuning values that are hard to describe in text;
- shareable decision needed for another human or agent.

## Low-cost decision signals

Prefer Markdown when:

- the answer is one command;
- the change is a tiny local fix;
- no trade-off exists;
- no one else needs to read it;
- there is no visual structure;
- the user needs speed more than a decision surface.

## Cost framing

Before generating HTML, state the trade:

```text
Decision cost:
Token cost:
Why HTML is worth it:
Why Markdown is not enough:
```

Examples:

- "Decision cost: auth approach becomes project foundation."
- "Token cost: higher than Markdown, but acceptable because side-by-side options reduce wrong-plan risk."
- "Why HTML is worth it: user can compare commands, code snippets, risks, and recommendation on one screen."

## Plan mode rule

In plan mode, HTML is valuable when it helps the user approve or reject the plan before code changes.

The artifact should show:

- options or stages;
- trade-offs;
- code snippets or command examples when useful;
- data/control flow;
- validation points;
- recommendation.

## Hard fails

Revise or use Markdown if:

- the artifact spends tokens but does not improve the decision;
- the decision is low consequence;
- the HTML adds visual polish but no comparison, flow, or inspection;
- the user would still skim instead of read.
