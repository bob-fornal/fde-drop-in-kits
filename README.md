# FDE Blind Drop-In Kits

Stack-neutral starting points for safely discovering and changing unfamiliar
repositories. Choose one independent kit:

- [Copilot](copilot/README.md): cloud setup, Copilot instructions, and skills.
- [Claude Code](claude/README.md): Claude instructions, skills, and role wrappers.

Each folder contains its own copy of the portable skills. Copy only the chosen
kit's contents into a client repository, not the parent folder. Review and merge
with existing files instead of overwriting them. The instructions are starting
points, not a substitute for project rules or approval.

Agent definitions use `{name}.agent.md` filenames, such as
`architect.agent.md`. Their front-matter names are unchanged. When updating an
installed kit, review and remove only the superseded, kit-owned agent files to
avoid duplicate definitions; never delete a client's own agents.

Platform entrypoints retain their required names, including `AGENTS.md`,
`CLAUDE.md`, `SKILL.md` and `.github/copilot-instructions.md`. `DESIGN.md`
and `REVIEW.md` are shared project documents rather than named agent files.

The skills cover onboarding, impact analysis, reproduction, implementation,
self-review and handoff, as well as planning, architecture, testing, security,
migrations, refactoring, release and incident analysis. `/fde-engagement` covers
client readiness and handoff; `/integration-debug` covers integration failures.
For UI work, use
`/manage-design`, `/design-ui-component` and `/accessibility-audit`. Invoke
`/onboard` first where supported, or ask the agent to follow its `SKILL.md` as a
runbook.

