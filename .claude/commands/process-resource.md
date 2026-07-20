---
description: Converts a manually added raw resource into cleaned Markdown notes under a subject's resources/processed folder.
argument-hint: <subject> <resource>
---

# /process-resource

Convert one raw resource into a grounded processed Markdown note.

User argument:

```text
$ARGUMENTS
```

## Procedure

1. Read `AGENTS.md`.
2. Read `CLAUDE.md`.
3. Parse `$ARGUMENTS` as:

```text
<subject> <resource>
```

4. Find the best matching subject under `Subjects/`.
5. Find the resource under `Subjects/<Subject>/resources/raw/`.
   - Accept exact filenames, partial names, or paths inside `resources/raw/`.
   - If multiple resources match, list candidates and ask the user to choose.
   - If no resource matches, show available raw resources.
6. Detect the resource type by extension and content:
   - Markdown/text: read directly.
   - PDF: extract text page by page where possible.
   - DOCX: extract headings, paragraphs, tables, and visible embedded text where possible.
   - PPTX: extract slide titles, body text, speaker notes, tables, and visible diagram text where possible.
   - Images: extract visible text when OCR/vision is available; otherwise describe the image and mark the limitation.
   - Unknown/binary: report what can and cannot be extracted.
7. Create `Subjects/<Subject>/resources/processed/` if missing.
8. Write one processed Markdown file:

```text
Subjects/<Subject>/resources/processed/<resource-slug>.processed.md
```

If the processed file already exists, create the next version:

```text
<resource-slug>.processed.v002.md
```

## Visual And Graph Handling

When the resource contains images, diagrams, charts, or graphs:

- Extract visible labels and text.
- Describe what the visual communicates in plain language.
- Preserve chart axes, legends, values, and relationships when visible.
- Use Mermaid only when the visual is a clear flow, hierarchy, timeline,
  sequence, or relationship graph that can be represented accurately.
- After every Mermaid diagram, add a short "How to read this" note.
- If the visual is complex or low-confidence, do not force Mermaid. Use a text
  description and mark `Confidence: low`.
- Never invent hidden values, labels, or relationships.

## Required Output File Structure

````markdown
# <Resource Title> - Processed Notes

## Source

- Subject:
- Raw resource:
- Resource type:
- Processed at:

## Extraction Notes

- What was extracted:
- What could not be extracted:
- Visual interpretation confidence:

## High-Level Summary


## Key Terms

| Term | Meaning | Source location |
|---|---|---|
|  |  |  |

## Main Ideas

- 

## Important Details

- 

## Tables / Figures / Graphs

### <Figure or Table Name>

Description:

Extracted text:

How to read this:

Confidence:

## Potential Reviewer Sections

- 

## Potential Quiz Targets

- 

## Potential Flashcards

- 

## Unclear Or Unsupported Items

- 
````

## Completion Response

Report:

- subject
- raw resource used
- processed file created
- extraction limitations
- whether visuals/graphs were described, converted to Mermaid, or unavailable
- suggested next command: `/make-reviewer <subject> <resource-or-topic>`

## Safety Rules

- Do not delete, move, or edit the raw resource.
- Do not pretend OCR or visual extraction succeeded if it did not.
- Do not create reviewers, quizzes, or flashcards from this command.

