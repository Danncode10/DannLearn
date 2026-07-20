# CLAUDE.md - DannLearn

> Start here. This file is Claude Code's authoritative project context for
> DannLearn.

## What Is DannLearn?

DannLearn is a reusable learning-content starter for building structured study
material from source resources. It is inspired by DannFlow's command-driven
workflow, but its center of gravity is learning content instead of app code.

The intended workflow:

```text
add source resources -> process resources -> make reviewers
make quizzes / flashcards -> check coverage and factual grounding
```

## Non-Negotiable Learning Guardrails

1. **Resources are authoritative** - Generated content must be grounded in files
   under `Subjects/<Subject>/resources/`.
2. **Do not invent facts** - If the resources do not support a claim, mark it as
   unclear or ask for more source material.
3. **Preserve provenance** - Reviewers, quizzes, and flashcards should name the
   source resource files they were derived from.
4. **Keep study artifacts useful** - Prefer clear structure, examples, and
   retrieval practice over long passive summaries.
5. **Flashcards must be atomic** - One fact, relationship, process step, formula,
   or distinction per card.
6. **Quizzes need answer keys** - Every quiz question must include an answer and,
   where useful, a short explanation.
7. **JSON is canonical** - Generated reviewers, quizzes, flashcards, and
   practice sets should be written as structured JSON first. Markdown previews
   are optional companions.
8. **Subject content is local by default** - `Subjects/` usually belongs to the
   learner or project and should not be upstreamed unless explicitly requested.

## Project Structure

```text
Subjects/
  <SubjectName>/
    resources/
      raw/          # original source files or pasted source markdown
      processed/    # cleaned summaries/extractions grounded in raw resources
    reviewers/      # human-studyable markdown reviewers
    quizzes/        # quiz markdown with answers and explanations
    flashcards/     # spaced-repetition-ready markdown or export formats
    practice-sets/   # mixed practice sessions drawn from quizzes/cards/reviewers
    notes/          # loose notes, study plans, and reflections
    index.md        # subject map and status

templates/          # reusable artifact templates
docs/dannlearn_docs/ # methodology and maintainer docs
.claude/            # Claude context, future commands, future agents
.codex/             # Codex compatibility layer
```

## Artifact Standards

### Naming And Versioning

Generated artifact folders should use readable kebab-case slugs:

```text
reviewers/<topic-slug>/reviewer.v001.json
quizzes/<topic-slug>/quiz.v001.json
flashcards/<topic-slug>/flashcards.v001.json
practice-sets/<topic-slug>/practice-set.v001.json
```

When regenerating or making another practice variant, create the next version
instead of overwriting the previous one: `v002`, `v003`, and so on.

Each JSON artifact should include:

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

### Reviewers

Reviewers should be easy to study from. JSON reviewer content should include:

- Title, scope, and source provenance.
- Topic sections in a sensible learning order.
- Key concepts and definitions.
- Examples, contrasts, formulas, or processes where applicable.
- Quick checks or recall prompts.
- Optional quote notes when the command is run with `-quote`.
- A final gap list when the source material is incomplete.

### Quizzes

Quizzes should include:

- Source provenance.
- Difficulty labels when useful: `easy`, `medium`, `hard`.
- A mix of recall, application, and explanation questions.
- Answer key and short explanations.
- Clear marking when an answer depends on an assumption.

### Flashcards

Flashcards should include:

- Source provenance.
- Atomic front/back cards.
- Optional cloze cards for definitions, formulas, and ordered steps.
- No duplicate or near-duplicate cards unless they test meaningfully different
  angles.

### Processed Resources

Processed resources may be Markdown because they are intermediate human-readable
notes. When processing PDFs, slides, docs, images, or graphs:

- Extract visible text when possible.
- Preserve tables as Markdown tables when useful.
- Describe images, charts, and diagrams in text.
- Use Mermaid only when the visual structure can be represented accurately and
  safely in GitHub/VS Code Markdown.
- Mark low-confidence visual interpretation instead of pretending certainty.

## Upstream Model

DannLearn should stay open-source friendly.

Usually upstreamable:

- `.claude/` command and agent definitions.
- `.codex/` compatibility docs.
- `templates/`.
- `docs/dannlearn_docs/`.
- General maintenance scripts, if added later.

Usually local-only:

- `Subjects/`.
- Personal notes.
- Private resources.
- Generated study artifacts from private resources.

Future sync commands should follow DannFlow's selective, file-level approach
instead of blindly merging or overwriting project work.

## Command Policy

Each command should declare:

- Whether it is report-only or allowed to edit files.
- Exact preflight checks.
- Exact output format.
- Safety rules for private resources and upstream contribution.

If you do not know which command fits a task, future DannLearn should support an
`/ask-command` router.

## Codex Compatibility

Codex should read `AGENTS.md`, then this file, then `.codex/context/dannlearn.md`
before doing project work.
