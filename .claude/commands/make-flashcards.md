---
description: Creates a new versioned flashcard JSON artifact from subject resources and reviewers.
argument-hint: <subject> [topic]
---

# /make-flashcards

Create atomic flashcards for a subject topic.

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
   the sole factual basis for cards.
7. If no matching processed resource exists, stop with:

   ```text
   ERROR: No processed resource found for "<topic>" in "<Subject>".
   Action: Run /process-resource <subject> <resource> before /make-flashcards.
   ```

8. Determine the topic slug.
9. Create:

```text
Subjects/<Subject>/flashcards/<topic-slug>/
```

10. Create the next versioned flashcard JSON:

```text
flashcards.v001.json
flashcards.v002.json
flashcards.v003.json
```

Never overwrite existing versions.

## Flashcard JSON Requirements

Use `templates/flashcards.json` as the shape.

Each card must be atomic:

- one definition
- one contrast
- one formula
- one process step
- one relationship
- one example-to-concept mapping

Each card must include:

- stable id, such as `card001`
- front
- back
- source when useful
- difficulty

## Quality Rules

- Avoid broad cards such as "Explain all of chapter 2."
- Avoid near-duplicate cards unless they test different retrieval angles.
- Prefer plain language.
- Keep the JSON simple enough for a future UI to read directly.
- Mark unsupported or inferred cards in a plain `note` field instead of hiding
  uncertainty.
- Do not create cards from learner-supporting context unless they are explicitly
  optional enrichment and include their external source.
- Include cloze cards only when cloze deletion is genuinely useful.

## Completion Response

Report:

- subject
- topic slug
- flashcards version created
- sources used
- card count by type and difficulty
- duplicate-risk notes
- suggested next command: `/practice-set <subject> <topic>`

## Safety Rules

- Do not overwrite older flashcard versions.
- Do not invent unsupported card answers.
- Do not edit reviewers or resources.
