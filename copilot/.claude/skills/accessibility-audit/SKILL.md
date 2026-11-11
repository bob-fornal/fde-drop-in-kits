---
name: accessibility-audit
description: Audit user-facing changes for accessibility and report reproducible barriers.
---
# Accessibility Audit

1. Establish scope, supported platforms and the project's accessibility target;
   use WCAG 2.2 AA as the review target if none is specified, without claiming
   conformance. Inspect existing instructions, UI components, tests and `DESIGN.md`
   if present. Include relevant loading, error, empty and responsive states.
2. Review native semantics, accessible names and labels, heading order, form
   instructions and errors, keyboard operation and focus order/visibility,
   dialogs, status announcements and accessible alternatives for visual content.
   Check text contrast (normally 4.5:1; 3:1 for large text) and non-text
   contrast (normally 3:1), zoom/reflow, motion preferences and touch targets.
   Check applicable WCAG exceptions instead of treating ratios as the whole standard.
3. Use existing accessibility and UI tests when available. Manually exercise
   keyboard-only navigation, focus, zoom and screen-reader behavior where feasible.
   Automated scans find only some barriers: record browser, assistive technology,
   viewport, test states, commands and unavailable checks.
4. Report each finding with affected path or page, steps, observed and expected
   behavior, impact, applicable criterion, severity and suggested remediation.
   Separate verified findings from hypotheses; do not claim compliance based only
   on automated checks. Re-test changed flows after fixes.

For broader specialist coverage, see the independently maintained
[Community Access accessibility-agents](https://github.com/Community-Access/accessibility-agents).
Its plugin, scanners and edit gates are optional and are not installed or enforced
by this kit. Review their permissions and data handling before use.
