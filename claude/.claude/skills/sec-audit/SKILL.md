---
name: sec-audit
description: Review changes for security and privacy risks before delivery.
---
# Pre-PR Security Audit

Inspect staged and unstaged task changes and their trust boundaries. Check
injection (SQL, shell and HTML), authorization, unsafe deserialization, exposed
secrets or personal data in logs, and dependency or configuration risks.
Use existing security checks where available without exposing sensitive data.
Report a severity-ranked checklist with paths, evidence, impact and remediation;
distinguish verified findings from assumptions and note unrun checks. Escalate
unresolved high-severity issues instead of asserting approval.
