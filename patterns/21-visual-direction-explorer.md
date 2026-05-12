# 21 — Visual Direction Explorer

Intent: compare multiple live visual directions before committing to one UI direction.

Use when the user asks to explore visual design, empty states, onboarding states, component tone, visual alternatives, or "show me options" for a UI surface.

Evidence required:
- user goal and product context;
- target user and state being designed;
- existing brand/product tone when available;
- current component or surrounding UI if it exists;
- constraints for density, motion, accessibility, and light/dark surfaces;
- primary action the UI must make obvious.

Prompt template:
```text
Generate a self-contained HTML visual direction explorer. Show 3-4 live alternatives side by side. Compare tone, density, primary action clarity, state fit, light/dark resilience, accessibility risk, and best-use context. End with a recommendation and next step. Do not create decorative variants with no product rationale.
```

HTML structure:
- intent;
- HTML advantage and artifact budget;
- context and evidence inspected;
- decision criteria;
- 3-4 live rendered alternatives;
- light/dark surface comparison;
- tone/density/action clarity notes;
- state fit: empty/loading/error/success when relevant;
- recommendation;
- what to test next.

Quality checklist:
- alternatives are meaningfully different, not superficial style swaps;
- each option is rendered live, not only described;
- each option has a clear product rationale;
- primary action is visible in every option;
- light and dark surfaces are considered when relevant;
- motion is purposeful and reduced-motion safe when used;
- recommendation explains when not to choose the other options.

Failure modes:
- four decorative cards with the same UX;
- choosing an option only because it looks modern;
- ignoring the surrounding product tone;
- hiding primary action clarity under illustration;
- using motion that distracts from the task;
- comparing colors without comparing density, hierarchy, or state behavior.

Acceptance criteria:
The user can choose a visual direction without imagining it from prose.

## Visual explainer contract

Apply `docs/VISUAL_EXPLAINER_PLAYBOOK.md` for this pattern. The artifact must include the primary visual model, useful interaction when it removes work, a decisive first screen, and a clear reason it is substantially better than Markdown.
