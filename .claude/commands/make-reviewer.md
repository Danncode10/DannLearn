---
description: Creates a detailed Markdown reviewer from processed subject resources, with clearly labeled learner-supporting context and visual search suggestions.
argument-hint: <subject> [topic-or-resource] [-quote "..."]
---

# /make-reviewer

Create a detailed, Markdown-first reviewer that teaches a topic, not merely
summarizes it.

The reviewer has two clearly separated layers:

- **Course-grounded content**: facts, terminology, processes, formulas, and
  claims supported by the selected processed resource.
- **Learner-supporting context**: clearly labeled analogies, familiar examples,
  comparisons, and carefully chosen extra context that make the course content
  easier to understand. Never present this layer as though it came from the
  learner's resource.

User argument:

```text
$ARGUMENTS
```

## Argument Parsing

Parse:

```text
<subject> [topic-or-resource] [-quote "<learner wording or note>"]
```

If `-quote` is present, preserve the learner's meaning and use it where it is
helpful. Lightly clean grammar only when clarity improves.

## Procedure

1. Read `AGENTS.md`, `CLAUDE.md`, and `docs/dannlearn_docs/artifact-json.md`.
2. Find the best matching subject under `Subjects/` and read its `index.md`.
3. Find processed resources that match the requested topic or resource.
4. Stop before creating files if the source preflight fails:

   ```text
   ERROR: No resources found for "<Subject>".
   Expected: Subjects/<Subject>/resources/raw/ and resources/processed/.
   Action: Add a source resource, then run /process-resource <subject> <resource>.
   ```

   ```text
   ERROR: No processed resource found for "<topic-or-resource>" in "<Subject>".
   Raw resource(s) found: <list, or "none">.
   Action: Run /process-resource <subject> <resource> before /make-reviewer.
   ```

   List available processed resources when the requested topic does not match
   any of them. Do not create a reviewer from raw resources or notes alone.
5. Read the selected processed resource fully. Read its associated raw resource
   only when needed to resolve a source label, figure, or extraction note.
6. Determine a lowercase kebab-case `topic-slug` from the requested topic or
   strongest matching processed resource title.
7. Create the next versioned Markdown reviewer. Never overwrite an old version:

   ```text
   Subjects/<Subject>/reviewers/<topic-slug>/reviewer.v001.md
   Subjects/<Subject>/reviewers/<topic-slug>/reviewer.v002.md
   ```

## Reviewer Design

Use `templates/reviewer.md` as a starting shape, adapting it to the topic.
There is no length cap: use as much space as improves understanding, comparison,
and retrieval practice. Avoid padding or repeating the same idea.

The reviewer must include:

1. **Title and provenance**
   - Title, subject, topic, processed sources, and a short Big Picture.
2. **Study Path**
   - A concise, unit-level reading order.
3. **Main Review Sections**
   - Organize by learning objectives or natural conceptual units, not one rigid
     mini-essay per vocabulary word.
   - Start each section with its central idea.
   - Use prose for explanations, bullets for lists, tables for comparable
     concepts, and formula blocks for calculations.
   - Explain difficult terms before depending on them.
4. **Check Your Understanding**
   - Add 2-5 retrieval prompts after each major section. Mix direct recall,
     comparison, and simple application.
5. **High-Yield Comparisons**
   - Include when similar concepts are likely to be confused.
6. **Visual Search Suggestions**
   - Include 3-6 only when visuals would materially help.
   - Each suggestion must name its learning purpose and give one descriptive,
     copy-ready internet image-search query. Prefer diagrams, labeled figures,
     or authentic examples over decorative imagery.
   - State when a source figure is the best visual to use instead.
7. **Cumulative Recall Prompts** and **Source Gaps**.

## Learner-Supporting Context

Use learner-supporting context to make the reviewer more teachable. It may add:

- a plain-language analogy;
- a familiar real-world example;
- a brief comparison that clarifies a distinction;
- a wider-context note that explains why the concept is useful.

Rules:

- Label each addition as `Learner-supporting context:` or place it in a clearly
  labeled callout. Do not imply it was stated in the course resource.
- Keep it accurate, conventional, and directly relevant.
- Do not add niche facts, numerical claims, standards, configuration steps, or
  exam-specific claims unless they are supported by a cited external source.
- Do not make quizzes, flashcards, or recall answers depend on an external
  addition unless that artifact explicitly labels it as optional enrichment.

## Diagrams And Images

Use Mermaid only when it accurately represents a relationship in the processed
source and makes that relationship easier to understand. Verify GitHub/VS Code
safe syntax and add a short "How to read this" note. Otherwise, provide a
Visual Search Suggestion rather than inventing a diagram.

## Quality Check

Before writing, confirm that the reviewer is detailed without being repetitive,
groups concepts into meaningful sections, distinguishes source-grounded facts
from learner-supporting context, includes active retrieval practice, and has no
unsupported course claims.

## Completion Response

Report the subject, topic slug, processed sources, reviewer path, whether a
learner quote was included, the number of visual search suggestions, clearly
labeled enrichment used, source gaps, and suggested next commands.

## Safety Rules

- Do not overwrite reviewer versions or edit resources.
- Keep generated reviewers in the matching subject folder.
- Treat raw resources and notes as private/local.
