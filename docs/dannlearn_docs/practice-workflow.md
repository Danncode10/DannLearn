# Practice Workflow

DannLearn practice artifacts are versioned so learners can generate multiple
sets over time.

## Quiz Variants

`/make-quiz <subject> [topic]` creates a new quiz version every time:

```text
Subjects/<Subject>/quizzes/<topic-slug>/quiz.v001.json
Subjects/<Subject>/quizzes/<topic-slug>/quiz.v002.json
```

This allows the future UI to show multiple quiz attempts or variants for the
same topic.

## Flashcard Versions

`/make-flashcards <subject> [topic]` creates:

```text
Subjects/<Subject>/flashcards/<topic-slug>/flashcards.v001.json
```

Flashcards should be atomic and source-grounded.

## Practice Sets

`/practice-set <subject> [topic]` creates mixed sessions:

```text
Subjects/<Subject>/practice-sets/<topic-slug>/practice-set.v001.json
```

Practice sets can draw from quizzes, flashcards, reviewers, and processed
resources. They should mix recall, application, explain-back prompts, and common
confusion checks.

