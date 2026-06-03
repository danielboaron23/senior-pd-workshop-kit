#!/usr/bin/env bash
# =====================================================================
# Senior Product Designer — Workshop Setup
# One command installs every dependency the skill needs.
# Run from inside this folder:   bash setup.sh
# =====================================================================
set -e

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$HOME/.claude/skills"

say()  { printf "${GREEN}==>${NC} %s\n" "$1"; }
warn() { printf "${YELLOW}!! ${NC} %s\n" "$1"; }
fail() { printf "${RED}xx ${NC} %s\n" "$1"; }

echo ""
say "Senior Product Designer — workshop setup starting"
echo ""

# ---------- 1. Prerequisites check ----------
say "Step 1/4 — checking prerequisites (Node, Git, Claude Code)"
command -v node >/dev/null 2>&1 || { fail "Node.js not found. Install Node 18+ from https://nodejs.org and re-run."; exit 1; }
command -v git  >/dev/null 2>&1 || { fail "Git not found. Install Git from https://git-scm.com and re-run."; exit 1; }
if ! command -v claude >/dev/null 2>&1; then
  warn "Claude Code CLI not found. Installing it globally via npm..."
  npm install -g @anthropic-ai/claude-code
fi
say "Prerequisites OK (node $(node -v), $(git --version))"
echo ""

# ---------- 2. Official plugin: frontend-design ----------
say "Step 2/4 — installing frontend-design (official Anthropic marketplace)"
claude plugin marketplace add anthropics/claude-plugins-official 2>/dev/null || warn "official marketplace already added"
claude plugin install frontend-design@claude-plugins-official 2>/dev/null || warn "frontend-design already installed"
echo ""

# ---------- 3. designer-skills marketplace (Owl-Listener) ----------
say "Step 3/4 — installing designer-skills plugins (design-systems, interaction-design, visual-critique)"
claude plugin marketplace add Owl-Listener/designer-skills 2>/dev/null || warn "designer-skills marketplace already added"
for p in design-systems interaction-design visual-critique; do
  claude plugin install "$p@designer-skills" 2>/dev/null || warn "$p already installed"
done
echo ""

# ---------- 4. Bundled skills -> ~/.claude/skills ----------
say "Step 4/4 — copying bundled skills into $SKILLS_DIR"
mkdir -p "$SKILLS_DIR"
for s in ui-ux-pro-max senior-product-designer; do
  if [ -d "$KIT_DIR/skills/$s" ]; then
    rm -rf "$SKILLS_DIR/$s"
    cp -R "$KIT_DIR/skills/$s" "$SKILLS_DIR/$s"
    say "  installed skill: $s"
  fi
done
echo ""

# ---------- Done ----------
printf "${GREEN}=====================================================${NC}\n"
say "Setup complete."
echo ""
echo "Installed:"
echo "  • frontend-design            (taste / delight)"
echo "  • ui-ux-pro-max              (UX correctness backbone)"
echo "  • design-systems             (tokens, component specs)"
echo "  • interaction-design         (states, flows, micro-delight)"
echo "  • visual-critique            (audit mode)"
echo "  • senior-product-designer    (the conductor skill)"
echo ""
warn "Restart your Claude Code session so the new skills/plugins load."
echo "Then, in any product folder, just ask: \"design the <screen> as a senior product designer\""
printf "${GREEN}=====================================================${NC}\n"
