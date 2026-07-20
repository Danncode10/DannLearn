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

More approved commands live in this folder as they are added.

## Command Standards

Each command should define:

- Purpose and arguments.
- Whether it is report-only or allowed to edit files.
- Preflight checks.
- Output format.
- Safety rules around private resources and upstream sync.
- JSON-first behavior when creating generated study artifacts.
