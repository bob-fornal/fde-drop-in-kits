---
name: wrapup
description: Prepare an evidence-based handoff and concise pull request description.
---
# Delivery Handoff

1. Review the issue, diff, verification results and any architectural decisions.
2. Update affected project documentation when appropriate; record edge cases,
   compatibility, operational risks and follow-up work without exposing secrets.
3. Remove only temporary files created for this task, preserving pre-existing work.
4. Draft a PR description with summary, motivation, tests and their results,
   limitations, and deployment or rollback notes when relevant. Do not claim
   checks passed or changes were deployed without evidence.
5. Record evidence, assumptions, risks, checks/results, blockers and owner/next
   action; hand operational follow-ups to the agreed client owner or mark unknown.
6. Where documentation updates are authorized, use `/document-slices` to check
   affected slice records against current source and flag stale positions.
