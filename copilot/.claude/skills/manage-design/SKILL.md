---
name: manage-design
description: Discover, create, and maintain an evidence-backed DESIGN.md design system.
---
# Manage DESIGN.md

1. Read `AGENTS.md`, existing `DESIGN.md` and design instructions, manifests,
   component libraries, theme configuration, styles and documentation. Identify
   the framework and installed library versions; do not assume one.
2. If `DESIGN.md` is absent, use the kit's template when available or draft
   YAML front matter containing a `tokens` mapping and Markdown design intent.
   Preserve existing files and use verified values only. Leave unknown tokens
   absent and list decisions requiring a designer or project owner.
3. Record token names and values, sources of truth, modes, component rules,
   responsive behavior, accessibility requirements and prohibited patterns.
   Do not replace the implementation's theme files with `DESIGN.md` or invent
   brand identity. Resolve conflicting sources with the owner before changing them.
4. Consult [stack guidance](references/stacks.md) for Angular, Vue, React,
   Ant Design, Tailwind, Angular Material and MUI. Apply only relevant installed
   versions and combinations; reuse the project's token and component mechanisms.
5. After approved changes, keep the document and actual theme consistent. Run
   existing project checks and any already-installed DESIGN.md validator using
   its documented command. Report missing tooling, unresolved values and checks
   not run; do not install a validator or claim validation without evidence.
