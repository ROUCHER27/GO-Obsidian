---
name: note-rules
description: Go Obsidian reading note business rules (fields, tags, Callouts semantics)
---

# Reading Note Rules

> [!tip] Syntax Specifications
> See `syntax/obsidian-markdown.md` for Obsidian Markdown syntax details

> [!tip] Note Template
> See `templates/summary.md` for complete note structure template

---

## Frontmatter Field Specifications

### Required Fields (Aligned with Reading Tracker)

```yaml
---
title: Article Title
date: 2026-01-24
source: https://original-link
type: blog                    # blog/paper/tweet/doc
status: unread                # unread/reading/done
progress: 0                   # 0-100
tags:
  - reading-notes
  - topic-tag
---
```

| Field | Description | Example | Reading Tracker Usage |
|-------|-------------|---------|----------------------|
| `title` | Original title | `"The Illustrated Transformer"` | Display |
| `date` | Note creation date | `2026-01-24` | Sort/filter by date |
| `source` | Original link | `"https://..."` | Display source |
| `type` | Source category | `blog` / `paper` / `tweet` / `doc` | Group by type |
| `status` | Reading status | `unread` / `reading` / `done` | Group by status |
| `progress` | Progress percentage | `0` - `100` | Progress bar display |
| `tags` | Category tags | `[reading-notes, transformer]` | Topic aggregation |

### Optional Fields

| Field | Description | Example |
|-------|-------------|---------|
| `author` | Original author | `"Jay Alammar"` |
| `aliases` | Note aliases | `["Illustrated Transformer"]` |
| `rating` | Rating | `5` |
| `related` | Related note links | `"[[Other Note]]"` |

---

## Tags Naming Conventions

### Categorization Strategy

| Category | Naming Rule | Example |
|----------|-------------|---------|
| Technical | Lowercase English, hyphen-separated | `#transformer`, `#machine-learning` |
| Functional | Descriptive | `#reading-notes`, `#to-organize`, `#important` |
| Source | Lowercase English | `#blog`, `#paper`, `#tweet`, `#doc` |

### Nested vs Flat

**Recommend flat** (unless user habits show nesting):

```
✅ Recommended
#llm
#transformer
#attention

❌ Avoid deep nesting
#AI/NLP/Transformer/Attention
```

---

## Callouts Semantic Mapping

go-obsidian Callout usage conventions:

| Callout | Purpose | Example Scenario |
|---------|---------|------------------|
| `[!important]` | Core points | Author's most important argument |
| `[!quote]` | Original quotes | Direct quotes from source |
| `[!tip]` | Practical suggestions | Actionable recommendations |
| `[!note]` | Personal understanding | My thoughts and additions |
| `[!warning]` | Cautions | Warnings or limitations from source |
| `[!example]` | Examples | Cases from the source |
| `[!question]` | To be confirmed | Uncertain interpretations |
| `[!info]` | Source information | Article metadata |
| `[!abstract]` | Abstract | Paper Abstract |

### Usage Examples

```markdown
> [!important] Core Point
> Self-Attention mechanism allows the model to attend to all positions in the input sequence when processing each word.

> [!quote] Original
> "Attention is all you need."

> [!note] My Understanding
> The scaling factor here is to prevent the dot product from being too large, causing softmax gradient vanishing.

> [!tip]- Practical Suggestion (collapsed by default)
> Consider using Flash Attention to optimize memory during implementation.
```

---

## Date Format

**Standard:** `YYYY-MM-DD`

```yaml
date: 2026-01-24
```
