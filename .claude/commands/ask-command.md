---
description: Meta-router. Describe what you want; returns the best DannLearn command and a ready-to-paste prompt.
argument-hint: <plain-English description of what you want>
---

The user's goal: **$ARGUMENTS**

## Step 1 - Read Available Commands

Read the `description:` frontmatter of every `.md` file in `.claude/commands/`
except `README.md` and this file. Do not read full bodies unless two commands
have nearly identical descriptions.

## Step 2 - Pick The Best Approach

Figure out:

- Which command best covers the goal.
- Whether commands should be chained, such as `/process-resource` then
  `/make-reviewer` then `/make-quiz`.
- Whether the request is report-only or file-writing.
- What arguments the user should provide.

## Step 3 - Output A Ready-To-Paste Prompt

Your only output is the prompt block below. Nothing before it, nothing after it.

The prompt must:

- Be written in paragraph form, not bullets.
- Use imperative voice directed at Claude.
- Reference the correct slash command by name.
- Include concrete subject/topic/resource details inferred from the user's goal.
- Mention Markdown output for reviewers and JSON output for quizzes,
  flashcards, and practice sets.
- Be detailed enough that Claude can start without clarification unless the
  subject/resource is genuinely ambiguous.

Output exactly:

---
**Prompt:**

```text
<ready-to-paste prompt>
```
---

## If No Command Fits

If no existing command covers the goal well, output:

---
**Prompt:**

```text
Run /make-command "<one-sentence description of the new command needed>". Make the command fit DannLearn's Markdown-reviewer and JSON-practice-artifact model, preserve source provenance, and define whether it is report-only or allowed to edit files.
```
---
