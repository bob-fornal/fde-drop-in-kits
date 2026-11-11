---
name: blast-radius
description: Trace dependencies, contracts, and coverage before changing unfamiliar code.
---
# Blast Radius Analysis

1. Identify the target symbols and search imports, references and upstream callers,
   including indirect or dynamically resolved uses where possible.
2. Trace downstream consumers, shared state, database schemas and public API or
   serialization contracts. Note external consumers that cannot be inspected.
3. Find tests for the target and affected callers; identify missing coverage.
4. Before editing, report affected files, breaking-change risks, coverage gaps and
   unknowns with supporting paths. Revisit the analysis if scope changes.
