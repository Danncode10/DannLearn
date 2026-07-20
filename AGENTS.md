# AGENTS.md - DannLearn

This file defines cross-agent behavior for DannLearn-compatible tools.

## Operating Order

1. Read `CLAUDE.md`.
2. Check the relevant subject's `index.md` before changing study content.
3. Read source resources before generating reviewers, quizzes, or flashcards.
4. Keep generated artifacts inside the matching subject folder.
5. Report uncertainty instead of fabricating unsupported facts.

## Content Safety

- Treat `Subjects/` as potentially private.
- Do not move, delete, or overwrite source resources without explicit approval.
- Preserve user-authored notes unless the user asks for a rewrite.
- Mark unsupported or ambiguous claims clearly.

## Editing Discipline

- Keep edits scoped to the requested subject and artifact type.
- Prefer markdown artifacts for portability.
- Use templates from `templates/` when applicable.
- Do not create slash commands unless the user explicitly approves them.

## Review Discipline

When reviewing generated learning content, prioritize:

- Factual grounding in resources.
- Missing coverage.
- Ambiguous wording.
- Duplicated flashcards or repeated quiz questions.
- Wrong difficulty balance.
- Passive summaries where retrieval practice would be better.

