# Use → Extend → Invent — decision protocol

Run every UI element through this gate, in order. The point is never to silently leave the system: the designer must always know what's reused, what's stretched, and what's new.

## Four categories — every element gets exactly one
There is a fourth bucket beyond Reuse/Extend/Invent that is easy to miss and causes confusion:

| | Category | Meaning | Action |
|---|---|---|---|
| ♻️ | **REUSE** | exists in the DS, used as-is | none |
| ➕ | **EXTEND** | a DS component + a new variant/state | document it |
| ✨ | **INVENT** | a genuinely new component | propose to add to the DS |
| ⚠️ | **PLACEHOLDER** | an off-system stand-in used only because the mock can't render the real DS (e.g. an emoji where the DS has an icon component, lorem media, a raw `<input>` where `searchInput` exists) | **NOT a design decision** — must be replaced with the DS equivalent before build; list every one |

**Icons are the classic trap.** If the product has an icon system / `iconButton`, every glyph MUST map to a named DS icon. Emojis or ad-hoc SVGs in a mock are **PLACEHOLDER**, never Invent — name the intended DS icon for each.

## Completeness & visibility (mandatory)
- **Audit every element, not a sample.** The Design System Impact output must account for *all* elements in the deliverable, each tagged with one of the four categories. No silent off-system usage.
- **Make it visible to the designer.** When the output is an HTML mock, include an **audit overlay** (a toggle) that visually outlines each element by category with a legend, so the designer can SEE what's reused vs extended vs invented vs placeholder — not just read prose.

## The gate

### 1. REUSE  (default)
A suitable token/component already exists in `DESIGN_CONTEXT.md`.
→ Use it exactly: correct component, correct variant/state, correct token. Do not re-implement.
→ No annotation needed.

### 2. EXTEND
Close, but the exact variant/size/state/token isn't there.
→ Add it **in the DS's own language** (same naming, same token scale, same motion).
→ Drive the spec with `designer-skills` → `design-systems/component-spec` + `design-token`.
→ **Annotate:** `EXTEND <component>: +<variant/prop/state> — <reason>`. Log it in the Decisions Log.

### 3. INVENT
Nothing fits, or the product genuinely needs something more innovative / delightful.
→ Design it, but it must stay **coherent** with the DS visual language (tokens, rhythm, motion).
→ Use `frontend-design` for the creative direction and `design-systems/component-spec` + `motion-system` to formalize it.
→ **Flag explicitly** as a new pattern, and **propose it back** (see Impact format below).
→ If DS status is NONE, every Invent seeds the bootstrap system — record tokens + primitive.

## Choosing Extend vs Invent
- Can an existing component absorb this with one new variant/prop? → **Extend**.
- Would forcing it into an existing component distort that component's meaning? → **Invent**.
- Is the novelty the *point* (a signature, delightful moment)? → **Invent**, deliberately.

## Design System Impact — the "update and tell them" output
Always end deliverables with this block:

```
## Design System Impact
- REUSED: <list> — 100% within the system where possible
- EXTENDED:
  - <component> → +<variant/state> | spec: <code stub or Figma spec> | tokens added: <none|list>
- INVENTED (propose to adopt):
  - <pattern name> — why it was needed: <…>
    - Spec: <component stub / Figma component spec>
    - New tokens: <list or none>
    - Coherence note: how it stays on-brand with the existing DS
- If nothing new: state explicitly "Fully within the existing design system."
```

Governance/adoption questions (when to merge into the DS, ownership) → `designer-skills` → `design-systems/design-system-governance`.
