# Use → Extend → Invent — decision protocol

Run every UI element through this gate, in order. The point is never to silently leave the system: the designer must always know what's reused, what's stretched, and what's new.

## Default posture: design FROM the design system. Inventing is a last resort.
The strong default is to build everything from what the DS already provides. **Do not invent a new component to solve a problem that existing components can compose.** Inventing is allowed only when 1–3 below genuinely cannot cover the need — and even then it is **never silent**: flag it and, unless the designer told you to proceed autonomously, **surface it and ask before adding a new component.**

## Five categories — every element gets exactly one

| | Category | Meaning | Action |
|---|---|---|---|
| ♻️ | **REUSE** | exists in the DS, used as-is | none |
| 🧩 | **COMPOSE** | a "missing" need built entirely from existing DS components + tokens (e.g. an empty state = Card + DS icon + text + Button). Still 100% in-system — **no new component** | prefer this over Extend/Invent |
| ➕ | **EXTEND** | a DS component + a new variant/state | document it |
| ✨ | **INVENT** | a genuinely new component — only when Reuse/Compose/Extend all fail | **flag + ask first**, then propose to add to the DS |
| ⚠️ | **PLACEHOLDER** | an off-system stand-in used only because the mock can't render the real DS (e.g. an emoji where the DS has an icon component, lorem media, a raw `<input>` where `searchInput` exists) | **NOT a design decision** — must be replaced with the DS equivalent before build; list every one |

**Before declaring EXTEND or INVENT, re-verify the DS.** Re-scan the component list and tokens for anything that already covers the need (it's easy to miss components like `timeline`, `virtualTable`, `list`, `expansionPanel`). Only after that search comes up empty do you move down the ladder.

**Icons are the classic trap.** If the product has an icon system / `iconButton`, every glyph MUST map to a named DS icon. Emojis or ad-hoc SVGs in a mock are **PLACEHOLDER**, never Invent — name the intended DS icon for each.

## Completeness & visibility (mandatory)
- **Audit every element, not a sample.** The Design System Impact output must account for *all* elements in the deliverable, each tagged with one of the four categories. No silent off-system usage.
- **Make it visible to the designer.** When the output is an HTML mock, include an **audit overlay** (a toggle) that visually outlines each element by category with a legend, so the designer can SEE what's reused vs extended vs invented vs placeholder — not just read prose.

## The gate

### 1. REUSE  (default)
A suitable token/component already exists in `DESIGN_CONTEXT.md`.
→ Use it exactly: correct component, correct variant/state, correct token. Do not re-implement.
→ No annotation needed.

### 2. COMPOSE  (preferred before any new component)
The exact component doesn't exist, but the need can be built from existing DS components + tokens.
→ Assemble it from primitives (e.g. empty state = `card` + DS icon + text + `button`; a stat row = `tag` + `tooltip`). No new component, no new token.
→ **Annotate:** `COMPOSE <pattern> = <componentA> + <componentB> + …`. This keeps it 100% in-system.

### 3. EXTEND
Close, but the exact variant/size/state/token isn't there.
→ Add it **in the DS's own language** (same naming, same token scale, same motion).
→ Drive the spec with `designer-skills` → `design-systems/component-spec` + `design-token`.
→ **Annotate:** `EXTEND <component>: +<variant/prop/state> — <reason>`. Log it in the Decisions Log.

### 4. INVENT  (last resort — flag and ask first)
Only when Reuse, Compose, and Extend all genuinely fail. **Never invent silently.** Surface it explicitly and — unless the designer said to proceed autonomously — pause and ask before introducing a new component.
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
