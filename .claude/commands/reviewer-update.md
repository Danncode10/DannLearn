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
6. Read the latest reviewer Markdown version.
7. Read processed source files referenced by the latest reviewer.
   If those sources are missing or no longer processed, stop and recommend
   `/process-resource` before updating.
8. Check for newer or additional files in:
   - `resources/processed/`
   - `notes/`
9. Create the next version:

```text
Subjects/<Subject>/reviewers/<topic-slug>/reviewer.vNNN.md
```

10. Preserve useful structure from the previous reviewer, but update:
   - sources
   - sections
   - key concepts
   - source gaps
   - quote notes
   - visual search suggestions
   - clearly labeled learner-supporting context

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
- Do not invent course facts to fill gaps. Keep learner-supporting context
  visibly labeled and separate from source-grounded claims.
