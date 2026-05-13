# Security

`html-explainer` is a local Claude Code skill and installer. It does not run a server and does not collect telemetry.

## Reporting

Please report security issues privately to the maintainer before opening a public issue.

If no private channel is available, open a GitHub issue with minimal reproduction details and avoid posting secrets.

## Scope

Relevant issues include:

- installer behavior that overwrites unrelated user files;
- unsafe shell behavior;
- secret leakage in generated artifacts;
- malicious example content;
- unsafe dependency download behavior.

## Installer Safety

The installer supports:

- `DRY_RUN=1`;
- backups before replacing managed files;
- temporary `CLAUDE_HOME` for smoke testing;
- opt-in external example download with `FETCH_EXAMPLES=1`.

Do not paste API keys, tokens, private keys, or production secrets into generated HTML artifacts.
