---
name: fde-engagement
description: Establish safe client engagement, access readiness, and operational handoff.
---
# FDE Engagement

1. Identify the client owner, affected users, decision makers, support and
   escalation contacts. Record desired outcomes, constraints, approvals and
   acceptance criteria; mark unconfirmed ownership as unknown.
2. Inventory environments, dependencies, test accounts, network access,
   permissions, deployment and rollback paths. Request least-privilege access
   through the client's approved process; never collect or record credentials.
3. Determine data classification, retention and sharing rules before accessing
   customer data. Prefer synthetic or redacted data. Obtain explicit approval
   before external services, production access, writes or sharing any data.
4. Establish existing logs, metrics, traces, alerting and a safe way to correlate
   failures. Do not log secrets or personal data; note gaps and escalation paths.
5. Handoff verified behavior, runbooks, decisions, checks, outstanding risks,
   ownership and next actions to named client roles. Do not invent contacts.
6. Report evidence (paths or sanitized observations), assumptions, risks, checks
   and results, blockers, and owner/next action; mark missing information unknown.
