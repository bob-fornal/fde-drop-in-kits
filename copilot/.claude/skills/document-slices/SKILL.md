---
name: document-slices
description: Create or refresh agent-oriented code documentation grouped by vertical slice with verified source locations and intent.
---
# Document Vertical Slices

## Trigger

Use when asked to map, document, or update documentation for a feature, customer
journey, or changed behavior; also use during onboarding and handoff when
documentation work is in scope. Follow project instructions and preserve existing
documentation and user edits. Do not write files unless authorized.

## Procedure

1. Determine slice boundaries from user-visible behaviors, not directories or
   technical layers. For a project-wide request, inventory entry points and
   journeys across the project; group each into a slice, record shared code in
   each relevant slice and mark unmapped areas explicitly. For a scoped request,
   cover only the requested or affected slices. Trace each entry point through
   business logic, persistence, integrations, outputs and tests. If a boundary
   or purpose is uncertain, mark it unknown and ask the owner.
2. Read the actual sources and tests. For every relevant entry, record
   repository-relative file path, qualified function/class/symbol (or file-level
   entry when no symbol exists), inclusive 1-based line range, role and concise
   intent. Include callers, contracts, side effects, errors and test coverage
   where applicable. Cite evidence for intent; distinguish facts from inference.
3. Record the inspected commit revision and whether the working tree is dirty,
   including uncommitted changes relevant to the slice. Line numbers are
   snapshots, not stable identifiers: pair them with paths and symbol names.
   Re-read and verify positions and references against the current tree before
   delivery; mark unresolved or stale entries and never fabricate locations.
4. Prefer the project's existing documentation location and format. Otherwise,
   propose `docs/slices/<slice-name>.slice.md` and obtain authorization before
   creating it. Use [the structured schema](references/slice.schema.md), or map
   its fields into an existing format without overwriting other content. Index
   slices using the existing project index, or propose one if none exists.
5. On change, update all affected slice records, including shared symbols and
   tests; remove or mark obsolete records only after verifying their status.
   Check links, symbol names, line ranges, revision/state and intent against the
   changed sources. Report what was verified, missing coverage and blockers.
   Do not include credentials, customer data or unverified sensitive content.

## Output

Return concise structured results: `status`, `slices`, `evidence`, `unknowns`,
`checks`, and `next_actions`. Include each changed or proposed documentation path.
Use explicit `unknown` or `not_run` for missing evidence or checks; never imply
an agent executed a check it did not run.
