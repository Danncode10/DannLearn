---
description: Report-only overview of all subject folders and their high-level artifact counts.
---

# /list-subjects

This is a report-only command. Do not edit files.

## Procedure

1. Read `AGENTS.md`.
2. Read `CLAUDE.md`.
3. Inspect `Subjects/`.
4. Ignore `Subjects/README.md` and hidden placeholder files.
5. For each subject folder, count:
   - raw resources
   - processed resources
   - reviewer JSON files
   - quiz JSON files
   - flashcard JSON files
   - practice-set JSON files
   - notes
6. Note whether `index.md` exists.

## Output Format

```text
# DannLearn Subjects

| Subject | Raw | Processed | Reviewers | Quizzes | Flashcards | Practice Sets | Notes | Index |
|---|---:|---:|---:|---:|---:|---:|---:|---|
| <subject> | <n> | <n> | <n> | <n> | <n> | <n> | <n> | yes/no |

Notes:
- <short note if no subjects exist or any folder is missing expected structure>
```

## Safety Rules

- Report only.
- Do not create missing folders from this command.

