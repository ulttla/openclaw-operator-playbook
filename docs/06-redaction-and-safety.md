# Redaction and Safety

Before publishing any setup file, remove or replace private operational details.

## Never publish

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

## Fast scan patterns

These commands are not a complete security audit, but they catch common mistakes before a public push.

```bash
rg -n --hidden --glob '!.git/**' \
  '(api[_-]?key|token|secret|password|oauth|cookie|webhook|bearer|private[_-]?key)' .

rg -n --hidden --glob '!.git/**' \
  '([0-9]{17,20}|[A-Za-z0-9_=-]{32,}|https://discord.com/api/webhooks/)' .

rg -n --hidden --glob '!.git/**' \
  '(/Users/[^ ]+|~/.ssh|tailscale|\.local|192\.168\.|10\.|172\.(1[6-9]|2[0-9]|3[0-1])\.)' .
```

Review matches manually. Some strings, such as placeholder examples, may be intentional.

## Recommended pre-push checklist

- [ ] No real secrets or OAuth artifacts.
- [ ] No private channel IDs or webhook URLs.
- [ ] No real local paths or hostnames.
- [ ] No raw config dump from a live system.
- [ ] Conceptual config templates are labeled as conceptual.
- [ ] Official OpenClaw behavior is not overstated.
- [ ] Git author metadata is acceptable for public release.
- [ ] A reviewer or second pass checked public-facing claims.
