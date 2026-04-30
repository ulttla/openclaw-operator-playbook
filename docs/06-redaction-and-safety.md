# Redaction and Safety

Before publishing any setup file, remove or replace:

- API keys, tokens, OAuth files, cookies, session IDs.
- Discord, Slack, Telegram, or webhook IDs.
- Private email addresses and account IDs.
- Internal hostnames, IP addresses, Tailscale names, and SSH aliases.
- Real backup destinations.
- Private repository names if they reveal sensitive work.
- Raw prompts containing private context.
- Config fields that grant access or change runtime behavior dangerously.

## Safer replacements

| Private value | Public replacement |
|---|---|
| Real token | `${PROVIDER_API_KEY}` |
| Real channel ID | `DISCORD_CHANNEL_ID_EXAMPLE` |
| Real path | `/path/to/workspace` |
| Real hostname | `example-host` |
| Real email | `you@example.com` |

## Publishing rule

If a file was copied from a live system, treat it as unsafe until reviewed line by line.
