---
name: Pattern request
description: Suggest a new operator pattern, template, or example.
title: "pattern: "
labels: [enhancement]
body:
  - type: textarea
    id: use_case
    attributes:
      label: Use case
      description: What operator workflow should this playbook cover?
      placeholder: A release checklist for public AI workstation repos.
    validations:
      required: true
  - type: textarea
    id: proposed_shape
    attributes:
      label: Proposed shape
      description: Should this be a guide, checklist, template, script, or example?
    validations:
      required: false
  - type: textarea
    id: safety
    attributes:
      label: Safety considerations
      description: What should stay approval-gated or redacted?
    validations:
      required: false
  - type: checkboxes
    id: public_safe
    attributes:
      label: Public-safety check
      options:
        - label: I did not include secrets, tokens, private hostnames, private channel IDs, or private config dumps.
          required: true
