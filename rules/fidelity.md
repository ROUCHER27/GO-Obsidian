---
name: fidelity-rules
description: Fidelity to source rules - Minimize information loss
---

# Fidelity to Source Rules

## Core Principle

> **Minimize information loss, maximize comprehension aids**

Summarization is not rewriting, but helping readers better understand the original. If users report that your summary is too obscure, take appropriate measures to reduce comprehension difficulty, such as vivid examples, analogies, etc. After receiving positive feedback about comprehension, record this complexity level in 'user-habits.md'.

## MUST DO ✅

### 1. Preserve Core Arguments

```markdown
> [!important] Author's Core Point
> Direct quote or accurate restatement of author's core argument
```

### 2. Preserve Key Original Expressions

When the author has concise expressions, quote directly:

```markdown
> [!quote] Original
> "Attention is all you need"
```

### 3. Preserve Data and Evidence

```markdown
Experimental results show the model improved **2.8 points** on BLEU score (from 25.8 to 28.6).
```

### 4. Preserve Formulas

```markdown
$$
\text{Attention}(Q, K, V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V
$$
```

### 5. Preserve Key Images

```markdown
> [!note] Key Diagram
> ![Key Diagram](https://original-image-url.png)
> *Figure 1: Model architecture overview from the original paper*
>
> This diagram illustrates the multi-head attention mechanism...
```

> [!tip] Image Preservation Guidelines
> - Keep important diagrams/figures that contain key information
> - Prefer original images over text descriptions when they add value
> - Maintain proper attribution by noting it's from the original source
> - If image can't be directly embedded, describe it in detail

### 5. Preserve Source Attribution

```yaml
---
source: https://complete-original-link
---
```

```markdown
> [!info] Source
> [Original Title](https://link) - Author Name
```

## FORBIDDEN ❌

### 1. Do Not Add Views Not in Original

```markdown
# ❌ Wrong
The author believes Transformer will replace all RNNs (not stated in original)

# ✅ Correct
The author believes Transformer outperforms RNN on translation tasks
```

### 2. Do Not Over-Simplify to Distortion

```markdown
# ❌ Wrong
Self-Attention is just computing similarity

# ✅ Correct
Self-Attention computes attention weights via Query-Key dot product,
then applies weighted sum over Values
```

### 3. Do Not Omit Qualifying Conditions

```markdown
# ❌ Wrong
Transformer performs best

# ✅ Correct
Transformer achieves SOTA on English-German translation task
```

### 5. Do Not Change Author's Stance

```markdown
# ❌ Wrong
The author strongly recommends using this method (original just introduces it)

# ✅ Correct
The author introduces how this method works
```

## Citation Formats

### Direct Quote

Use when author's words are particularly concise or important:

```markdown
> [!quote] Original
> "The dominant sequence transduction models are based on complex
> recurrent or convolutional neural networks"
```

### Paraphrased Citation

Use when summarizing longer passages, cite the source:

```markdown
The author notes that traditional sequence models rely on complex recurrent or convolutional structures (Section 1).
```

### Data Citation

```markdown
According to Table 2, BLEU score comparison:
- Transformer (base): 27.3
- Transformer (big): 28.4
```

## Distinguishing "Facts" from "Understanding"

### Facts (Must Be Faithful)

- Author's explicit statements
- Experimental data and results
- Formulas and algorithms
- Cited sources

### Understanding (Can Add But Must Label)

```markdown
> [!note] My Understanding
> The scaling factor 1/√d_k here is to prevent large dot products from causing softmax gradient vanishing.
> (This is my understanding based on context, not directly stated in original)
```

## Checklist

Self-check after generating notes:

- [ ] Are core arguments fully preserved?
- [ ] Are key data accurate?
- [ ] Are formulas correct?
- [ ] Are important images/diagrams included? (or described if can't embed)
- [ ] Is original link included?
- [ ] Is "original view" distinguished from "my understanding"?
- [ ] Are there assertions not in the original?

## Handling Uncertainty

```markdown
> [!question] To Be Confirmed
> The original expression is unclear here, possible interpretations:
> 1. Interpretation A
> 2. Interpretation B
>
> Suggest reading original Section X to confirm.
```
