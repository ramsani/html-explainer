# Skill Structure

Use this when adding or extending a skill.

Skills are folders. The only required file is `SKILL.md`.

```text
skills/<skill-name>/
  SKILL.md
  assets/       optional images, icons, or visual references
  references/   optional supporting docs
  DESIGN.md     optional design tokens for this skill
```

Keep a skill small. Add optional folders only when the skill actually uses them.

`DESIGN.md` may use the 9-section design-token schema from `patterns/05-design-token-contact-sheet.md`.

Do not add PDF export, external design-system fetchers, or network-dependent assets as default skill behavior. Those are future capabilities, not V1 requirements.
