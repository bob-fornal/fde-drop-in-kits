---
name: tdd
description: Use a red-green-refactor loop for behavior changes.
---
# Test-Driven Development

1. Write a focused test for one acceptance criterion using the existing harness.
2. Run it and verify it fails for the intended behavioral reason, not a setup
   error. Capture the command and result.
3. Write the smallest implementation that passes; rerun the test, then refactor
   without changing behavior. Run relevant existing checks.
4. Repeat for edge cases. If a red phase or test harness is unavailable, explain
   the limitation rather than claiming TDD was completed.
