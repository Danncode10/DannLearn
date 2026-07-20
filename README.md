# DannLearn

DannLearn is a starter repo for making your own AI-assisted study workspace.

The idea is simple:

1. Clone DannLearn.
2. Make your own learning repo from it.
3. Put your private resources in your own repo, not in DannLearn upstream.
4. Use the commands in `.claude/commands/` to generate reviewers, quizzes,
   flashcards, and practice sets.
5. Contribute improvements to the starter itself when they are useful for
   everyone.

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

## How To Use This Starter

### 1. Clone DannLearn

```bash
git clone https://github.com/Danncode10/DannLearn.git MyLearningRepo
cd MyLearningRepo
```

### 2. Make It Your Own Repo

Create your own GitHub repo, then point `origin` to your repo.

```bash
git remote rename origin upstream
git remote add origin <your-github-repo-url>
git push -u origin main
```

Recommended meaning:

- `upstream` = the original DannLearn starter
- `origin` = your personal learning repo

### 3. Add Subjects

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

### 4. Process Resources

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

### 5. Generate Study Artifacts

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

Future commands like `/sync-upstream`, `/sync-to-upstream`, and
`/update-dannlearn` should make that easier, inspired by DannFlow.

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
```

Run:

```text
/help-dannlearn
```

to see the command catalog.

