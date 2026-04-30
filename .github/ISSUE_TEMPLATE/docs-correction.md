---
name: Documentation correction
description: Report unclear, stale, or inaccurate playbook guidance.
title: "docs: "
labels: [documentation]
body:
  - type: markdown
    attributes:
      value: |
        Thanks for helping keep the playbook accurate and public-safe.
  - type: input
    id: page
    attributes:
      label: Page or file
      description: Which file, section, or URL needs correction?
      placeholder: docs/04-backup-and-recovery.md
    validations:
      required: true
  - type: textarea
    id: issue
    attributes:
      label: What is wrong or unclear?
      description: Describe the stale claim, unclear wording, or missing caveat.
    validations:
      required: true
  - type: textarea
    id: evidence
    attributes:
      label: Evidence or reference
      description: Link to official docs, command output, or a minimal example. Do not include secrets or private paths.
    validations:
      required: false
  - type: checkboxes
    id: safety
    attributes:
      label: Public-safety check
      options:
        - label: I did not include secrets, tokens, private hostnames, private channel IDs, or private config dumps.
          required: true
