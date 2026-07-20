---
description: Report-only reviewer quality check for coverage, grounding, citations, ambiguity, and missing source support.
argument-hint: <subject> [reviewer]
---

# /reviewer-check

Check a reviewer without editing it.

User argument:

```text
$ARGUMENTS
```

This is a report-only command. Do not edit files.

## Procedure

1. Read `AGENTS.md`.
2. Read `CLAUDE.md`.
3. Parse `$ARGUMENTS` as `<subject> [reviewer]`.
4. Find the subject folder.
5. Find the reviewer topic/version.
   - If no reviewer is provided, check the latest reviewer for each topic.
   - If a topic is provided, check its latest version unless the user names a
     specific file.
6. Read the reviewer JSON.
7. Read referenced sources where available.
8. Compare reviewer content against sources.
9. Check:
   - unsupported claims
   - missing or weak source references
   - missing major topics from processed resources
   - unclear explanations
   - repeated concepts
   - passive summary sections that need recall prompts
   - Mermaid syntax risk, if diagrams are present
   - JSON shape consistency with `docs/dannlearn_docs/artifact-json.md`

## Output Format

```text
# Reviewer Check: <Subject> / <Reviewer>

## Verdict
READY / NEEDS FIXES / BLOCKED BY SOURCES

## Must Fix
- <issue> -> <suggested fix>

## Should Improve
- <issue> -> <suggested fix>

## Source Gaps
- <gap>

## Good Parts
- <specific useful choice>

## Suggested Next Command
/<command> <args>
```

## Safety Rules

- Report only.
- Do not modify reviewer JSON or sources.
- Do not treat unreferenced facts as valid unless sources support them.

