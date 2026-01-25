---
name: canvas-rules
description: Go Obsidian Canvas layout specifications (requires json-canvas basics)
---

# Canvas Layout Specifications

> [!tip] Syntax Specifications
> See `syntax/json-canvas.md` for Canvas JSON syntax details

> [!tip] Layout Patterns
> See `rules/content-types.md` for specific layout patterns by content type

---

## Y-Axis Zones (Top to Bottom)

```
y = -800 ~ -600   Title Zone     → Blue(1), main title
y = -500 ~ -100   Overview Zone  → Green(4), core concepts
y = 0 ~ 600       Main Zone      → Yellow(3), detailed steps
y = 700 ~ 1200    Summary Zone   → Purple(6), conclusions/formulas
y > 1300          Extension Zone → No color, links and related notes
```

## X-Axis Layout

```
x < -400          Left auxiliary zone
x = -300 ~ 300    Center main line
x > 400           Right extension zone
```

---

## Color Usage Guidelines

> [!warning] MANDATORY: Use Multiple Colors
> Your Canvas MUST use at least 3 different colors. THIS IS REQUIRED.

**Principles (FOLLOW STRICTLY):**
- **MANDATORY**: Use at least 3 different colors in every Canvas
- Colors are NOT rigidly mapped to specific semantics
- Available: `"1"` Blue, `"2"` Orange, `"3"` Yellow, `"4"` Green, `"5"` Cyan, `"6"` Purple

**Color Assignment Guidelines:**
- **Title/Main**: Use Blue (1) or Purple (6) for titles
- **Core Content**: Use Green (4) or Yellow (3) for key concepts
- **Process/Dynamics**: Use Orange (2) or Cyan (5) for processes
- **Variety Required**: Must have visible color diversity in the final canvas

**DO NOT:**
- Use only one color throughout
- Create a monochromatic canvas
- Assign colors without variation

---

## Node Size Recommendations

| Purpose | Width | Height |
|---------|-------|--------|
| Main title | 800-1000 | 100-160 |
| Detail card | 400-600 | 300-500 |
| Concept card | 300-450 | 150-300 |
| Brief point | 200-300 | 80-150 |
| Link node | 250-400 | 80-120 |

**Spacing:** Horizontal 50-100px, Vertical 40-80px

---

## Wikilink Conventions

### Canvas linking to note file

```json
{
  "id": "related-note",
  "type": "file",
  "file": "Article Title - Reading Notes.md",
  "x": 300,
  "y": 1400,
  "width": 300,
  "height": 150
}
```

### Canvas linking to original source

```json
{
  "id": "source-link",
  "type": "link",
  "url": "https://original-link",
  "x": -200,
  "y": 1400,
  "width": 400,
  "height": 100
}
```

### Note linking to Canvas

```markdown
> [!tip] Visual Overview
> See [[Article Title - Canvas]] for knowledge structure map
```

---

## Edge Usage Recommendations

### Flow Direction

| Flow Type | fromSide | toSide |
|-----------|----------|--------|
| Left to right | `right` | `left` |
| Top to bottom | `bottom` | `top` |
| Radial | `bottom/right` | `top/left` |

### Edge Color

Edge color matches **source node** color, forming visual flow lines:

```json
{
  "id": "e1",
  "fromNode": "step1",
  "fromSide": "bottom",
  "toNode": "step2",
  "toSide": "top",
  "color": "2"
}
```

### Labeled Edges (for decision branches)

```json
{
  "id": "e-yes",
  "fromNode": "decision",
  "toNode": "yes-branch",
  "label": "Yes",
  "color": "4"
}
```

---

## Canvas Validation (Required)

> [!warning] Mandatory Check
> After creating any .canvas file, you MUST validate it.

### Validation Steps

> [!danger] MANDATORY COLOR CHECK:
> - [ ] Canvas uses AT LEAST 3 different colors
> - [ ] Not monochromatic (not all white/gray)
> - [ ] Color variety is visible
> - [ ] Each color corresponds to actual node (not empty)

1. **Read back the file** after writing
2. **Verify valid JSON** (no trailing commas, proper brackets)
3. **Check all node IDs are unique**
4. **Check all edge references point to existing nodes**

### Common Issues to Avoid

- Missing commas between array elements
- Unescaped special characters in text
- `fromNode`/`toNode` referencing non-existent IDs
- Duplicate node IDs

> [!important] If Validation Fails
> Fix issues immediately before telling user the Canvas is complete.
