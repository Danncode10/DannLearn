# DannLearn

DannLearn is an AI-native learning workspace for turning subject resources into
reviewers, quizzes, flashcards, and study notes.

The starter is intentionally content-first. Source materials live under
`Subjects/`, while reusable workflow guidance lives in `.claude/`, `.codex/`,
`templates/`, and `docs/dannlearn_docs/`.

## Core Idea

```text
Subjects/
  <SubjectName>/
    resources/
      raw/
      processed/
    reviewers/
    quizzes/
    flashcards/
    notes/
    index.md
```

Resources are the source of truth. Generated reviewers, quizzes, and flashcards
should be grounded in those resources and include source provenance.

## Repository Areas

| Path | Purpose |
|---|---|
| `Subjects/` | User/project-specific study content. Not upstream by default. |
| `templates/` | Reusable markdown shapes for subjects, reviewers, quizzes, and flashcards. |
| `docs/dannlearn_docs/` | Methodology and maintainer docs for DannLearn. |
| `.claude/` | Claude Code project context, future agents, and future commands. |
| `.codex/` | Codex compatibility notes for working with DannLearn. |
| `dannlearn.json` | Version anchor for future upstream sync workflows. |

## Current Status

This repo currently contains the foundation only. Slash commands are planned but
not yet created.

