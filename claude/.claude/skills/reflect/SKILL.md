---
name: reflect
description: Audit ongoing work against the original request and working-tree state.
---
# Self-Correction Checkpoint

Compare the original request, current plan, `git status` and diff. Before
continuing or handing off, explicitly check each item:

- [ ] Every requirement is addressed or identified as outstanding.
- [ ] Changes are scoped; unrelated or pre-existing edits are preserved.
- [ ] Assumptions, edge cases and compatibility risks are recorded.
- [ ] Relevant tests and checks ran, or failures and blockers are reported.
- [ ] No secrets, generated artifacts or temporary tracking files were added.
- [ ] Documentation and handoff reflect actual behavior and known limitations.

Report the evidence and any unchecked items. Correct task-owned mistakes rather
than hiding failures or discarding other people's work.
