# Reviewer Style

Reviewers should help a learner understand and recall material, not merely store
a long summary.

The canonical reviewer artifact is JSON:

```text
Subjects/<Subject>/reviewers/<topic-slug>/reviewer.v001.json
```

Markdown previews may exist beside the JSON when helpful.

## Preferred Shape

- Start with scope and sources.
- Organize topics in learning order.
- Explain terms plainly.
- Include examples, contrasts, and quick checks.
- Preserve learner quote notes when a reviewer is created with `-quote`.
- Mark gaps where resources are incomplete.

## Avoid

- Unsupported facts.
- Overly broad flashcard-like bullet dumps.
- Repeating the same point in several sections.
- Hiding uncertainty.
- Passive summaries without recall prompts.
