---
description: Creates a mixed versioned practice-set JSON artifact from quizzes, flashcards, reviewers, and resources.
argument-hint: <subject> [topic]
---

# /practice-set

Create a mixed practice session for a subject topic.

Use this when the learner wants more than one quiz or one flashcard pass. The
practice set should combine question types so review feels active and varied.

User argument:

```text
$ARGUMENTS
```

## Procedure

1. Read `AGENTS.md`.
2. Read `CLAUDE.md`.
3. Read `docs/dannlearn_docs/artifact-json.md`.
4. Parse `$ARGUMENTS` as `<subject> [topic]`.
5. Find the best matching subject under `Subjects/`.
6. Find topic material in this order:
   - latest quiz versions
   - latest flashcard versions
   - latest reviewer version
   - processed resources
7. If no processed resource exists and the topic has no source-traceable quiz,
   flashcards, or reviewer, stop and recommend `/process-resource`.
8. If the topic is missing, infer it from available artifacts or ask the user to
   choose.
9. Create:

```text
Subjects/<Subject>/practice-sets/<topic-slug>/
```

10. Create the next version:

```text
practice-set.v001.json
practice-set.v002.json
practice-set.v003.json
```

Never overwrite existing versions.

## Practice Set JSON Requirements

Use `templates/practice-set.json` as the shape.

Include a mixed set of 20-40 items when source material allows:

- recall prompts
- quiz-style questions
- flashcard-style front/back items
- explain-like-I-am-teaching prompts
- application prompts
- common-confusion prompts
- self-rating checkpoints

Each item must include:

- stable id, such as `p001`
- mode
- question
- answer
- explanation
- difficulty
- source when useful

Keep the JSON simple enough for a future UI to read directly.

## Mix Rules

- Do not simply copy one quiz into a practice set.
- Prefer variety across modes and difficulty.
- Reuse strong questions/cards when useful, but include fresh variants.
- Include review guidance for weak areas.
- If few source artifacts exist, create a smaller set and explain the limitation.

## Completion Response

Report:

- subject
- topic slug
- practice set version created
- sources used
- item count and mode mix
- assumptions/source gaps
- suggested next command: `/subject-status <subject>`

## Safety Rules

- Do not overwrite older practice sets.
- Do not invent unsupported answers.
- Do not edit quizzes, flashcards, reviewers, or resources.
