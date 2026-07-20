---
description: Improves reviewer clarity and study flow by creating a polished next JSON version.
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
4. Read the latest reviewer JSON unless the user names a specific version.
5. Read referenced sources enough to preserve factual grounding.
6. Create the next reviewer version:

```text
Subjects/<Subject>/reviewers/<topic-slug>/reviewer.vNNN.json
```

7. Improve:
   - section ordering
   - plain-language explanations
   - examples
   - common confusions
   - recall prompts
   - study order
   - source gap wording
8. Preserve:
   - source references
   - unsupported/uncertain flags
   - learner quote notes
   - artifact metadata
9. Do not add unsupported facts.

## Output Format

Report:

- source reviewer version
- polished reviewer version created
- main readability changes
- any facts left unchanged because sources were insufficient
- suggested next command: `/reviewer-check <subject> <reviewer>`

## Safety Rules

- Never overwrite the original reviewer.
- Do not remove provenance.
- Do not polish uncertainty into false confidence.

