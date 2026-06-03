---
name: senior-product-designer
description: >
  Design like a senior product designer — grounded in the specific product you're working on, not a generic rulebook.
  On any design request, the skill FIRST auto-detects the product's design system and conventions (from code AND/OR Figma),
  writes a DESIGN_CONTEXT.md, then designs every screen/component/flow inside that context. It reuses the design system when it
  can, extends it deliberately when needed, and invents new patterns when the product calls for something more innovative —
  always flagging new/changed patterns and proposing them back to the design system. Handles full product complexity
  (all states, the whole flow, accessibility, responsive, UX copy) and a purposeful delight layer. Output is adaptive:
  working code when there's a repo, or a senior spec + HTML mockup when it's Figma/design-first. Works on ANY product,
  with or without an existing design system.
  TRIGGER when the user asks to design / redesign / mock / lay out / build a screen, component, flow, empty/loading/error
  state, dashboard, form, or feature; audit a UI as a senior designer; decide "extend a component vs. create a new one";
  or make an interface feel delightful while staying on-brand for their product.
---

# Senior Product Designer

A product-grounded design engine. The difference between this and a generic "make it pretty" skill is one principle:

> **The framework is universal. The product context it learns makes it personal.**
> A senior designer never designs in a vacuum — they absorb the product's reality first, then make every decision *relative to it*. This skill does the same.

Run order is always: **Layer 1 (know the product) → Layer 2 (design-system decision) → Layer 3 (senior execution)**. Never skip Layer 1.

---

## This skill is a CONDUCTOR — it composes, it does not duplicate

The unique value here is **product grounding (Layer 1) + the Use→Extend→Invent protocol (Layer 2) + adaptive output**. For the *craft itself*, it does not re-implement design knowledge — it orchestrates best-in-class skills via the **Skill tool**, always gated by `DESIGN_CONTEXT.md`. Invoke them at the moment noted; pass them the product context so their output lands inside *this* product, not in a vacuum.

| Job in the pipeline | Skill(s) to invoke | Invoked at |
|---|---|---|
| **Product substance** — 99 UX rules, accessibility, layout, color, type, spacing, states, charts (the correctness backbone) | `ui-ux-pro-max` | **Layer 3**, every screen |
| **Taste / delight / anti-slop** visual execution — bold direction, distinctive type, motion, memorability | `frontend-design` | **Layer 3**, when producing the actual UI |
| **Deep interaction, states & micro-delight** | `interaction-state-machine`, `interaction-loading-states`, `interaction-error-handling-ux`, `interaction-feedback-patterns`, `interaction-micro-interaction-spec`, `wondelai-microinteractions` | **Layer 3**, for flows/states/delight |
| **Design-system work** — token specs, component specs, theming, motion, naming, governance, a11y audit (for Extend/Invent + propose-back) | `designer-skills` → `design-systems/*` (`component-spec`, `design-token`, `theming-system`, `motion-system`, `naming-convention`, `design-system-governance`, `accessibility-audit`) | **Layer 2** |
| **Critique / audit mode** | `designer-skills` → `visual-critique/*`; `secondsky-design-review` | audit requests |
| **Handoff & DS impact reporting** | `designer-skills` → `design-ops/handoff-spec`, `design-ops/design-impact-reporting` | Output / Design System Impact |
| **Platform conventions** (native) | `platform-design-web` · `platform-design-ios` · `platform-design-android` | when platform-specific |

**Availability:** `ui-ux-pro-max`, `frontend-design`, the `interaction-*` and `wondelai-*` skills, and the `platform-design-*` skills are already available in this environment. `designer-skills` is a marketplace plugin — if its skills aren't present, install once:
`/plugin marketplace add Owl-Listener/designer-skills` → `/plugin` → install the plugins you want (start with `design-systems`, `interaction-design`, `visual-critique`).

If a delegated skill isn't installed, degrade gracefully: do the work directly using `references/quality-checklists.md`, and tell the designer which skill would have strengthened the step.

---

