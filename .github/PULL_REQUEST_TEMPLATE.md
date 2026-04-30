## Summary

- 

## Type of change

- [ ] Documentation correction
- [ ] New operator pattern
- [ ] Template/example update
- [ ] Safety/redaction improvement
- [ ] Tooling or validation script

## Validation

- [ ] `python3 scripts/check_markdown_links.py .`
- [ ] `bash scripts/redaction_scan.sh .`
- [ ] I manually reviewed any redaction scan hits.

## Public-safety checklist

- [ ] No secrets, tokens, OAuth files, cookies, webhooks, or private keys.
- [ ] No private hostnames, account IDs, channel IDs, private paths, or internal endpoints.
- [ ] Conceptual files are clearly labeled as conceptual and not real config schemas.
- [ ] OpenClaw behavior claims are backed by official docs, local command evidence, or clearly labeled as operator pattern.
