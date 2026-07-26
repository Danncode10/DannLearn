---
description: Bootstraps an existing repo into DannLearn conventions without touching private subject content.
argument-hint: [--force]
---

# /adopt-dannlearn

Adopt an existing repo into DannLearn conventions.

Use this when a repo was not cloned from DannLearn but should use DannLearn's
folder structure, templates, docs, and command workflow.

User argument:

```text
$ARGUMENTS
```

## Procedure

1. Read `AGENTS.md` if present.
2. Read `CLAUDE.md` if present.
3. Check preflight:

```bash
git rev-parse --is-inside-work-tree
git status --porcelain
git remote get-url origin
test -f dannlearn.json && cat dannlearn.json
```

4. Stop if:
   - this is not a git repo
   - the working tree is dirty
   - there is no `origin`
   - `dannlearn.json` already exists and `--force` was not passed

5. Add or verify the upstream remote:

```bash
git remote get-url upstream || git remote add upstream https://github.com/Danncode10/DannLearn.git
git fetch upstream --quiet
```

6. Compare the remotes:

```bash
git remote get-url origin
git remote get-url upstream
```

   Stop if `origin` and `upstream` resolve to the same repository. A
   personal learning repository must have a distinct origin before it adopts
   DannLearn.

7. Get the upstream commit:

```bash
git rev-parse upstream/main
```

8. Copy only starter-owned paths from upstream when they are missing:

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

9. Never overwrite without showing the diff first.
10. Never copy or replace:

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

11. Create `dannlearn.json`:

```json
{
  "dannlearn_commit": "<upstream/main sha>",
  "synced_at": "<ISO timestamp>",
  "repo": "https://github.com/Danncode10/DannLearn",
  "base_branch": "main",
  "dev_branch": "dev"
}
```

12. Create `Subjects/` and `Subjects/README.md` if missing.
13. Commit only adoption files if the user allowed auto-commit:

```text
chore: adopt DannLearn conventions

DannLearn-Action: adopt
DannLearn-Source: Danncode10/DannLearn@<sha>
```

## Output Format

Report:

- whether adoption succeeded
- upstream SHA recorded
- files created or skipped
- files requiring manual review
- whether `Subjects/` content was left untouched
- suggested next command: `/new-subject <name>` or `/sync-upstream`

## Safety Rules

- Do not touch private subject content.
- Do not overwrite existing files without showing the diff and asking.
- Do not run broad `git checkout upstream/main -- .`.
- Stop on dirty working tree.
