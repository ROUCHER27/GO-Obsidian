---
name: content-types
description: Adaptation rules for different content types
---

# Content Type Adaptation Rules

## Blog / Technical Article

### Identification Features

- Source: Medium, dev.to, personal blogs, GitHub Pages
- Characteristics: Long-form, contains code, has diagrams

### Processing Focus

1. **Author's Views** - Extract core arguments and insights
2. **Practical Suggestions** - Actionable recommendations and best practices
3. **Code Examples** - Preserve key code snippets (omit for text-only blogs)
4. **Diagram Descriptions** - Describe key diagram content in text

### Content Focus (NOT a rigid template)

Focus on extracting:
- Author's core arguments and insights
- Practical, actionable recommendations
- Key code examples (if technical)
- Important diagrams (describe in text)

> [!note] Flexible Structure
> Organize based on article's actual structure and logic.
> Use numbered sections, callouts, mermaid, tables as appropriate.

### Canvas

⚠️ **Ask user:** "Do you need an argument flowchart Canvas?"

**Layout Pattern: Argument Flowchart**

```
        ┌─────────────┐
        │   Title (1)  │  y=-800
        └──────┬──────┘
               │
     ┌─────────┴─────────┐
     ▼                   ▼
┌─────────┐         ┌─────────┐
│Concept A│         │Concept B│  y=-400
│   (4)   │         │   (4)   │
└────┬────┘         └────┬────┘
     │                   │
     ▼                   ▼
┌─────────┐         ┌─────────┐
│Detail A │         │Detail B │  y=0
│   (3)   │         │   (3)   │
└────┬────┘         └────┬────┘
     └─────────┬─────────┘
               ▼
        ┌─────────────┐
        │  Summary (6) │  y=600
        └─────────────┘
```

---

## Twitter / X / Reddit Threads

### Identification Features

- Source: x.com, twitter.com, reddit.com
- Characteristics: Short-form, may have Thread, has comments

### Processing Focus

1. **Main Post Content** - Focus only on OP's original content
2. **Ignore** - Ads, news promotions, irrelevant comments
3. **Embedded Links** - Record GitHub repos, articles, etc. mentioned in tweet
4. **Comment Summary** - Focus on OP's replies and interactions

### Content Focus (NOT a rigid template)

**Short Thread (1-5 posts):** Focus on core points, key quotes, related links

**Long Thread (5+ posts):** Add thread overview, main arguments breakdown, selected comments

> [!note] Flexible Structure
> Organize based on thread's actual flow and key insights.
> Use callouts for standout quotes, tables for comparisons.

### Canvas

⚠️ **Ask user:** "Do you need a key points card Canvas?"

**Layout Pattern: Key Points Cards**

```
        ┌─────────────┐
        │   Topic (1)  │  y=-400
        └──────┬──────┘
               │
    ┌──────────┼──────────┐
    ▼          ▼          ▼
┌──────┐  ┌──────┐  ┌──────┐
│Point1│  │Point2│  │Point3│  y=0
│ (4)  │  │ (4)  │  │ (4)  │
└──────┘  └──────┘  └──────┘
```

---

## Paper

### Identification Features

- Source: arXiv, ACL, NeurIPS, IEEE, PDF
- Characteristics: Structured, has Abstract, has formulas

### Processing Focus

1. **Abstract** - Preserve completely
2. **Method** - Core methodology
3. **Results** - Key experimental results
4. **Conclusion** - Author's conclusions
5. **LaTeX Formulas** - Must preserve, use `$...$` or `$$...$$`

### Content Focus (NOT a rigid template)

Focus on extracting:
- Paper metadata (title, authors, published, link)
- Abstract (preserve completely)
- Research question and motivation
- Core methodology and key formulas (use `$...$` or `$$...$$`)
- Experimental results and conclusions

> [!note] Flexible Structure
> Organize based on paper's actual structure.
> Use mermaid for method flows, tables for results comparison.

### Canvas

✅ **Generate by default:** Research flowchart (Problem → Method → Experiment → Conclusion)

**Layout Pattern: Research Flowchart**

