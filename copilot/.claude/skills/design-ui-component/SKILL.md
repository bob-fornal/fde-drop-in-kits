---
name: design-ui-component
description: Build or update accessible UI using the project's DESIGN.md and existing components.
---
# Design UI Component

1. Read `AGENTS.md`, `DESIGN.md`, relevant task requirements and existing
   components, theme configuration and tests. If the design file or a needed
   token is missing, use `/manage-design` to discover it or ask the owner; do
   not silently invent brand decisions.
2. Identify the installed framework and library and consult
   `.claude/skills/manage-design/references/stacks.md`. Reuse existing primitives
   and theme mechanisms; follow documented tokens, responsive rules and
   anti-patterns. Never assume React, Tailwind or a specific library version.
3. Implement all relevant states with semantic elements, keyboard operation,
   visible focus, accessible names and contrast. Apply `/accessibility-audit`;
   preserve existing behavior and avoid adding dependencies without approval.
4. Run existing component, accessibility and design validation checks if
   available, and manually check representative states and viewports. Report
   results, unverified states and any design conflicts instead of asserting
   visual or accessibility conformance without evidence.