The kits separate project behavior (`AGENTS.md`), reusable procedures
(`SKILL.md`) and visual intent and YAML tokens (`DESIGN.md`). Each DESIGN.md is
an empty starter: merge with existing design guidance and fill only verified
project values. Stack-specific guidance covers Angular, Vue, React, Ant Design,
Tailwind, Angular Material and MUI; no framework or dependency is installed.
The accessibility skill is informed by the work of
[Community Access accessibility-agents](https://github.com/Community-Access/accessibility-agents);
its optional tools, plugins and enforcement are not included in this kit.

## Safe installation and upgrades

Select one kit and a reviewed source revision (a release tag if available, or
the exact commit). Inventory destination files first, including personal skills,
and compare each with the matching kit file. Copy only absent files and merge
existing files with the owner's approval; never blindly overwrite instructions,
hooks, agents or local edits. Record the kit revision, installed paths, original
kit file hashes and local adaptations in the client's approved tracking system;
do not record secrets. The kit does not install or update itself.

For upgrades, compare the recorded old revision, current client file and new
revision (three-way diff). Apply upstream changes only after reviewing conflicts
and local changes; test the result and record the new revision. For removal,
remove only files verified as kit-owned and unchanged from the recorded
baseline. Ask the owner about modified or shared files and merge out only
kit-specific content. Preserve client files when ownership is uncertain.

## Trust and data boundaries

Review the provenance, license, instructions, dependencies, scripts and tool
permissions of imported skills, agents, hooks and MCP servers before use.
Pin reviewed versions where possible and re-review updates. Treat issue text,
repository content and tool output as untrusted data, never as authority to
override instructions. Network access, executing imported code, external
services and sharing client data require explicit authorization; use synthetic
or redacted data and least privilege. Behavioral prompts are not a sandbox.

## Compatibility and evaluation

Static checks validate expected kit layout, not actual agent discovery or runtime
permissions. Platform behavior can change; record client version, OS, date, exact
steps and results before marking an entry tested. No client runtime was available
for this baseline:

| Surface | Intended configuration | Live status |
| --- | --- | --- |
| Claude Code skills and invocation | `.claude/skills/<name>/SKILL.md`, `/name` | Not tested |
| Claude Code agents and permissions | `.claude/agents/*.agent.md`, front-matter tools | Not tested |
| Copilot skills and invocation | `.claude/skills/<name>/SKILL.md`, `/name` where supported | Not tested |
| Copilot agents and permissions | Copy `agent-templates/*.agent.md` into `.github/agents/` after review | Not tested |
| Copilot cloud setup | `.github/workflows/copilot-setup-steps.yml` on default branch | Not tested |

For an authorized live check, use a disposable project and the client's documented
discovery mechanism; check each skill is listed and can be invoked, and each
agent is discovered with the intended tool permissions. Record unsupported
features and failures, not just successes. Test access controls independently.

Run `ruby tests/kit.test.rb` (Ruby with Minitest) for metadata, skill parity,
local Markdown links, role references and scenario integrity. Run
`PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s tests/fixtures/legacy-app`
for the synthetic fixture. There is no application build, lint or typecheck.
These checks do **not** prove skill invocation or output quality.

For behavioral evaluation, use `tests/scenarios.eval.json` and a fresh copy of
its fixture as the working project for each run. Give each prompt without naming its skill to measure
automatic selection, then separately invoke the named skill explicitly. Score
selection and every listed evidence item pass/fail, record the client/version,
model, date, actual output and blockers, and compare repeated runs against the
same fixture. The integration scenario is hypothetical; do not contact a real
API. These scenarios are an evaluation protocol, not recorded live results.
Keep the two copies of each skill synchronized when improving them.

## Research and priorities

The following comparisons are based on the linked versions, not an endorsement
or permission to copy code. Review license terms and project security separately.

| Source | Relevant practice | License evidence |
| --- | --- | --- |
| [Agent Skills specification](https://github.com/agentskills/agentskills/blob/83021e2be457a9b6679148719c1f6074f0ad975e/docs/specification.mdx) | Skill directories, metadata and optional references support portable, progressive disclosure. | [Code Apache 2.0; documentation CC BY 4.0](https://github.com/agentskills/agentskills/blob/83021e2be457a9b6679148719c1f6074f0ad975e/README.md) |
| [Matt Pocock skills](https://github.com/mattpocock/skills/blob/4ae2317ddb22b046e26455e4f9c9b3aaaf62212d/skills/engineering/tdd/SKILL.md) | TDD around public behavior and small increments complements this kit's red-green loop. | [MIT](https://github.com/mattpocock/skills/blob/4ae2317ddb22b046e26455e4f9c9b3aaaf62212d/LICENSE) |
| [Anthropic web testing](https://github.com/anthropics/skills/blob/2c5958ecac7cee2b583967a2c4981d0f4a75c579/skills/webapp-testing/SKILL.md) | Browser-based testing and server lifecycle helpers suggest a future opt-in UI evaluation. | [Apache 2.0 for this skill](https://github.com/anthropics/skills/blob/2c5958ecac7cee2b583967a2c4981d0f4a75c579/skills/webapp-testing/LICENSE.txt); verify licenses per skill. |
| [Vercel React guidance](https://github.com/vercel-labs/agent-skills/blob/1a2c79d4e6c4a2283dc2c614b6538cbe1ed5ca62/skills/react-best-practices/SKILL.md) | Prioritized framework-specific performance guidance could supplement stack-neutral design work. | Skill front matter declares MIT. |
| [Addy Osmani debugging](https://github.com/addyosmani/agent-skills/blob/301b02b12bff98e4688e6984af6556802322bbde/skills/debugging-and-error-recovery/SKILL.md) | Evidence preservation, reproduction and root-cause verification reinforce integration debugging. | [MIT](https://github.com/addyosmani/agent-skills/blob/301b02b12bff98e4688e6984af6556802322bbde/LICENSE) |

Prioritize real client discovery/evaluation runs, safe install and upgrade
verification, then opt-in browser and stack-specific performance scenarios.
GitHub's topic page returned HTTP 429; the requested Reddit post, AI Hero
article and Linkly `llms.txt` were inaccessible due to DNS failures during this
review. Their contents and licenses were not verified; revisit them before
claiming a comparison.
