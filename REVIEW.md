# Review Standards

- Check the change against the issue and acceptance criteria, including edge cases
  and compatibility with callers, APIs, schemas and existing behavior.
- Require focused tests for new logic and bug fixes where the project supports
  them; check that relevant existing checks ran, or that omissions are explained.
- Review authorization, untrusted input, injection, sensitive data exposure,
  dependency changes and operational or migration risks.
- Verify documentation and rollback or deployment guidance for affected behavior.
- Report actionable findings with severity, location and reproduction; distinguish
  confirmed defects from questions and avoid unrelated style-only feedback.
