---
name: implement-issue
description: Resolve an issue through scoped planning, testing, implementation, and handoff.
---
# Issue Implementation Loop

1. Read the issue and repository instructions; clarify missing acceptance criteria
   and apply `/blast-radius` before editing. Track atomic steps in `TODO.md` only
   if allowed and absent; otherwise use the available task tracker.
2. Use `/repro` for bugs and `/tdd` for behavior changes. Confirm the new test
   fails for the intended reason before implementing, when practical.
3. Implement the smallest complete change, preserving existing behavior and
   project conventions. Do not alter unrelated tests to force a pass.
4. Run relevant existing tests, lint, typecheck and build; report failures and
   unavailable checks. Apply `/reflect`, remove only task-owned tracking files,
   and use `/wrapup` to prepare the handoff.
5. When documentation is in scope, use `/document-slices` to update affected
   slice records, including shared symbols and changed source positions.
