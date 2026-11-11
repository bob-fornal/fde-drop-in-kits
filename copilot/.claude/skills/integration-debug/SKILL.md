---
name: integration-debug
description: Investigate integration failures safely using evidence across system boundaries.
---
# Integration Debugging

1. Clarify the failing flow, expected behavior, environment, timing and impact.
   Identify boundary owners and existing contracts without exposing credentials.
2. Reproduce in a safe environment with synthetic or redacted inputs. Capture
   sanitized request/response shape, status, timestamps and correlation IDs;
   never copy customer payloads or secrets into reports.
3. Trace the boundary using authorized logs, metrics and traces. Check timeouts,
   retries, idempotency, rate limits, authentication, configuration and version
   mismatches. Distinguish observed facts from hypotheses and external unknowns.
4. Use existing tests and mocks to isolate the failure. Do not call production,
   change remote state, or send data to third parties without explicit approval.
5. Report evidence, assumptions, risks, checks/results, blockers and responsible
   owner/next action. Recommend a regression test and monitoring or escalation
   steps; do not claim a root cause until verified.
