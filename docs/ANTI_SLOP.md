# Anti-Slop Rules

Decision-ready HTML fails when it looks organized but does not improve the decision.

## Block These

- Generic dashboard when the user needs a decision.
- Decorative charts that do not change understanding.
- Fake scores not derived from a visible rubric.
- Risk colors without stated basis.
- Hidden uncertainty.
- Long visual intro before the conclusion.
- Current-status claim without source context.
- Copy buttons that copy unusable text.
- Artifact memory recommendation for low-value scratch work.
- Broad theory labels that do not improve the artifact.

## Use Honest Placeholders

Use these instead of pretending certainty:

```text
unknown
not inspected
not verified
not enough evidence
stale risk
requires refresh
source missing
```

## Acceptance Rule

If the user still has to reconstruct intent, evidence, risk, and next action from scattered prose, the artifact fails even if it is visually polished.

## Anti-Slop Visual

Visual design earns its place when it clarifies hierarchy, timing, or state. It fails when itdecorates without informing.

### Depth Tiers — Use with Intent

Vary card depth to signal importance. Not everything should pop equally:

- **Elevated** (hero): key sections that demand attention. Use sparingly — one per page.
- **Default**: standard content, grouped information.
- **Recessed**: code blocks, secondary metadata, things the user skims past.

Never stack elevated cards inside elevated cards. Depth escalation without purpose is visual noise.

### Animation — Earn It

Use animation only when it clarifies timing, feedback, or state change:

- Staggered fade-in for lists where sequence matters.
- Hover lift for interactive elements that respond.
- Reduced-motion support via `@media (prefers-reduced-motion: reduce)`.

Never animate decorative elements. Never animate purely to impress.

### Decorative Rejection List

Reject these even if they look polished:

- Gradient backgrounds on every card.
- Icon libraries used without purpose.
- Decorative SVG accents that carry no information.
- Background patterns (dots, grids) on content slides.
- Large decorative numbers or letters that dominate without meaning.

### Mermaid Diagrams — Earn the Complexity

Mermaid adds value when the diagram has branching, cycles, or automatic edge routing saves real effort. It fails when:

- The diagram has 3 nodes in a straight line — CSS arrows are cleaner.
- Labels are longer than the edges — text挤压 diagram.
- The same information fits in a 4-row table.

Keep diagrams under 12 nodes. Beyond that, split across diagrams or use a hybrid approach.

### Color as Signal, Not Decoration

Every color change must carry meaning:

- Green/blue/amber/red for status (working/broken/warn/blocked).
- Accent color for interactive elements or primary actions.
- Neutral for everything else.

Never use color alone to convey meaning — pair with text labels or icons.

### Quality Tests

Before delivering, run two quick checks:

**Squint test**: Close your eyes, squint at the artifact. What jumps out? If the answer is not the primary intent, the visual hierarchy is misaligned.

**Swap test**: Switch to dark/light mode. Does every element remain legible and correctly tiered? If something disappears or changes meaning, the contrast is insufficient.
