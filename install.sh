#!/usr/bin/env bash
#
# One-command new-machine bootstrap.
# Installs all tools and symlinks dotfiles: everything you need to get started.
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
  fastfetch starship zellij yazi television atuin zoxide eza gh \
  bjarneo/cliamp/cliamp ffmpeg yt-dlp

echo "→ Installing casks and fonts..."
brew tap nikitabobko/tap
brew install --cask wezterm font-jetbrains-mono-nerd-font aerospace raycast

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
# fast-syntax-highlighting is intentionally NOT installed: it conflicts with
# zsh-syntax-highlighting (both re-wrap the same widgets and produce
# duplicate-highlighter errors). Pick one; the .zshrc uses zsh-syntax-highlighting.

# ─── Tmux plugin manager ──────────────────────────────────────────────────────

echo "→ Setting up tmux plugin manager..."
clone_or_pull https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

# ─── gh-dash ──────────────────────────────────────────────────────────────────

echo "→ Installing gh-dash..."
gh extension install dlvhdr/gh-dash 2>/dev/null || gh extension upgrade gh-dash

# ─── fetch ─────────────────────────────────────────────────────────────────────

echo "→ Installing fetch (3D rotating-logo fetch)..."
if [ ! -d "$HOME/src/fetch" ]; then
  git clone --depth=1 https://github.com/madebymustafa/fetch.git "$HOME/src/fetch"
else
  git -C "$HOME/src/fetch" remote set-url origin https://github.com/madebymustafa/fetch.git
  git -C "$HOME/src/fetch" fetch --depth=1 origin main
  git -C "$HOME/src/fetch" reset --hard --quiet origin/main
fi
make -C "$HOME/src/fetch" >/dev/null
mkdir -p "$HOME/.local/bin"
install -m 755 "$HOME/src/fetch/fetch" "$HOME/.local/bin/fetch"

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

# ─── Apps ─────────────────────────────────────────────────────────────────────

echo "→ Launching AeroSpace..."
open -a AeroSpace 2>/dev/null || true

# ─── Done ─────────────────────────────────────────────────────────────────────

echo ""
echo "✓ Machine configured. Finish by hand:"
echo "  1. System Settings → Privacy & Security → Accessibility:"
echo "     enable AeroSpace (appears in the list after you launch it once)"
echo "  2. Raycast → Settings → Extensions → Script Commands → + →"
echo "     Add Script Directory: ~/dotfiles/raycast/scripts"
echo "     Then open 'Toggle AeroSpace' and record Hyper+Esc as its hotkey"
echo "  3. Restore secrets to ~/.env (sourced by zsh, never committed)"
echo "     e.g. export CLIAMP_SPOTIFY_ID=<your cliamp Spotify client id>"
echo "     and any API keys. See cliamp/README.md."
echo "  4. SSH: restore or generate a key (ssh-keygen -t ed25519) and add it"
echo "     to GitHub"
echo "  5. AeroSpace is not auto-started. When you want tiling:"
echo "     open -a AeroSpace"
