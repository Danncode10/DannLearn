---
description: Prepares generic DannLearn command, docs, or template improvements for an upstream PR.
argument-hint: [path|--dry-run]
---

# /sync-to-upstream

Prepare local starter improvements to contribute back to DannLearn upstream.

Use this for generic improvements, not private study content.

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
5. Verify upstream:

```bash
git remote get-url upstream
git fetch upstream --quiet
```

6. Scan candidate paths:

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

7. Always classify these as local/private unless the user explicitly overrides:

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

8. Diff against the recorded anchor:

```bash
git diff --name-status <dannlearn_commit> HEAD -- <path>
```

9. Classify each candidate:
   - UPSTREAM CANDIDATE: command prompts, templates, generic docs, starter fixes
   - KEEP LOCAL: subject resources, generated study artifacts, personal notes
   - REVIEW NEEDED: mixed or unclear content
10. Present a numbered table.
11. If `--dry-run`, stop after the report.
12. Ask which files to prepare.
13. Create patch files under:

```text
/tmp/dannlearn-upstream-patch/
```

14. For selected files, save:
   - upstream version, if it exists
   - local version
   - unified diff patch
15. Tell the user how to open a PR from a clean clone:

```bash
git clone https://github.com/Danncode10/DannLearn.git /tmp/dannlearn-contrib
cd /tmp/dannlearn-contrib
git checkout -b feat/<contribution-name>
cp /tmp/dannlearn-upstream-patch/<files> <matching paths>
git add <files>
git commit -m "feat: <describe contribution>"
git push origin feat/<contribution-name>
```

## Output Format

```text
# sync-to-upstream Report

Upstream candidates:
- <file>

Keep local:
- <file>

Review needed:
- <file>

Patch folder:
/tmp/dannlearn-upstream-patch/
```

## Safety Rules

- Do not include private `Subjects/` content by default.
- Do not include generated quizzes/flashcards/reviewers by default.
- Do not push or open a PR unless the user explicitly asks.
- Stop on dirty working tree.
