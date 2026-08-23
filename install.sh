#!/usr/bin/env bash
#
# One-command new-machine bootstrap.
# Installs all tools and symlinks dotfiles — everything you need to get started.
#
# Usage:
#   cd ~/dotfiles && bash install.sh

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

# ─── Oh My Zsh ────────────────────────────────────────────────────────────────

echo "→ Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# ─── Homebrew packages ────────────────────────────────────────────────────────

echo "→ Installing brew packages..."
brew install \
  zsh tmux neovim git bat fd ripgrep fzf thefuck htop btop \
  neofetch starship zellij yazi television atuin zoxide skhd eza gh

echo "→ Installing casks and fonts..."
brew tap nikitabobko/tap
brew tap koekeishiya/formulae
brew install --cask wezterm ghostty font-jetbrains-mono-nerd-font aerospace

# ─── opencode ─────────────────────────────────────────────────────────────────

echo "→ Installing opencode..."
curl -fsSL https://opencode.ai/install.sh | sh

# ─── Zsh plugins ──────────────────────────────────────────────────────────────

echo "→ Setting up zsh plugins..."
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

clone_or_pull() {
  local repo="$1" dir="$2"
  if [ -d "$dir" ]; then
    git -C "$dir" pull --ff-only
  else
    git clone --depth=1 "$repo" "$dir"
  fi
}

clone_or_pull https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
clone_or_pull https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone_or_pull https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
clone_or_pull https://github.com/zdharma-continuum/fast-syntax-highlighting "$ZSH_CUSTOM/plugins/fast-syntax-highlighting"

# ─── Tmux plugin manager ──────────────────────────────────────────────────────

echo "→ Setting up tmux plugin manager..."
clone_or_pull https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

# ─── gh-dash ──────────────────────────────────────────────────────────────────

echo "→ Installing gh-dash..."
gh extension install dlvhdr/gh-dash 2>/dev/null || gh extension upgrade gh-dash

# ─── Symlink dotfiles via setup.sh ─────────────────────────────────────────────

echo "→ Running setup.sh to symlink dotfiles..."
bash setup.sh

# ─── Tmux plugins ─────────────────────────────────────────────────────────────

echo "→ Installing tmux plugins..."
tmux start-server 2>/dev/null || true
tmux source-file "$HOME/.tmux.conf" 2>/dev/null || true
"$HOME/.tmux/plugins/tpm/bin/install_plugins.sh" >/dev/null 2>&1 || true
tmux kill-server 2>/dev/null || true

# ─── Neovim plugins ───────────────────────────────────────────────────────────

echo "→ Syncing neovim plugins (first run downloads a lot)..."
nvim --headless "+Lazy! sync" +qa >/dev/null 2>&1 || true

# ─── Services & apps ──────────────────────────────────────────────────────────

echo "→ Starting skhd service (AeroSpace Hyper+Esc pause toggle)..."
/opt/homebrew/bin/skhd --start-service

echo "→ Launching AeroSpace..."
open -a AeroSpace 2>/dev/null || true

# ─── Done ─────────────────────────────────────────────────────────────────────

echo ""
echo "✓ Machine configured. Finish by hand:"
echo "  1. System Settings → Privacy & Security → Accessibility:"
echo "     enable AeroSpace and skhd"
echo "  2. Same pane → Input Monitoring: enable skhd"
echo "  3. Restore secrets to ~/.env (sourced by zsh, never committed)"
echo "  4. SSH: restore or generate a key (ssh-keygen -t ed25519) and add it"
echo "     to GitHub"
