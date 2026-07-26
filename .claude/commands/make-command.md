---
description: Creates a new DannLearn slash command safely, with conflict checks and docs updates.
argument-hint: <plain-English description of the new command>
---

The user wants a new custom command: **$ARGUMENTS**

## Step 1 - Understand The Request

Parse `$ARGUMENTS` to identify:

- The action the command performs.
- Whether it takes arguments.
- Whether it is report-only or allowed to write files.
- Which command category it belongs to:
  - Help & Routing
  - Subject Setup & Status
  - Resources
  - Reviewers
  - Practice
  - Quality
  - Upstream & Maintenance

If the request is too vague, ask one clarifying question, then proceed.

## Step 2 - Pick A Name

Choose a short kebab-case command name.

Rules:

- Prefer 1-3 words.
- Use clear names over cute abbreviations.
- Do not collide with an existing `.claude/commands/*.md` file.
- Match existing naming style, such as `make-reviewer`, `reviewer-check`, or
  `subject-status`.

## Step 3 - Check For Conflicts

List `.claude/commands/*.md` and read each frontmatter `description:`.

Check for:

- Duplicate scope.
- Overlapping responsibility.
- Conflict with `CLAUDE.md` learning guardrails.
- Conflict with Markdown-reviewer and JSON-practice-artifact rules.
- Any risk of overwriting private `Subjects/` content.

If a command already fits, recommend using or editing it instead of creating a
new one.

## Step 4 - Draft The Command File

Use this structure:

````markdown
---
description: <specific one-line summary>
argument-hint: <args if applicable>
---

# /<command-name>

<purpose>

User argument:

```text
$ARGUMENTS
```

## Procedure

1. <step>

## Output Format

<exact response shape>

## Safety Rules

- <rule>
````

Command rules:

- State whether the command is report-only.
- If the command writes reviewers, require versioned Markdown output. If it
  writes quizzes, flashcards, or practice sets, require versioned JSON output.
- If the command reads resources, require source provenance.
- If the command can overwrite files, require creating a new version instead.
- If it touches `Subjects/`, treat content as local/private.

## Step 5 - Identify Ripple Effects

Update:

- `.claude/commands/README.md`
- `.claude/commands/help-dannlearn.md`

Update these only when relevant:

- `CLAUDE.md`
- `AGENTS.md`
- `docs/dannlearn_docs/*.md`
- `templates/*`

## Step 6 - Show The Plan And Confirm

Output:

```text
Proposed new command: /<name>

Description: <one-liner>
Arguments: <args or "none">
Category: <category>
Mode: report-only / file-writing

Will create:
  .claude/commands/<name>.md

Will update:
  .claude/commands/README.md
  .claude/commands/help-dannlearn.md
  <other files if needed>

Conflicts detected:
  <None or details>

Proceed? (y/n)
```

Skip confirmation only if the user's original invocation explicitly says to
proceed.

## Step 7 - Apply Changes

Create the command and update docs surgically. Do not stage or commit unless the
user explicitly asks.

## Completion Response

Report:

- command created
- files changed
- example usage
- suggested conventional commit message
