# DannLearn Notes for Codex

DannLearn is a content-first learning workspace. The main job is to transform
subject resources into grounded study artifacts.

## Operating Order

1. Read `AGENTS.md`.
2. Read `CLAUDE.md`.
3. For subject work, read `Subjects/<Subject>/index.md` if it exists.
4. Read source resources before generating or editing study artifacts.
5. Use `templates/` where applicable.

## Content Rules

- Resources are authoritative.
- Do not invent unsupported facts.
- Preserve source provenance in generated artifacts.
- Keep flashcards atomic.
- Include answer keys for quizzes.
- Treat `Subjects/` as local/private by default.

## Future Command Bridge

When DannLearn commands are approved, `.claude/commands/` should remain the
source of truth. A Codex bridge can then be added to load those command prompts
on demand.

