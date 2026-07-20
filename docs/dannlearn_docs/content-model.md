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
  notes/
  index.md
```

## Resource Lifecycle

1. Add original material to `resources/raw/`.
2. Produce cleaned, grounded extraction in `resources/processed/`.
3. Generate reviewers from raw and processed resources.
4. Generate quizzes and flashcards from resources and reviewers.
5. Run coverage and factual checks before treating artifacts as final.

## Provenance

Generated artifacts should include source file names. When a claim is inferred
rather than directly stated, mark it as an inference.

