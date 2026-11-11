---
name: repro
description: Turn an issue or stack trace into a minimal reproducible failing test.
---
# Bug Reproduction

1. Read the report and relevant code; remove or avoid exposing sensitive data from
   logs and fixtures. State assumptions and ask for missing reproduction details.
2. Trace the failure and identify the smallest safe existing test harness and
   inputs. Do not use production services or mutate customer data.
3. Add a minimal isolated regression test in the project's test conventions,
   without changing production code. Run it and confirm it fails for the reported
   reason; record the command and failure.
4. If the test cannot run or no harness exists, report the blocker and provide
   reproduction steps without claiming the bug is confirmed.
