# DannLearn Content Model

DannLearn organizes learning material by subject. Each subject owns its source
resources and generated study artifacts.

## Subject Folder

```text
Subjects/<SubjectName>/
  resources/raw/
  resources/processed/
  reviewers/
  quizzes/
  flashcards/
  practice-sets/
  notes/
  index.md
```

## Resource Lifecycle

1. Add original material to `resources/raw/`.
2. Produce cleaned, grounded extraction in `resources/processed/`.
3. Generate Markdown reviewers from processed resources, with clearly labeled
   learner-supporting context where useful.
4. Generate quizzes and flashcards from resources and reviewers.
5. Run coverage and factual checks before treating artifacts as final.

Reviewers are versioned Markdown artifacts. Quizzes, flashcards, and practice
sets use the JSON contract in `docs/dannlearn_docs/artifact-json.md`.

## Provenance

Generated artifacts should include source file names. When a claim is inferred
rather than directly stated, mark it as an inference.
