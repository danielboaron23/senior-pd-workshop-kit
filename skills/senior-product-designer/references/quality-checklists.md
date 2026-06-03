# Senior execution — quality checklists

Layer 3 coverage, scoped to the product context. Each block names the skill that does the heavy lifting (delegate to it; fall back to this list if it isn't installed).

## States (never just the happy path)
→ `interaction-state-machine`, `interaction-loading-states`, `interaction-error-handling-ux`
- [ ] Default / populated
- [ ] Empty / zero-data (with guidance, not a blank box)
- [ ] Loading (skeleton for dense UI, spinner for atomic actions; reserve space — no layout shift)
- [ ] Partial / streaming
- [ ] Error (inline, near the cause, recoverable; real message)
- [ ] Success / confirmation
- [ ] No-permission / restricted
- [ ] Offline / stale (if relevant)

## Flow (the screen in context)
→ `designer-skills` → `prototyping-testing/user-flow-diagram`, `interaction-design` commands
- [ ] Entry point(s) — how the user arrives
- [ ] Steps / progression
- [ ] Branches & edge cases
- [ ] Exit / success / abandon paths
- [ ] How this screen connects to the one before and after

## Correctness backbone
→ `ui-ux-pro-max` (priority order: accessibility → touch → performance → layout → type/color → animation)
- [ ] Contrast ≥ 4.5:1 (text); visible focus states; keyboard path; labels/aria; reduced-motion
- [ ] Touch targets ≥ 44px; primary actions on tap/click
- [ ] No content jumping; images optimized
- [ ] Responsive at the product's real breakpoints / platform conventions (`platform-design-*`)
- [ ] Type: line-height 1.5–1.75, measure 65–75ch; pairing matches DS

## UX copy
→ `designer-skills` → `designer-toolkit` (UX writing); `viber-ux-copy` for audits
- [ ] Real, on-voice microcopy — no Lorem
- [ ] Labels, empty-state guidance, error messages, button verbs

## Delight (the rad layer — purposeful, on-brand)
→ `frontend-design`, `interaction-micro-interaction-spec`, `wondelai-microinteractions`
- [ ] One high-impact moment (orchestrated load / signature interaction) over scattered animation
- [ ] Motion uses the product's easing/duration language
- [ ] Respects `prefers-reduced-motion`
- [ ] Delight serves comprehension/emotion — never decoration that fights the task

## Output & handoff
→ `designer-skills` → `design-ops/handoff-spec`, `design-ops/design-impact-reporting`
- [ ] Output matches environment (code w/ real imports, OR spec + self-contained HTML mockup using product tokens)
- [ ] `Design System Impact` block present (Reused / Extended / Invented, or "fully within the system")
- [ ] Rationale: what & why (`designer-toolkit/write-rationale`)

## Audit mode (when reviewing existing UI, not creating)
→ `designer-skills` → `visual-critique/*`; `secondsky-design-review`
- [ ] Hierarchy, composition, typography, brand-consistency vs `DESIGN_CONTEXT.md`
- [ ] Flag slop/off-system drift; propose fixes through Use→Extend→Invent
