---
description: Report-only status for one subject or all subjects, including resources, artifact versions, and likely gaps.
argument-hint: [subject]
---

# /subject-status

Report the current state of a subject.

User argument:

```text
$ARGUMENTS
```

This is a report-only command. Do not edit files.

## Procedure

1. Read `AGENTS.md`.
2. Read `CLAUDE.md`.
3. If `$ARGUMENTS` is empty, report all subject folders under `Subjects/`.
4. If a subject is provided, find the best matching folder under `Subjects/`.
   - Prefer exact match.
   - If multiple folders match, list candidates and ask the user to choose.
   - If no match exists, show available subjects.
5. For each target subject, inspect:
   - `resources/raw/`
   - `resources/processed/`
   - `reviewers/`
   - `quizzes/`
   - `flashcards/`
   - `practice-sets/`
   - `notes/`
   - `index.md`
6. Report versioned artifact folders such as:

```text
quizzes/cell-biology/quiz.v001.json
quizzes/cell-biology/quiz.v002.json
```

7. Flag likely gaps:
   - raw resources with no processed resource
   - processed resources with no reviewer
   - reviewer topics with no quiz
   - reviewer topics with no flashcards
   - quizzes or flashcards with no practice set
   - missing source provenance in JSON files, if quickly visible

## Output Format

```text
# Subject Status: <Subject>

## Resources
Raw:
- <file>

Processed:
- <file>

## Generated Artifacts
Reviewers:
- <topic>: <versions>

Quizzes:
- <topic>: <versions>

Flashcards:
- <topic>: <versions>

Practice Sets:
- <topic>: <versions>

## Likely Gaps
- <gap>

## Suggested Next Command
/<command> <args>
```

## Safety Rules

- Report only.
- Do not create, edit, move, or delete files.
- Treat resources and notes as private.

