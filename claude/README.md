# Claude Code Blind Drop-In Kit

Merge the contents of this folder into the target repository root after reviewing
existing `CLAUDE.md`, `AGENTS.md`, `REVIEW.md`, and `.claude/` files. Never
overwrite existing project instructions. Copy `.claude/skills/<name>/` into
`~/.claude/skills/` instead for personal use. Copy the role wrappers in
`.claude/agents/` along with the skills they reference.
Agent files use `{name}.agent.md`; their front-matter names remain unchanged.
When updating an existing install, review and remove only superseded kit-owned
agent files to avoid duplicate definitions.

Review any existing `DESIGN.md` before merging the empty starter. The three
layers are `AGENTS.md` (behavior), `SKILL.md` (procedures), and `DESIGN.md`
(visual intent and YAML tokens). Use `/manage-design` to discover and document
approved values, `/design-ui-component` for UI changes, and
`/accessibility-audit` for accessibility checks. The design and accessibility
agents wrap these skills; they do not enforce permissions or WCAG conformance.
Stack-specific guidance is in `.claude/skills/manage-design/references/stacks.md`.

Run `/onboard` to discover the stack and propose verified commands and
architecture. Use `/blast-radius` before changes, `/repro` for bugs,
`/implement-issue` and `/tdd` for implementation, `/reflect` for checkpoints,
and `/wrapup` for handoff. Other skills cover the remaining SDLC phases.
Skills are also readable as runbooks directly.

The role wrappers define behavioral boundaries, not a security sandbox. Review
the tool permissions and configure actual access controls appropriate to the
environment, particularly before granting shell or write access.
