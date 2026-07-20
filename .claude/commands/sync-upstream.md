---
description: Pulls selected DannLearn starter updates into this project without touching subject content.
argument-hint: [path]
---

# /sync-upstream

Pull selected starter updates from DannLearn upstream.

This is a file-level sync, not a merge. It is designed for repos that use
DannLearn as a starter while keeping their own private `Subjects/` content.

User argument:

```text
$ARGUMENTS
```

## Procedure

1. Read `AGENTS.md`.
2. Read `CLAUDE.md`.
3. Stop if the working tree is dirty:

```bash
git status --porcelain
```

4. Read `dannlearn.json`.
   - If missing, tell the user to run `/adopt-dannlearn`.
5. Verify `upstream` remote:

```bash
git remote get-url upstream
git fetch upstream --quiet
git rev-parse upstream/main
```

6. Show the anchor:

```text
Last synced from DannLearn: <dannlearn_commit> on <synced_at>
```

7. Default scan paths:

```text
.claude/
.codex/
templates/
docs/dannlearn_docs/
install.sh
guide.sh
README.md
CLAUDE.md
AGENTS.md
Subjects/README.md
```

If the user passes a path, scan only that path.

8. Never auto-scan or auto-copy:

```text
Subjects/<Subject>/
Subjects/**/resources/
Subjects/**/reviewers/
Subjects/**/quizzes/
Subjects/**/flashcards/
Subjects/**/practice-sets/
Subjects/**/notes/
.env*
```

9. Build a diff report:

```bash
git diff --stat HEAD upstream/main -- <path>
git diff --name-status HEAD upstream/main -- <path>
```

10. Categorize files:
   - NEW upstream
   - MODIFIED
   - DELETED upstream
11. Present a numbered table and ask which files to pull.
12. For each selected file:
   - NEW upstream: copy from `upstream/main`
   - MODIFIED: show diff first, then ask replace / skip / save `.upstream`
   - DELETED upstream: do not delete locally unless explicitly confirmed
13. Update `dannlearn.json` only after selected files are applied:

```json
{
  "dannlearn_commit": "<new upstream/main sha>",
  "synced_at": "<ISO timestamp>",
  "repo": "<existing repo>",
  "base_branch": "<existing base_branch or main>",
  "dev_branch": "<existing dev_branch or dev>"
}
```

14. Commit selected sync files if the user allowed auto-commit:

```text
chore(sync): pull DannLearn starter updates

DannLearn-Action: sync-upstream
DannLearn-Source: Danncode10/DannLearn@<sha>
```

## Output Format

Report:

- upstream SHA
- selected files applied
- files skipped
- files needing manual merge
- whether `dannlearn.json` was updated
- commit made, if any

## Safety Rules

- Never run broad `git checkout upstream/main -- .`.
- Never touch private subject content unless the user explicitly names a file and confirms.
- Never overwrite modified files without showing a diff first.
- Stop on dirty working tree.
