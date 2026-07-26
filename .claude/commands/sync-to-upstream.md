---
description: Contributes generic DannLearn improvements upstream through a draft PR and always reports the review URL.
argument-hint: [path|--dry-run]
---

# /sync-to-upstream

Contribute generic DannLearn commands, templates, or documentation from the
current personal repository to the DannLearn upstream repository. This is the
reverse of /sync-upstream.

Use this for reusable starter improvements, never for private study material.
When selected upstream candidates exist, this command pushes a contribution
branch to the current repository's `origin`, creates a draft pull request into
`upstream`, and reports its URL. It never merges a pull request. GitHub requires
`origin` to be a fork of `upstream` for this cross-repository pull request.

User argument:

~~~text
$ARGUMENTS
~~~

## Argument Parsing

- No argument: scan all candidate paths and create a draft PR for safe upstream
  candidates.
- --dry-run: show the classification and prospective branch/compare URL only.
  Do not create commits, branches on the remote, or a pull request.
- <path>: scan only that path. It must be inside an allowed candidate path.

## Preflight Checks

1. Read AGENTS.md, CLAUDE.md, and dannlearn.json.
2. Stop if dannlearn.json is missing. Recommend /adopt-dannlearn.
3. Stop if git status --porcelain is not empty. Do not build a contribution
   from uncommitted changes.
4. Verify that both `origin` and `upstream` remotes exist:

   ~~~bash
   git remote get-url origin
   git remote get-url upstream
   ~~~

5. Stop if `origin` and `upstream` point to the same repository. The
   contribution must come from the personal repo or fork (`origin`) into the
   starter repo (`upstream`).
6. Verify that the upstream remote matches the repository recorded in
   dannlearn.json, and can be fetched:

   ~~~bash
   git remote get-url upstream
   git fetch upstream --quiet
   ~~~

7. Verify that `origin` can be fetched and pushed:

   ~~~bash
   git fetch origin --quiet
   git ls-remote --exit-code origin
   ~~~

8. Resolve GitHub repository names for `origin` and `upstream`, then verify
   that `origin` is a fork of `upstream`:

   ~~~bash
   gh repo view <origin-owner>/<origin-repo> --json isFork,parent
   gh repo view <upstream-owner>/<upstream-repo> --json nameWithOwner
   ~~~

   Stop with this error if `origin` is not a fork whose parent is `upstream`:

   ~~~text
   ERROR: origin is not a fork of upstream, so GitHub cannot create a pull
   request from this repository into DannLearn. Recreate the personal repo as a
   fork of upstream, or ask a maintainer to use a temporary upstream branch.
   ~~~

9. Verify GitHub CLI availability and authentication:

   ~~~bash
   gh --version
   gh auth status
   ~~~

## Candidate Scan

Use dannlearn_commit from dannlearn.json as the comparison anchor:

~~~bash
git diff --name-status <dannlearn_commit> HEAD -- <candidate paths>
~~~

Candidate paths:

~~~text
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
~~~

Always keep these paths local unless the user explicitly names the path and
confirms the override:

~~~text
Subjects/<Subject>/
Subjects/**/resources/
Subjects/**/reviewers/
Subjects/**/quizzes/
Subjects/**/flashcards/
Subjects/**/practice-sets/
Subjects/**/notes/
.env*
~~~

Classify each candidate:

- UPSTREAM CANDIDATE: generic command prompts, templates, documentation, or
  starter fixes without private content.
- KEEP LOCAL: subject resources, generated artifacts, personal notes, secrets,
  or other private material.
- REVIEW NEEDED: mixed, unclear, deleted, or potentially conflicting content.

For every selected file, scan for common secret patterns such as sk-, eyJ,
SUPABASE_, and NEXT_PUBLIC_. Stop if any are found.

## Contribution Workflow

1. Present a numbered classification table.
2. Select all UPSTREAM CANDIDATE files by default. Do not include KEEP LOCAL
   or REVIEW NEEDED files without explicit user confirmation.
3. If no safe candidates exist, report that no PR was created and stop.
4. Save the selected files, their upstream versions, and unified diffs under:

   ~~~text
   /tmp/dannlearn-upstream-patch/
   ~~~

5. Create a clean temporary worktree from the current repository:

   ~~~bash
   git worktree add /tmp/dannlearn-contrib-<timestamp> upstream/<base-branch>
   ~~~

6. Create a feature branch named codex/<contribution-name>.
7. Copy only the selected files into matching paths in the clean clone.
8. Inspect the final diff and stage only those selected files.
9. Commit with a concise conventional commit message.
10. Push the feature branch to `origin`. Never push to `main` or
    `upstream/main`.
11. Create a draft pull request from `origin` into `upstream`:

    ~~~bash
    gh pr create \
      --repo <upstream-owner>/<upstream-repo> \
      --draft \
      --base <base-branch> \
      --head <origin-owner>:<branch> \
      --title <title> \
      --body-file <body-file>
    ~~~

12. Print the draft PR URL prominently. Never merge, approve, or enable
    auto-merge for the pull request.

## Output Format

~~~text
# sync-to-upstream Report

| # | Status | Classification | Path |
|---:|---|---|---|
| 1 | Added / Modified / Deleted | UPSTREAM CANDIDATE / KEEP LOCAL / REVIEW NEEDED | <path> |

Selected for draft PR:
- <path>

Patch folder:
/tmp/dannlearn-upstream-patch/

Draft PR:
<url>

PR direction:
<origin-owner>:<branch> -> <upstream-owner>/<upstream-repo>:<base-branch>

Merge status:
Not merged. Review the draft PR before any merge decision.
~~~

## Safety Rules

- Do not include private Subjects/ content by default.
- Do not include generated reviewers, quizzes, flashcards, or practice sets.
- Never push to a default branch.
- Push contribution branches to `origin`, not to `upstream`.
- Open the draft PR against the `upstream` repository using
  `--head <origin-owner>:<branch>`.
- Stop instead of creating the PR when `origin` is not a fork of `upstream`.
- Always create a draft PR for selected safe candidates, then print its URL.
- Never merge a pull request from this command.
