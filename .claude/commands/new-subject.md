---
description: Creates a new subject folder with DannLearn's standard resources and artifact structure.
argument-hint: <subject-name>
---

# /new-subject

Create a new subject workspace.

User argument:

```text
$ARGUMENTS
```

## Procedure

1. Read `AGENTS.md`.
2. Read `CLAUDE.md`.
3. Treat `$ARGUMENTS` as the subject name.
4. Convert the subject name into a readable folder name:
   - Preserve meaningful capitalization when the user provides it.
   - Remove characters that are unsafe for filenames.
   - Use spaces only if the user clearly used a formal subject title; otherwise
     prefer a simple readable name.
5. Refuse to overwrite an existing subject folder. If a close match exists, show
   the existing folder and ask whether the user meant that subject.
6. Create:

```text
Subjects/<Subject>/
Subjects/<Subject>/resources/
Subjects/<Subject>/resources/raw/
Subjects/<Subject>/resources/processed/
Subjects/<Subject>/reviewers/
Subjects/<Subject>/quizzes/
Subjects/<Subject>/flashcards/
Subjects/<Subject>/practice-sets/
Subjects/<Subject>/notes/
Subjects/<Subject>/index.md
```

7. Populate `index.md` from `templates/subject-index.md`, replacing the title.

## Output Format

After creating the subject, report:

- subject created
- folder path
- next manual step: add raw resources to `resources/raw/`
- suggested next command: `/process-resource <subject> <resource>`

## Safety Rules

- Do not create generated reviewers, quizzes, flashcards, or practice sets.
- Do not move user resources.
- Do not overwrite an existing subject.

