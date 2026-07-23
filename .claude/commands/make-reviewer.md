---
description: Creates a Markdown-first reviewer from subject resources, with optional -quote notes and versioned naming.
argument-hint: <subject> [topic-or-resource] [-quote "..."]
---

# /make-reviewer

Create a grounded reviewer for a subject topic or resource.

This command is inspired by the ROS2 tutorial repo's `/make-lesson` pattern:
match the learning unit, read existing source/plan material, create a predictable
artifact, teach patiently, add diagrams only when useful, and verify that the
result is studyable.

User argument:

```text
$ARGUMENTS
```

## Argument Parsing

Parse:

```text
<subject> [topic-or-resource] [-quote "<learner wording or note>"]
```

Examples:

```text
Biology cell membrane -quote "The membrane is like a selective border, not a wall."
```

```text
"Computer Networks" tcp-ip
```

If `-quote` is present, preserve the quote in `quote_notes` and use it as a
learner-friendly note where relevant. Lightly clean grammar only when it
improves clarity. Do not change the learner's meaning.

## Procedure

1. Read `AGENTS.md`.
2. Read `CLAUDE.md`.
3. Read `docs/dannlearn_docs/artifact-json.md`.
4. Find the best matching subject under `Subjects/`.
5. Read `Subjects/<Subject>/index.md` if present.
6. Find relevant source material in this order:
   - matching files in `resources/processed/`
   - matching files in `resources/raw/`
   - existing notes in `notes/`
   - existing reviewer versions if the user is extending a topic
7. If there is no processed resource but raw resources exist, tell the user the
   best next command is `/process-resource <subject> <resource>`. Continue only
   if the raw resource is readable enough to ground the reviewer.
8. Determine a `topic-slug`:
   - Use the topic/resource argument when provided.
   - Otherwise infer from the strongest matching resource title.
   - Use lowercase kebab-case.
9. Create the output folder:

```text
Subjects/<Subject>/reviewers/<topic-slug>/
```

10. Create the next versioned Markdown file:

```text
reviewer.v001.md
reviewer.v002.md
reviewer.v003.md
```

Never overwrite an existing version.

## Reviewer Markdown Requirements

Use `templates/reviewer.md` as the shape. Include:

- Title (h1)
- Scope (subject, topic, sources)
- Study Order
- Key Concepts (for each concept: definition, why it matters, example, quick check)
- Common Confusions (table format)
- Recall Prompts
- Source Gaps

## Teaching And Study Style

Write like a patient teacher helping someone review.

Requirements:

- Use beginner-friendly explanations without talking down.
- Explain important vocabulary before relying on it.
- Prefer conceptual order over source-file order when that improves learning.
- Include common confusions and what to remember instead.
- Include quick recall prompts.
- Include "source gaps" when resources are incomplete.
- If a topic goes beyond the available source, mark it as future/unsupported
  instead of expanding it.
- Use Mermaid diagrams only when they make relationships easier to see and can
  be represented safely.

## Mermaid Verification Loop

If the reviewer Markdown includes Mermaid:

1. Check every Mermaid block for GitHub/VS Code-safe syntax.
2. Prefer `flowchart LR`, `flowchart TD`, or `sequenceDiagram`.
3. Use simple ASCII node IDs.
4. Quote labels with spaces or punctuation.
5. Add a short "How to read this" explanation.
6. If the diagram seems risky, replace it with a plain Markdown list or table.

## Completion Response

Report:

- subject
- topic slug
- sources used
- reviewer Markdown path
- whether `-quote` was included
- assumptions and source gaps
- suggested next commands: `/make-quiz` and `/make-flashcards`

## Safety Rules

- Do not invent unsupported facts.
- Do not overwrite existing reviewer versions.
- Do not delete or edit resources.
- Treat raw resources and notes as private/local.
