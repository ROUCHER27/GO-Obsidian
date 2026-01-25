---
name: go-obsidian
description: Automatically summarize any article into reading/study notes and save to Obsidian vault. When users provide blog, tweet, technical documentation links, or papers, generate summary documents and visual Canvas. Provides reading progress tracking Bases database, supports dynamic learning and updating of user note habits and preferences.
---

# Go Obsidian Skill

Deep reading assistant that converts web pages/documents into structured Obsidian notes and visual Canvas.


## Core Capabilities

1. **Content Fetching** - Fetch blogs/tweets/papers/technical docs
2. **Deep Summarization** - Generate faithful Markdown notes
3. **Visual Overview** - Generate knowledge structure Canvas
4. **Habit Learning** - Dynamically learn and follow user's note style, preferences, and comprehension level
5. **Reading Tracker** - Auto-create reading notes Bases database for indexing and progress tracking

## Tools Used

| Tool | Purpose |
|------|---------|
| WebFetch | Fetch web content |
| Read | Read local PDF/papers, learn user vault habits |
| Glob | Scan user vault .md/.canvas files |
| Write | Create .md and .canvas files |
| Edit | Update user-habits.md |

## Core Workflow

### Vault Detection Logic

```
Before creating files:
1. Glob scan current and parent directories for:
   - *.md files (high density = likely vault)
   - *.canvas files (unique to Obsidian)
   - .obsidian folder (confirms vault)
2. If multiple vaults found → Ask user which one to use
3. If no vault found → Ask user for vault path or create in current dir
```

```
1. Glob scan current Obsidian vault, auto-learn (no confirmation needed)
   → Glob scan .md and .canvas files
   → Read and analyze 3-5 typical documents
   → Extract frontmatter, tags, callouts habits
   → Write to user-habits.md

2. Create 'Reading Tracker.bases'
   → Glob check if *Reading Tracker*.base or similar exists
   → If not, ask user: "Create Reading Tracker? (Recommended)"
   → If agreed, create based on templates/reading-tracker.base
   → Filename: `Reading Tracker.base`, place in user-specified directory
   → Function: Auto-index all documents with #reading-notes tag
```

### Regular Use

```
1. Read user-habits.md

2. Fetch content
   → URL: WebFetch
   → Local file: Read

3. Identify content type (refer to rules/content-types.md)

4. Generate notes
   → Follow user-habits.md style
   → Follow rules/fidelity.md for source fidelity
   → Frontmatter follows rules/frontmatter.md
   → New notes default: status: unread, progress: 0

5. Ask if Canvas is needed

6. Check consistency
   → If request differs from user-habits.md, ask if habits should be updated after task completion

7. End-of-task checks
   → Ask user: "Do you want me to update your preferences in user-habits.md?"
   → Glob scan for `*.base` files in vault
     - If no Reading Tracker found, ask: "No Reading Tracker found. Create one?"
     - If agreed, create based on templates/reading-tracker.base
   → Confirm all files created successfully
```

### Reading Tracker Description

**File**: `Reading Tracker.base` (based on `templates/reading-tracker.base`)

**When to create**: Auto-ask and create on first use

**When to update**: No manual updates needed, Bases auto-indexes all documents with `#reading-notes` tag

**Included views**:
| View | Function | Group By |
|------|----------|----------|
| All Notes | Overview of all reading notes | By source type (type) |
| By Status | View by reading progress | By status (status) |
| Recent Reading | Notes active in last 7 days | No grouping |

**Display fields**: Date → Status icon → Filename → Type icon → Progress bar → Tags

## Reference As Needed

| File | When to Reference |
|------|-------------------|
| `syntax/obsidian-markdown.md` | When creating .md files (syntax specs) |
| `syntax/json-canvas.md` | When creating .canvas files (syntax specs) |
| `syntax/obsidian-bases.md` | When creating .base files (syntax specs) |
| `rules/frontmatter.md` | When creating .md files (writing rules) |
| `rules/canvas.md` | When creating .canvas files (layout rules) |
| `rules/content-types.md` | When identifying content type and layout |
| `rules/fidelity.md` | Always follow |
| `templates/reading-tracker.base` | When creating Reading Tracker |
| `examples.md` | When usage examples are needed |
| `references.md` | When consulting official documentation links |

## Updatable Configuration

- `user-habits.md` - User habits configuration, can be dynamically updated via Edit tool

## File Path saving Rules

> [!info] Save Location
> All generated files (`*.md`, `*.canvas`, `*.base`) are automatically saved to:
> - **Obsidian Vault**: Determined by Glob scan of vault (usually where vault root is found)
> - Ask user if unsure about vault location
> - Never save to random working directories

## Output Specifications

### Summary Document (.md)

- **Extension: `.md`** (required)
- **Filename**: AI decides based on content and context
- Must include original link
- **Structure is flexible** - Model decides organization based on content
- Use appropriate Callouts, mermaid diagrams, tables as needed
- Add Canvas wikilink with AI-chosen name

### Canvas (.canvas)

- **Extension: `.canvas`** (required)
- **Filename**: AI decides based on content
- Detailed layout specs refer to `rules/canvas.md`
- Add link node pointing to original
- Use MULTIPLE colors (refer to Color Guidelines)
