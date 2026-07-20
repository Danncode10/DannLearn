# Upstream Model

DannLearn should support personal projects while remaining open-source friendly.

## Version Anchor

`dannlearn.json` records the upstream template version a project is synced from.
Future sync commands should update this file only when selected upstream changes
actually land.

The recommended way to create a new personal learning repo is the installer:

```bash
curl -sSL https://raw.githubusercontent.com/Danncode10/DannLearn/main/install.sh | bash
```

The installer clones DannLearn, renames the starter remote to `upstream`, asks
for an optional personal `origin`, and writes `dannlearn.json`.

## Upstreamable By Default

- `.claude/`
- `.codex/`
- `templates/`
- `docs/dannlearn_docs/`
- Generic scripts or automation added later
- `install.sh`
- `guide.sh`

## Local By Default

- `Subjects/`
- Private resources
- Personal notes
- Generated artifacts from private resources

## Sync Principle

Prefer selective file-level syncs. Avoid merges that can overwrite learner or
project-specific content.

## Commands

| Command | Purpose |
|---|---|
| `/adopt-dannlearn` | Bootstraps an existing repo into DannLearn conventions. |
| `/update-dannlearn` | Checks the current anchor and latest upstream starter changes. |
| `/sync-upstream` | Pulls selected starter updates into a project. |
| `/sync-to-upstream` | Prepares generic local improvements for an upstream PR. |

These commands should not include `Subjects/<Subject>/` content by default.
