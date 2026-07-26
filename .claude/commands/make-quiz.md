---
description: Creates a new versioned quiz JSON artifact from subject resources and reviewers.
argument-hint: <subject> [topic]
---

# /make-quiz

Create a quiz variant for a subject topic.

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
6. Find processed resources matching the topic, then read the latest reviewer
   Markdown only as a study-structure aid. Do not use raw resources or notes as
   the sole factual basis for a quiz.
7. If no matching processed resource exists, stop with:

   ```text
   ERROR: No processed resource found for "<topic>" in "<Subject>".
   Action: Run /process-resource <subject> <resource> before /make-quiz.
   ```

8. If no topic is provided, infer one from the latest reviewer or strongest
   processed resource. If several topics are plausible, ask the user to choose.
9. Create a topic slug in lowercase kebab-case.
10. Create:

```text
Subjects/<Subject>/quizzes/<topic-slug>/
```

11. Create the next versioned quiz JSON:

```text
quiz.v001.json
quiz.v002.json
quiz.v003.json
```

Never overwrite an existing version. Running `/make-quiz` again should produce a
new quiz variant.

## Quiz JSON Requirements

Use `templates/quiz.json` as the shape.

Create 15-25 questions unless the source is too small. Include a balanced mix:

- recall
- short answer
- multiple choice when useful
- application
- common-confusion checks
- explain-in-your-own-words

Each question must include:

- stable id, such as `q001`
- question
- choices, using an empty array for short-answer questions
- answer
- explanation
- difficulty: `easy`, `medium`, or `hard`
- source when useful

## Quality Rules

- The quiz should test understanding, not trivia.
- Every answer must be supportable from sources.
- Do not test learner-supporting context from a reviewer unless it is explicitly
  marked as optional enrichment and its external source is included.
- Keep the JSON simple enough for a future UI to read directly.
- If the source is weak, create fewer questions and mark source gaps.
- Do not duplicate questions from prior quiz versions unless the repetition is
  intentional and valuable.

## Completion Response

Report:

- subject
- topic slug
- quiz version created
- sources used
- question count and difficulty mix
- assumptions/source gaps
- suggested next command: `/practice-set <subject> <topic>`

## Safety Rules

- Do not overwrite older quiz versions.
- Do not invent unsupported answers.
- Do not edit reviewers or resources.
