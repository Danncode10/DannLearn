---
description: Smart entry point for pulling latest DannLearn starter updates.
argument-hint: [--init]
---

# /update-dannlearn

Check the current DannLearn version anchor and route to `/sync-upstream` when
starter updates are available.

User argument:

```text
$ARGUMENTS
```

## Procedure

1. Read `AGENTS.md`.
2. Read `CLAUDE.md`.
3. Check project state:

```bash
cat dannlearn.json 2>/dev/null || echo MISSING
git remote get-url upstream 2>/dev/null || echo NO_UPSTREAM
git status --porcelain
```

4. Stop if the working tree is dirty.
5. If `dannlearn.json` is missing:
   - If `--init` is passed, create it using current `upstream/main`.
   - Otherwise tell the user to run `/adopt-dannlearn` first.
6. Ensure `upstream` points to the repo from `dannlearn.json`.
7. Fetch upstream:

```bash
git fetch upstream --quiet
```

8. Read:
   - `dannlearn_commit`
   - `synced_at`
   - `repo`
   - `dev_branch`

9. Show changelog since the anchor:

```bash
git log <dannlearn_commit>..upstream/main --oneline --no-merges
```

10. If there are no new commits, report that the project is up to date.
11. If there are new commits, show affected starter paths:

```text
.claude/
.codex/
templates/
docs/dannlearn_docs/
README.md
CLAUDE.md
AGENTS.md
Subjects/README.md
dannlearn.json
```

12. Ask whether to continue into `/sync-upstream`.

## Output Format

```text
# DannLearn Update Check

Current anchor: <sha>
Upstream latest: <sha>

New commits:
- <sha> <message>

Affected starter areas:
- <path>

Next:
Run /sync-upstream to select files, or stop here.
```

## Safety Rules

- Do not update `dannlearn.json` unless selected upstream files are actually applied.
- Do not touch `Subjects/<Subject>/` content.
- Stop on dirty working tree.