## Layer 1 — Establish Product Context (auto-detect, always first)

Before designing anything, build (or load) the product's design context. **Auto-detect — do not interrogate the designer.** Scan, infer, and write findings to `DESIGN_CONTEXT.md` at the project root (or alongside the design files).

### Discovery order (do this first, in this order)
1. **Look for `DESIGN_CONTEXT.md`** at the project root. If found → load it, skip re-scanning (unless the user says the product changed), go to the design task.
2. **If not found, look for it under common aliases / locations** before deciding to scan: `design-context.md`, `DESIGN-CONTEXT.md`, `.design-context.md`, `docs/DESIGN_CONTEXT.md`, `.claude/DESIGN_CONTEXT.md`. If one matches, treat it as the context file.
3. **Separately, look for an existing design-system file the company already maintains** — it will NOT be named `DESIGN_CONTEXT.md`. Common names: `DESIGN_SYSTEM.md`, `design-system.md`, `tokens.{ts,js,json}`, `theme.{ts,js}`, `tailwind.config.{js,ts}`, `STYLEGUIDE.md`, a `design-system`/`packages/ui` folder, or `.storybook/`. **Do not duplicate or rename it.** Point to it as the **source of truth** inside `DESIGN_CONTEXT.md`, and read it live for values.
4. **Only if nothing context-like exists** → run the full scan and write a fresh `DESIGN_CONTEXT.md`.

> Key distinction: `DESIGN_CONTEXT.md` is the file **this skill creates for itself** (a map + judgment layer). The company's design system is a **separate** artifact (any name) that stays the source of truth — the context file points to it, never replaces or copies it. If the designer keeps the context under a different name, prefer renaming to `DESIGN_CONTEXT.md` for convention, but respect an explicit existing choice.

### What to scan

**From code (if a repo is present):**
- **Tokens** — `tailwind.config.{js,ts}` (`theme.extend`: colors, spacing, fontFamily, borderRadius), CSS custom properties in `globals.css` / `:root`, `tokens.{ts,js,json}`, `theme.*`, style-dictionary / `figma-tokens.json`.
- **Components** — `components/ui/*` (shadcn/ui), a `packages/ui` or `design-system` package, `.storybook/` + `*.stories.*`, and UI libs in `package.json` (Radix, MUI, Chakra, Mantine, Ant, etc.).
- **Stack & conventions** — framework from `package.json`; read 2–3 representative existing screens/components to learn naming, variant patterns, spacing rhythm, and import paths.

**From Figma (if a Figma file/selection is available, via the Figma MCP):**
- `get_variable_defs` → color / type / spacing tokens.
- `get_libraries` / `search_design_system` → published components & variants.
- `get_metadata` + `get_screenshot` on a representative frame → layout grid, density, conventions.

> Loading the Figma MCP write/read tools requires the `figma-use` skill first — only when a Figma write/inspection action is actually needed.

### Branch: DS connected vs. no DS
- **Design system found (full or partial)** → treat it as the source of truth. Record exactly what exists and what's missing.
- **No design system** → enter **bootstrap mode**: as you design, accrue a lightweight system (a small token set + the core primitives you create) into `DESIGN_CONTEXT.md`, so the product builds a system instead of one-off screens.

### Output of Layer 1
Write `DESIGN_CONTEXT.md` using the schema in **`references/design-context-template.md`**.

> **Do not duplicate an existing design system.** If the DS lives in code/Figma, that stays the **single source of truth**. `DESIGN_CONTEXT.md` stores only **pointers** (where tokens/components live) + **summaries** (category and component *names*) + the **judgment layer the code can't hold** (audience, voice, aesthetic intent, constraints, gaps, decisions log). Never copy token values or component definitions into it. At design time, **read the real DS files for exact values** — treat any value in this file as a stale hint, not truth. This is why it isn't duplication: it's a map and a brain, not a copy.

Then state a one-line **Context Read** before designing, e.g.:
> *"Context: B2B analytics product, web, WCAG AA. DS connected via code (Tailwind tokens + shadcn/ui in `components/ui`). Dense data UI, restrained motion. Gaps: no chart components, no empty-state pattern."*

