# Research Lane Web Setup

A secondary operator lane often needs current web context. Treat that as a small operations project, not just an API key pasted into a config file.

## Recommended pattern

- Separate search and extraction responsibilities.
- Store credentials in private env files or supported secret stores.
- Restrict credential file permissions.
- Smoke-test search and extract paths before relying on them.
- Expose non-secret usage metadata such as backend name, result count, and request count so answers can be audited.
- Do not print API keys, tokens, raw headers, or full quota/account payloads in closeouts.

## Validation checklist

```text
[ ] search backend returns current results
[ ] extract backend reads a known page
[ ] provider metadata is visible without secrets
[ ] credential file is private
[ ] restart/reload plan is approved if the running service must reload config
[ ] closeout says which backend was used
```

## Why this is share-worthy

Operator research quality depends on knowing whether the assistant used a stale memory, a search backend, an extraction backend, or a fallback provider. Backend visibility improves trust without exposing secrets.
