---
name: refactor-safe
description: Refactor without changing behavior or public contracts.
---
# Behavior-Preserving Refactoring

1. Establish a passing baseline with the project's relevant existing tests; if
   they fail or cannot run, stop and report the blocker before refactoring.
2. Trace callers and public signatures with `/blast-radius`; add characterization
   tests for gaps where feasible.
3. Make small, independently verifiable changes and rerun affected tests after
   each step. Commit atomically only when requested or permitted.
4. Verify public API signatures and observable behavior remain unchanged; report
   any unavoidable contract change for approval instead of silently proceeding.