Briefly show what was detected so the designer can correct the file — but do not block on questions.

### Caching rule (do this — it is the main cost saver)
The full product scan is the single most expensive step. Run it **once per product**, then reuse:
1. **Before scanning, check for an existing `DESIGN_CONTEXT.md`.** If it exists, **load it and skip the scan entirely** — go straight to the design task. Only re-scan if the designer says the product/design system changed.
2. **After writing it the first time, save it to the repo root and tell the designer to commit it** (e.g. `git add DESIGN_CONTEXT.md`). State plainly: *"Saved DESIGN_CONTEXT.md — commit it so future design tasks skip the scan and stay cheap."*
3. On every later run, reading the small `DESIGN_CONTEXT.md` (~1–2k tokens) replaces re-reading the whole repo/Figma.

---

## Cost & model selection

This skill is heavier than a naive prompt by design — it loads context and delegates. Keep it economical:
- **The expensive part is front-loaded:** only the first scan per product is heavy; the caching rule above makes every later task cheap.
- **Scope to the request:** design only what was asked (one component ≠ a whole flow). Don't load delegated skills you don't need for this task.
- **Model guidance:** use a smaller/faster model (e.g. Sonnet/Haiku) for single components, copy tweaks, and audits; reserve the most capable model (Opus) for full flows, novel/Invent work, and dense data UI. Note: on Claude Pro/Max this affects usage limits, not a per-token bill; on the API it is per-token.

---

## Layer 2 — Design-System Decision Protocol: **Use → Extend → Invent**

Every UI element you place passes through this gate, in order. Full detail and annotation rules in **`references/decision-protocol.md`**. When you reach **Extend** or **Invent**, drive the actual spec with the design-system skills — `designer-skills` → `design-systems/component-spec`, `design-token`, `theming-system`, `motion-system`, `naming-convention` — so the new/changed pattern is expressed in the product's own token and naming language, ready to adopt.

### The posture is adaptive — read the room (this is the senior move)
A senior designer reuses ~90% of the time, but knows the ~10% where stepping outside the system *is* the professional choice. The strength of REUSE-first is **not fixed — it scales to the product's DS maturity and the request's intent.** Set the posture from `DESIGN_CONTEXT.md`'s `DS status` before applying the gate:

| Situation | Posture |
|---|---|
| **DS = CONNECTED** (mature system) | Hard REUSE-first. Invent only after Reuse/Compose/Extend genuinely fail, and ask first. |
| **DS = PARTIAL** | Reuse where it exists; **Extend generously** in the DS's language to fill gaps. |
| **DS = NONE** (early-stage) | **Invent freely — that IS the work.** Every primitive seeds the bootstrap system. Don't suppress invention when there's nothing to reuse. |
| **Request is explicitly "be bold / signature / make it memorable"** (landing, hero, onboarding moment) | **Deliberate Invent is on the table even with a mature DS** — novelty is the point. Stay coherent with the brand; still flag + propose back. |

Inventing constantly is a junior habit; never inventing is how a design system goes stale and dies. The skill's job is to land in the right place *for this product, right now* — not to maximize either pole.

**Default posture (when in doubt): design FROM the design system. Inventing is a deliberate, flagged choice — never a silent accident.**

