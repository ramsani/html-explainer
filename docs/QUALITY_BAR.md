# Quality Bar

Use this before trusting or delivering an HTML artifact.

## Pass Standard

An artifact passes only when it is better than Markdown for the user's real intent.

The Quality Bar confirms required parts before delivery. It is not a substitute for clear intent, evidence, visual structure, decision support, next action, and reusable memory.

## Score

Score 0-100:

| Area | Points |
|---|---:|
| Primary intent answered | 15 |
| Secondary intents handled only when useful | 8 |
| Evidence visible | 12 |
| Facts, inferences, assumptions, unknowns separated | 10 |
| HTML advantage is real | 12 |
| Budget is smallest useful size | 6 |
| First screen gives decision, risk, next action | 12 |
| Visual model clarifies the concept | 6 |
| Interaction/export useful when present | 7 |
| Next prompt is copy-ready and preserves context | 5 |
| Archive recommendation protects reusable memory | 3 |
| Memory access is obvious but quiet | 2 |
| User agency is visible and respectful | 2 |

Decision:

- `90-100`: decision-ready.
- `75-89`: useful, minor revision.
- `60-74`: partial, revise before trusting.
- `<60`: reject or simplify to Markdown.

## Hard Fails

Fail immediately if it:

- invents evidence;
- misses the primary intent;
- hides uncertainty;
- claims tests or facts without proof;
- uses HTML only as decoration;
- makes interaction without exportable output;
- shows reusable values or prompts without a copy/export path;
- puts the recommendation below decoration;
- leaves the user to invent the next command;
- saves or recommends saving low-value scratch work as reusable knowledge;
- exposes internal process labels when simple user-facing language would be clearer;
- hides where reusable work can be found later;
- turns memory guidance into a bulky or distracting report;
- traps the user in one path without a clear choice to continue, revise, compare, save, or stop;
- uses pushy language when a quiet invitation would be enough;
- is incoherent on mobile.

## Required Ending

Every serious artifact ends with:

```text
Recommended next action:
Why:
Ready-to-run prompt:
Two or three useful alternatives:
Block conditions:
Archive recommendation:
```

The next prompt must preserve intent, evidence, acceptance criteria, out-of-scope items, and uncertainty.

The archive recommendation must state `save`, `do not save`, `private`, `refresh`, or `supersede` when the artifact can become future context.

The memory access hint must be short enough to read in a glance.
