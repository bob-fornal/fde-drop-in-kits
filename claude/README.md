# Claude Code Blind Drop-In Kit

Merge the contents of this folder into the target repository root after reviewing
existing `CLAUDE.md`, `AGENTS.md`, `REVIEW.md`, and `.claude/` files. Never
overwrite existing project instructions. Copy `.claude/skills/<name>/` into
`~/.claude/skills/` instead for personal use. Copy the role wrappers in
`.claude/agents/` along with the skills they reference.

Run `/onboard` to discover the stack and propose verified commands and
architecture. Use `/blast-radius` before changes, `/repro` for bugs,
`/implement-issue` and `/tdd` for implementation, `/reflect` for checkpoints,
and `/wrapup` for handoff. Other skills cover the remaining SDLC phases.
Skills are also readable as runbooks directly.

The role wrappers define behavioral boundaries, not a security sandbox. Review
the tool permissions and configure actual access controls appropriate to the
environment, particularly before granting shell or write access.
