# Artifact JSON

DannLearn generated study artifacts are JSON-first. Markdown can be created as a
human preview, but JSON is the canonical format for future UI work.

## Naming

Use kebab-case topic folders and three-digit versions:

```text
Subjects/<Subject>/reviewers/<topic-slug>/reviewer.v001.json
Subjects/<Subject>/quizzes/<topic-slug>/quiz.v001.json
Subjects/<Subject>/flashcards/<topic-slug>/flashcards.v001.json
Subjects/<Subject>/practice-sets/<topic-slug>/practice-set.v001.json
```

Regeneration should create the next version rather than overwrite old work.

## Required Top-Level Fields

- `schema_version`
- `artifact_type`
- `subject`
- `topic`
- `version`
- `created_at`
- `sources`
- `content`
- `provenance`
- `quality_notes`

## Source References

Use source references whenever possible:

```json
{
  "path": "Subjects/Biology/resources/processed/chapter-2.md",
  "section": "Cell Membrane",
  "quote": "short quote only when needed",
  "note": "why this source supports the item"
}
```

Keep quotes short. If an item is inferred from the source, mark that in
`provenance.unsupported_or_inferred_items`.

