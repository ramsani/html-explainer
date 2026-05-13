# Context Packs

Intent: keep context small while giving each command enough evidence to be useful.

Read the smallest pack that can support the decision. Add adjacent files only when the evidence points there.

## Shared core pack

Every serious artifact uses:

- `docs/AUTODISCOVERY.md` when the user did not explicitly request an HTML command
- `docs/INTENT_DISTILLATION.md`
- `docs/HTML_ADVANTAGE_GATE.md`
- `docs/EXPLAINER_CLARITY.md`
- `docs/VISUAL_EXPLAINER_PLAYBOOK.md`
- `docs/THARIQ_SITE_LEARNINGS.md`
- `docs/USER_IN_THE_LOOP.md`
- `docs/VISUAL_STYLE_STANDARD.md`
- `docs/LEAN_HTML_RENDERING.md`
- `docs/DECISION_COST_GATE.md` when decision cost matters
- `docs/ARTIFACT_BUDGET.md`
- `docs/pattern-router.md`
- selected `patterns/NN-*.md`
- `docs/HTML_UX_STANDARD.md`
- `docs/fact-sheet-protocol.md`
- `docs/QUALITY_BAR.md`
- `docs/NEXT_ACTION_HANDOFF.md`
- `docs/PROCESS_CAPSULE.md` when follow-up work is likely
- `docs/SENIOR_CHAINED_PROMPTS.md` when next prompts need durable engineering-brief quality
- `docs/EXPERT_PROMPT_GATES.md` when next prompts need technical stage gates
- `docs/HTML_DELIVERY.md`

Use these conditionally:

- `docs/HTML_ARTIFACT_CHAINS.md` when the work spans exploration, planning, review, or handoff.
- `docs/SHARE_AND_REENTRY.md` when another human or agent may read the artifact later.

## Command packs

### `/pick-the-right-html`

Minimum:

- shared core pack except `fact-sheet-protocol.md` unless evidence is being summarized;
- user request;
- repo file list or project summary when choosing a repo-specific pattern.

Stop after selecting the pattern. Do not inspect the whole repo unless pattern choice depends on it.

### `/make-the-right-html`

Minimum:

- shared core pack;
- selected pattern file;
- real source files or inputs required by that pattern.

Add only the sources named by the pattern's evidence requirements.

### `/check-the-plan`

Minimum:

- user plan;
- files, routes, commands, dependencies, APIs, tests, and workflows claimed by the plan;
- adjacent files needed to validate those claims.

Do not read unrelated modules just because they exist.

### `/check-the-diff`

Minimum:

- `git status --short`;
- `git diff --stat`;
- `git diff --name-status`;
- `git diff` or PR patch;
- changed files;
- related tests/config/schema/routes when affected.

Add history only when regression, rollout risk, or ownership is unclear.

### `/reenter-project`

Minimum:

- README or project metadata;
- source tree overview;
- recent git activity;
- docs/changelog/tests/config where relevant;
- main entry points.

Do not read every source file. Escalate into module map only when a specific area needs deeper understanding.

### `/build-decision-tool`

Minimum:

- real data to manipulate;
- constraints and invalid states;
- desired export format;
- examples of acceptable output if available.

Do not build controls before defining the export.

### `/audit-html`

Minimum:

- artifact being audited;
- likely pattern file;
- `docs/QUALITY_BAR.md`;
- `docs/HTML_ADVANTAGE_GATE.md`;
- `docs/ARTIFACT_BUDGET.md`;
- `docs/NEXT_ACTION_HANDOFF.md`.

Add original evidence only when checking whether the artifact invented facts.

## Escalation rules

Read more context only when:

- a claim cannot be verified;
- a risk touches shared behavior;
- the artifact will guide implementation;
- the result will be shared with another person or agent;
- a safety, data, auth, deploy, payment, or migration boundary appears.
- local context can make the artifact materially less generic: git history, prior HTML artifacts, issue/PR context, connected tools, or browser context.

## Stop rules

Stop reading when:

- the pattern is selected and the user asked not to generate HTML;
- Markdown is clearly better;
- the next action is direct implementation or review, not another artifact;
- more context would not change the recommendation.
