# Slice record schema

Use YAML front matter for retrieval, followed by concise Markdown if the project
permits this format. `lines` are inclusive 1-based positions in the inspected
tree. `revision` identifies the base commit; `worktree` describes relevant dirty
files or `clean`. Symbol names and paths allow relocation when lines shift.
Do not treat a recorded position or inference as current without verification.

```yaml
---
slice: checkout
intent: Calculate the total for a checkout.
revision: "<inspected commit or unknown>"
worktree: "<clean, relevant modified paths, or unknown>"
entries:
  - path: checkout.py
    symbol: checkout_total
    lines: "4-5"
    role: entry
    intent: Sum item totals for checkout.
    evidence: "checkout.py:4-5"
  - path: service.py
    symbol: display_total
    lines: "1-2"
    role: business-logic
    intent: Multiply quantity by price.
    evidence: "service.py:1-2"
  - path: test_checkout.py
    symbol: CheckoutTest.test_total
    lines: "7-8"
    role: test
    intent: Check the total for one item.
    evidence: "test_checkout.py:7-8"
unknowns: []
---
```

The example describes the synthetic `tests/fixtures/legacy-app` project when
that folder is the repository root; verify positions against its current state.
Add contracts, callers, side effects, errors, checks and cross-slice references
as applicable. Use `unknown` rather than invented values; keep sensitive data out.
