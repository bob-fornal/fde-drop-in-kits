---
name: migrate-db
description: Plan and verify backward-compatible database schema changes.
---
# Safe Schema Evolution

Inspect schema, migration conventions, consumers and deployment order. Identify
destructive operations, locking, large-table effects and mixed-version risks.
Prefer expand/backfill/contract changes and verify compatibility with old and new
application versions. Provide a tested rollback or explicitly document why a
reversible migration is impossible and how to recover. Exercise migrations and
rollback against disposable data when feasible; never run destructive operations
against production without explicit authorization.