```
┌─────────────────────────────────────┐
│           Paper Title (1)            │  y=-800
└──────────────────┬──────────────────┘
                   │
    ┌──────────────┼──────────────┐
    ▼              ▼              ▼
┌────────┐    ┌────────┐    ┌────────┐
│Problem │    │Method  │    │Experim.│  y=-300
│  (2)   │    │  (4)   │    │  (3)   │
└───┬────┘    └───┬────┘    └───┬────┘
    │             │             │
    └─────────────┼─────────────┘
                  ▼
           ┌────────────┐
           │Formula/Algo│  y=200
           │    (5)     │
           └──────┬─────┘
                  ▼
           ┌────────────┐
           │Conclusion  │  y=600
           │    (6)     │
           └────────────┘
```

---

## Technical Documentation

### Identification Features

- Source: Official docs, ReadTheDocs, GitHub README
- Characteristics: Tutorial-style, has Quick Start, has API

### Processing Focus

1. **Quick Start** - Getting started steps
2. **Main Features** - Core capabilities overview
3. **API / Usage** - Key interfaces and usage
4. **Gotchas** - Common issues

### Technical Level Adaptation

⚠️ **Ask user:** "What's your familiarity with this domain?"
- Beginner → Keep more explanations, use conversational language
- Familiar → Concise and direct, keep technical terms

### Content Focus (NOT a rigid template)

Focus on extracting:
- What it is and why it matters
- Quick start / installation steps
- Core features and capabilities
- Usage examples with code
- Common gotchas and troubleshooting

> [!note] Flexible Structure
> Organize based on documentation's actual structure.
> Use code blocks for examples, tables for API references.

### Canvas

⚠️ **Ask user:** "Do you need a feature overview Canvas?"

**Layout Pattern: Feature Overview**

```
        ┌─────────────────┐
        │   Tool Name (1)  │  y=-600
        └────────┬────────┘
                 │
        ┌────────┴────────┐
        ▼                 ▼
  ┌───────────┐     ┌───────────┐
  │Quick Start│     │Core Concept│  y=-200
  │    (2)    │     │    (4)    │
  └─────┬─────┘     └─────┬─────┘
        │                 │
        ▼                 ▼
  ┌───────────┐     ┌───────────┐
  │Feature A  │     │Feature B  │  y=200
  │    (3)    │     │    (3)    │
  └─────┬─────┘     └─────┬─────┘
        └────────┬────────┘
                 ▼
        ┌─────────────────┐
        │   Gotchas (5)    │  y=600
        └─────────────────┘
```

---

## Content Type Identification Flow

```
1. Check URL domain
   - arxiv.org, openreview.net → Paper
   - x.com, twitter.com, reddit.com → Social Media
   - docs.*, readthedocs.io, github.com/**/README → Technical Doc
   - Other → Blog/Article

2. Check content features
   - Has Abstract + References → Paper
   - Has Thread structure → Social Media
   - Has Installation + API → Technical Doc
   - Other → Blog/Article

3. When uncertain, ask user
   - "This content looks like {type}, process accordingly?"
```

## General Principles

### Required for All Types

1. ✅ Preserve original link
2. ✅ Note source and author
3. ✅ Use Callouts to highlight key points
4. ✅ Add `## My Thoughts` placeholder section

### Canvas Generation Strategy

| Type | Default Generate | Ask User | Layout Pattern |
|------|------------------|----------|----------------|
| Paper | ✅ | - | Research Flowchart |
| Blog | - | ✅ | Argument Flowchart |
| Tweet | - | ✅ | Key Points Cards |
| Doc | - | ✅ | Feature Overview |

### Flexible Formatting Tools

Use these elements based on content needs:

| Element | When to Use |
|---------|-------------|
| Mermaid flowchart | Process flows, decision trees |
| Mermaid sequenceDiagram | Interactions, temporal sequences |
| Tables | Comparisons, field descriptions |
| Numbered sections | Long documents with progression |
| `[!info]` | Document metadata, context |
| `[!note]` | Supplementary explanations |
| `[!important]` | Critical points, key insights |
| `[!tip]` | Practical suggestions |
| `[!warning]` | Cautions, common mistakes |
| `[!summary]` | Section summaries |
| Emoji (⭐❌✅🔄) | Visual emphasis |
| `---` | Section separation |

> [!tip] Follow the Content, Not the Template
> Let the source material's structure guide your organization.
