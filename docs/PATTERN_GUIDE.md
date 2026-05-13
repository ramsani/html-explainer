# Pattern Guide

Use this to choose one primary artifact pattern.

## Routing Table

| Signal | Pattern |
|---|---|
| 2+ implementation options | 01 Code approach comparison |
| Plan before code | 02 Visual implementation plan |
| Diff, PR, patch, changed files | 03 Annotated PR / diff review |
| Understand one repo area | 04 Module map |
| Tokens, theme, styling | 05 Design token reference sheet |
| UI variants or component states | 06 Component state matrix |
| Click flow or friction | 07 Interactive flow prototype |
| Motion, timing, feedback | 08 Microinteraction sandbox |
| Services, APIs, agents, data flow, boundaries | 09 Architecture diagram |
| Sequential workflow, deploy, automation, n8n | 10 Process / workflow flowchart |
| Stakeholder decision | 11 Technical decision deck |
| Progress or milestone update | 12 Project progress deck |
| Teach a concept | 13 Concept explainer |
| Compare tools or vendors | 14 Research comparison map |
| Incident, regression, failure | 15 Incident / postmortem report |
| Audit against standards | 16 Audit report |
| Reenter repo/project | 17 Project recap |
| Sort many tasks/issues/features | 18 Ticket triage board |
| Config, flags, settings, permissions | 19 Feature flag / config editor |
| Prompt, agent behavior, rubric, skill | 20 Prompt / agent behavior tuner |
| Visual direction or UI tone options | 21 Visual direction explorer |
| Think through a topic, idea, strategy, risk, or unclear decision | 22 Insight Surface Loop |

## Tie-Breakers

- If the user asks "what should I do?", prefer comparison, plan, recap, audit, or triage.
- If the user asks "is this safe?", prefer plan review, diff review, architecture, workflow, or incident.
- If the user must manipulate values, prefer editor, triage board, tuner, or prototype.
- If the user must choose look and feel, prefer visual direction explorer.
- If future HTML must match product taste, create design token reference first.
- If the user is still forming the question or conclusion, prefer Insight Surface Loop.

## Minimum Viable Pattern

Every pattern must contain:

- evidence required;
- prompt template;
- HTML structure;
- at least 5 quality checks;
- at least 3 failure modes;
- at least 1 tie-breaker or "do not use when" rule;
- acceptance criteria;
- visual explainer contract.

## Use Pattern Files

After routing, open the matching file under `patterns/`.

Do not rely only on the table. The pattern file carries the evidence, structure, failure modes, and acceptance criteria.
