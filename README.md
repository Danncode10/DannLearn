# DannLearn

**The AI-assisted study workspace starter.** Turn your PDFs, slides, docs, and
notes into reviewers, quizzes, flashcards, and practice sets using repo-native
Markdown and JSON files.

> Built for personal learning repos that can still sync improvements back to the
> DannLearn starter.

---

## Quick Start

```bash
curl -sSL https://raw.githubusercontent.com/Danncode10/DannLearn/main/install.sh | bash
```

That's it. The installer:

1. Asks for your learning repo name.
2. Clones DannLearn into a new folder.
3. Renames the original remote to `upstream`.
4. Optionally adds your own GitHub repo as `origin`.
5. Writes `dannlearn.json` with the starter commit anchor.
6. Leaves the repo ready for `/update-dannlearn`, `/sync-upstream`, and
   `/sync-to-upstream`.

After install:

```bash
cd my-dannlearn
./guide.sh
```

Then open Claude Code or Codex and run:

```text
/help-dannlearn
```

DannLearn is not a database app. It stores learning content as folders,
Markdown, and JSON files.

## Who This Is For

Use DannLearn when you want a repo like:

```text
MyLearningRepo/
  Subjects/
    Biology/
    Calculus/
    Networking/
```

Each subject can have resources, processed notes, reviewers, quizzes,
flashcards, and practice sets.

Your resources may be private. They should live in your own repo, not in the
main DannLearn starter repo.

## Folder Structure

```text
Subjects/
  <SubjectName>/
    resources/
      raw/          # PDFs, docs, slides, text, or Markdown you add manually
      processed/    # cleaned Markdown notes generated from raw resources
    reviewers/      # JSON reviewer files, optionally with Markdown previews
    quizzes/        # versioned quiz JSON files
    flashcards/     # versioned flashcard JSON files
    practice-sets/  # mixed practice sessions
    notes/          # your own notes
    index.md        # subject map and status
```

Reusable starter files live outside `Subjects/`:

| Path | Purpose |
|---|---|
| `.claude/commands/` | DannLearn slash command prompts. |
| `.claude/agents/` | Reserved for future learning agents. |
| `.codex/` | Codex context for this repo. |
| `templates/` | Starter JSON and Markdown templates. |
| `docs/dannlearn_docs/` | Maintainer and methodology docs. |
| `dannlearn.json` | Future upstream sync/version anchor. |

## After Install - Make It Yours

### 1. Add Subjects

Use the command:

```text
/new-subject Biology
```

Then manually put resources into:

```text
Subjects/Biology/resources/raw/
```

Example resources:

- `chapter-1.pdf`
- `lecture-slides.pptx`
- `notes.docx`
- `syllabus.md`

### 2. Process Resources

Use:

```text
/process-resource Biology chapter-1.pdf
```

This creates cleaned Markdown notes under:

```text
Subjects/Biology/resources/processed/
```

If the resource has images, charts, or graphs, the command should extract visible
text, describe the visual, and only use Mermaid when the diagram can be
represented clearly.

### 3. Generate Study Artifacts

Examples:

```text
/make-reviewer Biology chapter-1
/make-quiz Biology chapter-1
/make-flashcards Biology chapter-1
/practice-set Biology chapter-1
```

Generated files are versioned. Running `/make-quiz` again creates a new version
instead of overwriting the old one:

```text
Subjects/Biology/quizzes/chapter-1/quiz.v001.json
Subjects/Biology/quizzes/chapter-1/quiz.v002.json
Subjects/Biology/quizzes/chapter-1/quiz.v003.json
```

This is useful later for a UI because it can show many quiz versions for the
same topic.

## Why JSON?

JSON is used because it is easy for a future UI to read.

There is no database requirement. A future app can load a file like:

```text
Subjects/Biology/quizzes/chapter-1/quiz.v001.json
```

and read it directly.

A quiz JSON file should look roughly like this:

```json
{
  "type": "quiz",
  "subject": "Biology",
  "topic": "chapter-1",
  "version": "v001",
  "sources": [
    "Subjects/Biology/resources/processed/chapter-1.processed.md"
  ],
  "questions": [
    {
      "id": "q001",
      "question": "What is the main role of the cell membrane?",
      "choices": [
        "To store genetic information",
        "To control what enters and leaves the cell",
        "To make proteins",
        "To produce energy"
      ],
      "answer": "To control what enters and leaves the cell",
      "explanation": "The cell membrane acts as a selective boundary.",
      "difficulty": "easy"
    }
  ]
}
```

That is the heart of it: simple JSON arrays that can become UI later.

## Upstream Plan

DannLearn is meant to be reused.

The installer sets this up automatically:

```text
upstream -> Danncode10/DannLearn
origin   -> your own learning repo, if you provided one
```

Your personal learning repo should usually keep these local:

- `Subjects/`
- private resources
- your generated reviewers
- your generated quizzes
- your generated flashcards
- personal notes

These are good candidates to contribute upstream:

- better command prompts in `.claude/commands/`
- better templates
- better docs
- general fixes that help every DannLearn user

In other words:

```text
Private study content -> keep in your repo
Starter improvements  -> PR back to DannLearn
```

The upstream commands are:

```text
/adopt-dannlearn
/update-dannlearn
/sync-upstream
/sync-to-upstream
```

They are inspired by DannFlow's selective sync flow. The important rule is:
starter files can sync, private subject content should stay local unless you
explicitly choose otherwise.

### Get New Starter Updates

```text
/update-dannlearn
/sync-upstream
```

Use this when DannLearn adds new commands, templates, docs, or scripts and you
want them in your own learning repo.

### Contribute Back To DannLearn

```text
/sync-to-upstream
```

Use this when you improved generic starter files, such as:

- `.claude/commands/`
- `templates/`
- `docs/dannlearn_docs/`
- `install.sh`
- `guide.sh`

Do not upstream private subject resources unless you intentionally want them
public.

## Installed Commands

```text
/help-dannlearn
/ask-command <intent>
/make-command <description>
/new-subject <name>
/list-subjects
/subject-status [subject]
/process-resource <subject> <resource>
/make-reviewer <subject> [topic-or-resource] [-quote "..."]
/reviewer-update <subject> [reviewer]
/reviewer-check <subject> [reviewer]
/reviewer-polish <subject> [reviewer]
/make-quiz <subject> [topic]
/make-flashcards <subject> [topic]
/practice-set <subject> [topic]
/adopt-dannlearn [--force]
/update-dannlearn [--init]
/sync-upstream [path]
/sync-to-upstream [path|--dry-run]
```

Run:

```text
/help-dannlearn
```

to see the command catalog.
