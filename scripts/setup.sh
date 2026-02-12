#!/bin/bash
# moon-devkit environment setup
# Usage: bash scripts/setup.sh
#   or:  curl -sL https://raw.githubusercontent.com/hj0302/moon-devkit/main/scripts/setup.sh | bash

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${GREEN}[✓]${NC} $1"; }
warn()  { echo -e "${YELLOW}[!]${NC} $1"; }
error() { echo -e "${RED}[✗]${NC} $1"; }
step()  { echo -e "\n${YELLOW}▶${NC} $1"; }

# Check claude CLI
if ! command -v claude &> /dev/null; then
    error "claude CLI not found. Install: npm install -g @anthropic-ai/claude-code"
    exit 1
fi

step "Step 1/3: Registering marketplaces..."

marketplaces=(
    "anthropics/claude-plugins-official"
    "Yeachan-Heo/oh-my-claudecode"
    "wshobson/agents"
    "team-attention/plugins-for-claude-natives"
    "hj0302/moon-devkit"
)

for mp in "${marketplaces[@]}"; do
    name=$(basename "$mp")
    if claude plugin marketplace list 2>/dev/null | grep -q "$name"; then
        info "Marketplace already registered: $mp"
    else
        claude plugin marketplace add "$mp" 2>/dev/null && info "Added marketplace: $mp" || warn "Failed: $mp"
    fi
done

step "Step 2/3: Installing plugins (order matters)..."

# Priority order: core → devkit → official → workflows → community
plugins=(
    "oh-my-claudecode@omc"
    "moon-devkit@moon-devkit"
    "Notion@claude-plugins-official"
    "coderabbit@claude-plugins-official"
    "backend-development@claude-code-workflows"
    "cloud-infrastructure@claude-code-workflows"
    "code-review-ai@claude-code-workflows"
    "security-scanning@claude-code-workflows"
    "session-wrap@team-attention-plugins"
)

for plugin in "${plugins[@]}"; do
    if claude plugin list 2>/dev/null | grep -q "${plugin%%@*}"; then
        info "Already installed: $plugin"
    else
        claude plugin install "$plugin" 2>/dev/null && info "Installed: $plugin" || warn "Failed: $plugin"
    fi
done

step "Step 3/3: Verification..."

echo ""
claude plugin list 2>/dev/null
echo ""

total=$(claude plugin list 2>/dev/null | grep -c "❯" || true)
enabled=$(claude plugin list 2>/dev/null | grep -c "✔ enabled" || true)

echo ""
info "Setup complete! $enabled/$total plugins enabled."
echo ""
echo "  Next: restart Claude Code session to activate all plugins."
echo ""
