---
description: Improves a Markdown reviewer by creating a clearer, detailed next Markdown version.
argument-hint: <subject> [reviewer]
---

# /reviewer-polish

Polish a reviewer into a clearer next version.

User argument:

```text
$ARGUMENTS
```

## Procedure

1. Read `AGENTS.md`.
2. Read `CLAUDE.md`.
3. Find the subject and reviewer topic/version.
4. Read the latest reviewer Markdown unless the user names a specific version.
5. Read the referenced processed sources enough to preserve course grounding.
   If no processed source is available, stop and recommend `/process-resource`.
6. Create the next reviewer version:

```text
Subjects/<Subject>/reviewers/<topic-slug>/reviewer.vNNN.md
```

7. Improve:
   - section ordering
   - plain-language explanations
   - examples
   - common confusions
   - recall prompts
   - study order
   - source gap wording
   - meaningful visual search suggestions
   - clear labels for learner-supporting context
8. Preserve:
   - source references
   - unsupported/uncertain flags
   - learner quote notes
   - Markdown provenance and versioning
9. Do not add unsupported course claims. Keep external learner-supporting context
   visibly labeled.

## Output Format

Report:

- source reviewer version
- polished reviewer version created
- main readability changes
- any facts left unchanged because sources were insufficient
- suggested next command: `/reviewer-check <subject> <reviewer>`

## Safety Rules

- Never overwrite the original reviewer.
- Do not remove source references.
- Do not polish uncertainty into false confidence.
