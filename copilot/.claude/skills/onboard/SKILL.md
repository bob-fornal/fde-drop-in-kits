---
name: onboard
description: Map an unfamiliar repository and propose evidence-backed agent instructions.
---
# Blind Codebase Onboarding

1. Read existing agent instructions and inspect manifests, lockfiles, runtime
   versions, Dockerfiles, CI workflows, and documented environment requirements.
   Never read or expose secret values.
2. Locate entry points, routes, data models and migrations, integrations, and
   test directories. Cite paths; mark uncertain or missing components as unknown.
3. Identify install, test, lint, typecheck and build commands from project
   configuration. Run applicable safe checks when authorized and feasible; record
   failures and missing prerequisites. Do not execute destructive commands.
4. Draft an `AGENTS.md` update with verified commands and up to five architecture
   bullets, keeping the root file under 150 lines. Preserve existing instructions;
   distinguish inferred or untested commands from verified ones. Ask for review
   before replacing conflicting or unverified guidance.
5. Report evidence, assumptions, risks, checks/results, blockers and owner/next
   action; mark missing information unknown. Use `/fde-engagement` for access
   readiness and client ownership.
6. When documentation is in scope, use `/document-slices` to map relevant
   vertical slices and verified source locations; do not overwrite existing docs.
   For a project-wide map, enumerate journeys and report unmapped areas.
