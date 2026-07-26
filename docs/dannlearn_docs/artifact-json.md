# Artifact JSON

DannLearn uses JSON files because they are simple, portable, and easy for a
future UI to read.

There is no database requirement. Generated study files should stay as normal
files in the repo.

## Naming

Use topic folders and versioned files:

```text
Subjects/<Subject>/quizzes/<topic-slug>/quiz.v001.json
Subjects/<Subject>/flashcards/<topic-slug>/flashcards.v001.json
Subjects/<Subject>/practice-sets/<topic-slug>/practice-set.v001.json
```

When a command runs again, create the next version:

```text
quiz.v001.json
quiz.v002.json
quiz.v003.json
```

Do not overwrite old versions.

## Simple Quiz Shape

A quiz should be easy to understand:

```json
{
  "type": "quiz",
  "subject": "Biology",
  "topic": "chapter-1",
  "version": "v001",
  "sources": [
    "Subjects/Biology/resources/processed/chapter-1.processed.md"
  ],
  "questions": [
    {
      "id": "q001",
      "question": "What is the main role of the cell membrane?",
      "choices": [
        "To store genetic information",
        "To control what enters and leaves the cell",
        "To make proteins",
        "To produce energy"
      ],
      "answer": "To control what enters and leaves the cell",
      "explanation": "The cell membrane acts as a selective boundary.",
      "difficulty": "easy"
    }
  ]
}
```

For short-answer questions, `choices` can be an empty array:

```json
{
  "id": "q002",
  "question": "Explain selective permeability in one sentence.",
  "choices": [],
  "answer": "Selective permeability means only some substances can pass through.",
  "explanation": "The membrane allows some materials through while blocking or slowing others.",
  "difficulty": "medium"
}
```

## Simple Flashcard Shape

```json
{
  "type": "flashcards",
  "subject": "Biology",
  "topic": "chapter-1",
  "version": "v001",
  "sources": [
    "Subjects/Biology/resources/processed/chapter-1.processed.md"
  ],
  "cards": [
    {
      "id": "card001",
      "front": "What does selective permeability mean?",
      "back": "Only some substances can pass through a boundary.",
      "difficulty": "easy"
    }
  ]
}
```

## Source Tracking

Keep source tracking simple. At minimum, list the files used in `sources`.

If a specific item needs more detail, add `source` to that question/card:

```json
{
  "id": "q003",
  "question": "What structure controls entry and exit from the cell?",
  "choices": [],
  "answer": "The cell membrane.",
  "explanation": "The source describes the membrane as the cell boundary.",
  "difficulty": "easy",
  "source": "Subjects/Biology/resources/processed/chapter-1.processed.md"
}
```

Keep it practical. The goal is not a perfect schema. The goal is a clean file
that humans and a future UI can both understand.

## Reviewers

Reviewers are versioned Markdown files, not JSON artifacts:

```text
Subjects/<Subject>/reviewers/<topic-slug>/reviewer.v001.md
```

Their required study structure is defined in `templates/reviewer.md` and
`.claude/commands/make-reviewer.md`.

## Simple Practice Set Shape

```json
{
  "type": "practice-set",
  "subject": "Biology",
  "topic": "chapter-1",
  "version": "v001",
  "sources": [
    "Subjects/Biology/quizzes/chapter-1/quiz.v001.json",
    "Subjects/Biology/flashcards/chapter-1/flashcards.v001.json"
  ],
  "items": [
    {
      "id": "p001",
      "mode": "multiple-choice",
      "question": "What is the main role of the cell membrane?",
      "answer": "To control what enters and leaves the cell",
      "explanation": "This checks the big idea from the reviewer.",
      "difficulty": "easy"
    }
  ]
}
```
