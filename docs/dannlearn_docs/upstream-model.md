# Upstream Model

DannLearn should support personal projects while remaining open-source friendly.

## Version Anchor

`dannlearn.json` records the upstream template version a project is synced from.
Future sync commands should update this file only when selected upstream changes
actually land.

## Upstreamable By Default

- `.claude/`
- `.codex/`
- `templates/`
- `docs/dannlearn_docs/`
- Generic scripts or automation added later

## Local By Default

- `Subjects/`
- Private resources
- Personal notes
- Generated artifacts from private resources

## Sync Principle

Prefer selective file-level syncs. Avoid merges that can overwrite learner or
project-specific content.

