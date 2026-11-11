# Copilot Blind Drop-In Kit

Merge the contents of this folder into the target repository root after reviewing
existing `AGENTS.md`, `REVIEW.md`, `.github/`, and `.claude/` files. Never
overwrite existing project instructions. Copy `.claude/skills/<name>/` into
`~/.claude/skills/` instead for personal use where the client supports it.

Run `/onboard` to discover the stack and propose verified commands and
architecture. Use `/blast-radius` before changes, `/repro` for bugs,
`/implement-issue` and `/tdd` for implementation, `/reflect` for checkpoints,
and `/wrapup` for handoff. Other skills cover the remaining SDLC phases.
Skill availability and invocation depend on the client; alternatively ask the
agent to follow the relevant `SKILL.md` directly.

Adapt `.github/workflows/copilot-setup-steps.yml` to the actual runtime and
lockfile. This kit's setup step is intentionally a no-op; it installs nothing.
Copilot reads the workflow from the default branch. Do not assume Node or run
unverified install commands. Keep permissions minimal and obtain approval for
project infrastructure changes.

Issue triage automation is optional and not enabled. Before adding it, agree on
trigger events, permissions, trusted actors, untrusted issue text handling, and
whether it may comment or assign issues. Review any write access or AI service.
For specialized roles, ask the agent to follow the relevant skill and the
constraints in `REVIEW.md`; configure platform-specific agents only after
reviewing the target environment's supported format and permissions.
