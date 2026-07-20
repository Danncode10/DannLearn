---
description: Refreshes an existing reviewer by creating the next version from current resources.
argument-hint: <subject> [reviewer-or-topic]
---

# /reviewer-update

Create an updated reviewer version when resources or processed notes changed.

User argument:

```text
$ARGUMENTS
```

## Procedure

1. Read `AGENTS.md`.
2. Read `CLAUDE.md`.
3. Parse `$ARGUMENTS` as `<subject> [reviewer-or-topic]`.
4. Find the subject folder.
5. Find the reviewer topic under `Subjects/<Subject>/reviewers/`.
   - If no reviewer exists, recommend `/make-reviewer <subject> <topic>`.
6. Read the latest reviewer JSON version.
7. Read source files referenced by the latest reviewer.
8. Check for newer or additional files in:
   - `resources/processed/`
   - `resources/raw/`
   - `notes/`
9. Create the next version:

```text
Subjects/<Subject>/reviewers/<topic-slug>/reviewer.vNNN.json
```

10. Preserve useful structure from the previous reviewer, but update:
   - sources
   - sections
   - key concepts
   - source gaps
   - quality notes
   - provenance

11. Do not mutate older versions.

## Output Format

Report:

- previous version used
- new version created
- changed sources detected
- important changes in the reviewer
- unresolved gaps
- suggested next commands, such as `/reviewer-check`, `/make-quiz`, or
  `/make-flashcards`

## Safety Rules

- Never overwrite older reviewer versions.
- Do not delete stale versions.
- Do not invent facts to fill gaps.

