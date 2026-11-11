# FDE Blind Drop-In Kit

A stack-neutral starting point for safely discovering and changing an unfamiliar
repository with Copilot or Claude Code. The files are starting points, not a
substitute for the client project's instructions or approval process.

## Install

1. Review the target project's existing `AGENTS.md`, `REVIEW.md`, `.github/`
   and `.claude/` files. Merge the relevant instructions rather than overwriting
   them; preserve existing rules and resolve conflicts with the project owner.
2. Copy the desired directories from `.claude/skills/` into the project's
   `.claude/skills/` for repository use, or into `~/.claude/skills/` for
   personal use. Copy the Claude role wrappers in `.claude/agents/` if useful.
   The wrappers reference the shared skills; install those skills too.
3. Adapt `AGENTS.md`, `REVIEW.md`, and `.github/copilot-instructions.md` to the
   project. Run `/onboard` and review its evidence and proposed changes before
   accepting project-specific commands or architectural claims.
4. If using Copilot cloud, adapt `.github/workflows/copilot-setup-steps.yml`
   to the project's actual runtime and lockfile. It is intentionally a no-op
   here because this kit has no dependencies. Copilot picks it up from the
   default branch. Do not copy a guessed `npm ci` into a non-Node project.

Skill invocation and custom-agent support depend on the client and its
configuration. Skills are also readable as runbooks directly. Invoke a skill
with its `/name` where supported, or explicitly ask the agent to follow its
`SKILL.md`. Role wrappers are Claude custom agents; adapt them to your tool's
supported format and permissions before using them elsewhere.

## Workflow

Start with `/onboard`, then `/write-spec` for an ambiguous issue and
`/blast-radius` for the intended changes. Use `/repro` for bugs,
`/implement-issue` and `/tdd` for implementation, `/reflect` during longer
sessions, and `/wrapup` for handoff. The remaining skills cover architecture,
safe refactoring and migrations, coverage, security, releases and incidents.
Each skill records what to do when a command, tool, or prerequisite is missing.

This repository contains documentation and agent instructions only: there is no
application, dependency installation, build, linter, or test suite. Verify the
kit's Markdown, front matter, links and workflow structure when changing it.
Do not treat example project commands as verified commands.

## Optional automation

Issue triage is deliberately not enabled by default. Before adding an
`issue-triage-agent.yml` workflow, agree on the triggering events, permissions,
trusted actors, how issue text is handled as untrusted input, and whether the
agent may comment or assign issues. A workflow with write access or an AI
service should be reviewed and approved for the target repository.
