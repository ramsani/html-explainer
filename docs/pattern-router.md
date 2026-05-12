# Pattern Router

Use this router before generating an HTML artifact.

The goal is to choose the smallest artifact that makes hidden structure visible and improves the user's decision.

## Routing rules

| Signal in the task | Primary pattern |
|---|---|
| There are 2+ implementation options | 01 Code approach comparison |
| The user has a plan but code has not changed | 02 Visual implementation plan or plan review |
| There is a git diff, PR, patch, or changed files | 03 Annotated PR / diff review |
| The user needs to understand part of a repo | 04 Module map |
| UI consistency, theming, tokens, or styling are involved | 05 Design token contact sheet |
| UI variants, states, forms, cards, or components are involved | 06 Component state matrix |
| The user wants visual design options, empty-state directions, tone exploration, or live UI alternatives | 21 Visual direction explorer |
| The decision depends on clicks or flow friction | 07 Interactive flow prototype |
| The decision depends on motion, feedback, or timing | 08 Microinteraction sandbox |
| Services, APIs, agents, queues, auth, data flow, or boundaries are involved | 09 Architecture diagram |
| Sequential workflows, n8n, deploys, issue pipelines, or automations are involved | 10 Process / workflow flowchart |
| The output needs stakeholder alignment | 11 Technical decision deck |
| The user needs milestone/status review | 12 Project progress deck |
| The user needs to understand a concept | 13 Concept explainer |
| The task compares tools, libraries, vendors, or approaches | 14 Research comparison map |
| Something broke or regressed | 15 Incident / postmortem report |
| The user asks for serious review against standards | 16 Audit report |
| The user returns to an old repo/project | 17 Project recap |
| Many issues/tasks/features must be sorted | 18 Ticket triage board |
| Config, flags, permissions, or settings interact | 19 Feature flag / config editor |
| Agent instructions, prompts, rubrics, or skills are being tuned | 20 Prompt / agent behavior tuner |

## Tie breaker

Choose the pattern that best supports the next decision.

If the user needs to decide *what to do*, prefer comparison, plan, recap, audit, or triage.

If the user needs to decide *whether something is safe*, prefer plan review, diff review, architecture diagram, workflow flowchart, or incident report.

If the user needs to *feel or manipulate something*, prefer prototype, microinteraction sandbox, config editor, ticket board, or prompt tuner.

If the user needs to choose *visual tone or direction*, prefer visual direction explorer. Use component state matrix only when the question is completeness across states, not choosing between directions.

## Stop rule

Do not generate HTML when a short Markdown answer is clearer.

HTML is justified only when it reveals structure that text would flatten.
