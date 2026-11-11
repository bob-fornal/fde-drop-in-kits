# FDE Blind Drop-In Kits

Stack-neutral starting points for safely discovering and changing unfamiliar
repositories. Choose one independent kit:

- [Copilot](copilot/README.md): cloud setup, Copilot instructions, and skills.
- [Claude Code](claude/README.md): Claude instructions, skills, and role wrappers.

Each folder contains its own copy of the portable skills. Copy only the chosen
kit's contents into a client repository, not the parent folder. Review and merge
with existing files instead of overwriting them. The instructions are starting
points, not a substitute for project rules or approval.

The skills cover onboarding, impact analysis, reproduction, implementation,
self-review and handoff, as well as planning, architecture, testing, security,
migrations, refactoring, release and incident analysis. Invoke `/onboard` first
where supported, or ask the agent to follow its `SKILL.md` as a runbook.

This repository contains documentation and configuration only; it has no
application, dependency installation, build, linter or test suite. Keep the two
copies of each skill synchronized when improving them.
