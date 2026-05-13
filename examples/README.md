# Examples

These files are golden-style references for the agent.

They are not decorative samples. They define the expected shape for common artifact types.

| Example | Pattern | Demonstrates |
|---|---|---|
| `plan-review-minimal.example.html` | 02 Visual implementation plan | Compact plan review with risk and next action. |
| `diff-review-minimal.example.html` | 03 Annotated PR / diff review | Compact diff review. |
| `diff-review-full.example.html` | 03 Annotated PR / diff review | Full review with evidence, findings, tests, decision. |
| `architecture-diagram.example.html` | 09 Architecture diagram | Components, boundaries, failure points, safe zones. |
| `project-recap.example.html` | 17 Project recap | Repo reentry with identity, architecture, risks, next action. |
| `ticket-triage.example.html` | 18 Ticket triage board | Interactive prioritization with export. |
| `prompt-tuner-minimal.example.html` | 20 Prompt / agent behavior tuner | Minimal prompt tuning with copy output. |
| `prompt-tuner-full.example.html` | 20 Prompt / agent behavior tuner | Interactive behavior controls with export. |
| `visual-direction-explorer.example.html` | 21 Visual direction explorer | Side-by-side visual options. |

## Required Signals

Every example should include:

- primary intent;
- secondary intent coverage;
- base concept;
- why HTML beats Markdown;
- artifact budget;
- mental work removed;
- evidence;
- risk or uncertainty;
- next action or next prompt;
- system light/dark support.

Interactive examples must include copy or export output.

When a pattern changes materially, review its mapped examples.
