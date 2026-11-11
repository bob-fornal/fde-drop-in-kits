# Copilot Blind Drop-In Kit

Merge the contents of this folder into the target repository root after reviewing
existing `AGENTS.md`, `REVIEW.md`, `.github/`, and `.claude/` files. Never
overwrite existing project instructions. Copy `.claude/skills/<name>/` into
`~/.claude/skills/` instead for personal use where the client supports it.

Review any existing `DESIGN.md` before merging the empty starter. The three
layers are `AGENTS.md` (behavior), `SKILL.md` (procedures), and `DESIGN.md`
(visual intent and YAML tokens). Use `/manage-design` to discover and document
approved values, `/design-ui-component` for UI changes, and
`/accessibility-audit` for accessibility checks. Stack-specific guidance is in
`.claude/skills/manage-design/references/stacks.md`.

The optional `agent-templates/` directory contains Copilot custom-agent
definitions for design and accessibility; it is not automatically discovered.
After reviewing and adapting their tools for the target client, copy the desired
`.agent.md` files into the target repository's `.github/agents/` directory.
The templates are behavioral guidance, not access controls or a WCAG
conformance guarantee.

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