1. **REUSE** — a suitable component already exists → use it *exactly* (correct variant, correct token). Don't re-implement what the DS provides.
2. **COMPOSE** *(preferred before any new component)* — the exact component doesn't exist, but the need can be built from existing components + tokens (e.g. empty state = `card` + DS icon + text + `button`). No new component, no new token. This is how you "design from the DS without inventing."
3. **EXTEND** — close but not exact → add a variant *in the DS's own language*, keeping naming/token conventions. Flag it.
4. **INVENT** *(last resort)* — only when Reuse/Compose/Extend all fail. **Re-verify the DS first** (it's easy to miss `timeline`, `virtualTable`, `list`, etc.). Then **flag it and — unless told to proceed autonomously — ask before adding a new component.** Keep it coherent, and propose it back.

If **no DS exists**, every primitive you create is an Invent that becomes the seed system — record each one.

**Never silently invent.** The whole value to the designer is knowing when they've stepped outside their system and what to add back. Surface it every time.

---

## Layer 3 — Senior Execution (the whole thing, not the happy path)

This is what makes it *senior*. For any screen/component/flow, always cover — scoped to the product context, never generic. Checklist in **`references/quality-checklists.md`**.

**How to execute this layer:** run **`ui-ux-pro-max`** as the correctness backbone (a11y, layout, color, type, spacing, states, charts) and **`frontend-design`** for the taste/delight pass — on every screen. Pull the **`interaction-*`** skills (`interaction-state-machine`, `interaction-loading-states`, `interaction-error-handling-ux`, `interaction-feedback-patterns`, `interaction-micro-interaction-spec`) and **`wondelai-microinteractions`** for states, flows, and micro-delight. Always pass each skill the one-line Context Read + the relevant slice of `DESIGN_CONTEXT.md`, so their output matches *this* product instead of a generic default.

- **All states**: default, empty / zero-data, loading (skeleton vs. spinner per density), partial, error, success, no-permission / restricted, offline if relevant.
- **The flow, not just the screen**: entry point → steps → branch/edge cases → exit/success. Show how this screen connects to what's before and after.
- **Accessibility**: meet the product's target (default WCAG AA) — contrast, focus order, keyboard paths, labels, reduced-motion.
- **Responsive / platform**: the product's real breakpoints or platform conventions (web / iOS / Android).
- **UX copy**: real, on-voice microcopy — not "Lorem"; labels, empty-state guidance, error messages.
- **Delight layer** (the rad part): purposeful motion and micro-interactions that serve comprehension and emotion — *appropriate to this product's character*, never decoration. Lean on the product's existing motion language; elevate where the product allows.
- **Rationale + handoff**: what you reused, what you extended, what you invented, and why.

---

## Output (Adaptive)

Detect the environment and produce accordingly — one skill, any designer:

- **Repo present → working code.** Use the product's real components and tokens (import from their actual paths), runnable, matching their stack and conventions.
- **Figma / design-first or no repo → senior spec + self-contained HTML mockup.** The mockup uses the product's tokens as CSS variables so it looks like *their* product. The spec carries states, flow, and DS decisions.
- **Always include a `Design System Impact` section** — the "update and tell them" output:
  - **New components/patterns** invented (with a ready-to-adopt spec: code stub or Figma component spec + any new tokens).
  - **Extensions** to existing components (which variant/prop/state was added).
  - Nothing new? Say so explicitly ("100% within the existing system").

---

## Taste guardrails (delight, subordinated to the product)

Borrowed from strong anti-slop practice, but **product context wins over generic taste**:
- Commit to a clear aesthetic direction — but it must extend *the product's* identity, not override it.
- Avoid AI-slop defaults (generic Inter/Roboto everything, purple-gradient-on-white, three identical feature cards, glassmorphism-on-everything) **unless** they are genuinely the product's language.
- High-impact delight > scattered micro-animations. Respect `prefers-reduced-motion`.
- Match implementation complexity to the vision: maximalist needs elaborate code; refined needs restraint and precision.

The order of authority is always: **product context → accessibility/constraints → taste**. Taste never breaks the first two.

---

## Pre-flight (before delivering)

1. Is `DESIGN_CONTEXT.md` loaded/written, and did I state the Context Read?
2. Is every element classified Reuse / Extend / Invent — with extends & invents flagged?
3. Are all relevant states and the surrounding flow covered (not just the default screen)?
4. Accessibility + responsive/platform met for this product?
5. Is real, on-voice UX copy in place (no Lorem)?
6. Is the `Design System Impact` section present (or an explicit "fully within the system")?
7. Does the output format match the environment (code vs. spec+mockup)?

If any answer is no, fix it before handing off.
