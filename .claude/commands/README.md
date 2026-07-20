# DannLearn Commands

DannLearn commands are workflow prompts for Claude Code. They are intentionally
plain Markdown so they can be reviewed, edited, and eventually upstreamed.

## Installed Commands

| Command | Purpose |
|---|---|
| `/help-dannlearn` | Report-only command catalog. |
| `/ask-command <intent>` | Routes plain-English goals to the best command. |
| `/make-command <description>` | Creates new commands safely with conflict checks. |
| `/new-subject <name>` | Creates a subject folder structure. |
| `/list-subjects` | Report-only overview of subjects. |
| `/subject-status [subject]` | Report-only subject status and gap report. |
| `/process-resource <subject> <resource>` | Converts raw resources into processed Markdown notes. |
| `/make-reviewer <subject> [topic-or-resource] [-quote "..."]` | Creates a JSON-first reviewer. |
| `/reviewer-update <subject> [reviewer]` | Creates an updated reviewer version. |
| `/reviewer-check <subject> [reviewer]` | Report-only reviewer QA. |
| `/reviewer-polish <subject> [reviewer]` | Creates a clearer polished reviewer version. |
| `/make-quiz <subject> [topic]` | Creates a new versioned quiz JSON artifact. |
| `/make-flashcards <subject> [topic]` | Creates a new versioned flashcard JSON artifact. |
| `/practice-set <subject> [topic]` | Creates a mixed practice-set JSON artifact. |
| `/adopt-dannlearn [--force]` | Bootstraps an existing repo into DannLearn conventions. |
| `/update-dannlearn [--init]` | Checks for latest DannLearn starter updates. |
| `/sync-upstream [path]` | Pulls selected starter updates into a project. |
| `/sync-to-upstream [path\|--dry-run]` | Prepares generic local improvements for upstream contribution. |

More approved commands live in this folder as they are added.

## Command Standards

Each command should define:

- Purpose and arguments.
- Whether it is report-only or allowed to edit files.
- Preflight checks.
- Output format.
- Safety rules around private resources and upstream sync.
- JSON-first behavior when creating generated study artifacts.
