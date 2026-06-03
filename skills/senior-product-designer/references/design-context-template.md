# DESIGN_CONTEXT.md — schema

The artifact that makes the universal framework personal to one product. Auto-detected in Layer 1, written to the project root, loaded on every later run. Edit freely — the designer owns it.

> **NOT a copy of the design system.** When a DS already lives in code/Figma, that code/Figma is the **single source of truth** for token values and component APIs. This file is a thin **map + judgment layer**, not a duplicate:
> - Store **pointers** (where things live) and **summaries** (category + names), never full token values or component definitions.
> - At design time, the skill **reads the real files** for exact values — it never trusts copied numbers here.
> - This avoids drift (two sources falling out of sync) and keeps the file cheap to load.
> - Its real value is what code can't express: audience, voice, aesthetic intent, constraints, gaps, and the decisions log.

```markdown
# DESIGN_CONTEXT — <Product Name>
_Last detected: <date> · Source of truth: <repo path and/or Figma file>_

## Product  (things the code does NOT contain)
- What it is / domain:
- Primary users & their context:
- Platform(s): web / iOS / Android / desktop
- Brand voice & personality (3–5 adjectives):

## Design System — status: CONNECTED / PARTIAL / NONE
- Source of truth (read live for values): <code path e.g. components/ui + tailwind.config.ts> | <Figma file/library>
- Tokens — POINTERS + category names only (do NOT copy values; read them live):
  - Color roles available (just the names, e.g. bg/surface/text/primary/accent/semantic) → defined in <file>:
  - Type scale: <where defined> — families/sizes live in <file>
  - Spacing scale / grid: <where defined>
  - Radius / elevation / shadow:
  - Motion (durations, easing):
- Core components + variants (name → variants/states available):
- Naming & file conventions:
- Icon set:

## Patterns & Conventions
- Layout grid & density (airy ↔ data-dense):
- Existing motion language:
- Established empty/loading/error patterns (if any):

## Constraints (override taste)
- Accessibility target: WCAG AA (default) / AAA / other
- Performance / device constraints:
- Regulatory / trust requirements:

## Aesthetic Direction
- The product's current "taste" (so new work matches, then elevates):
- Where boldness is welcome vs. where restraint is required:

## Gaps & Opportunities  (feeds Layer 2 → Invent → propose-back)
- Missing components / patterns:
- Inconsistencies worth fixing:

## Decisions Log  (running)
- <date> — EXTEND <component>: added <variant> for <reason>
- <date> — INVENT <pattern>: created <name>; proposed back to DS as <spec ref>
```

## Detection cheatsheet
- **Code:** `tailwind.config.*` (`theme.extend`), `:root` CSS vars / `globals.css`, `tokens.*`, `theme.*`, `components/ui/*` (shadcn/ui), `packages/ui`, `.storybook/`, UI libs in `package.json` (Radix, MUI, Chakra, Mantine…), 2–3 existing screens for conventions.
- **Figma (via Figma MCP):** `get_variable_defs` (tokens), `get_libraries` / `search_design_system` (components), `get_metadata` + `get_screenshot` on a representative frame (grid/density).
- **NONE found → bootstrap mode:** start the token set + primitives here and grow the Decisions Log as you design.
