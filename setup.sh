#!/usr/bin/env bash
#
# Bootstrap dotfiles — installs tools & creates symlinks via GNU Stow.
# Run from the dotfiles directory.
#
# Usage:
#   cd ~/dotfiles && bash setup.sh

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
  neofetch starship zellij yazi television atuin zoxide

echo "→ Installing casks and fonts..."
brew install --cask wezterm ghostty font-jetbrains-mono-nerd-font

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

# ─── Symlink dotfiles ─────────────────────────────────────────────────────────

HOME_PKGS=(git tmux zsh wezterm)
CONFIG_PKGS=(aerospace atuin bat btop fd ghostty htop neofetch nix nvim opencode sketchybar starship television thefuck yazi zellij)

echo "→ Stowing home-rooted packages..."
for pkg in "${HOME_PKGS[@]}"; do
  stow --target="$HOME" "$pkg"
done

echo "→ Stowing config-rooted packages..."
for pkg in "${CONFIG_PKGS[@]}"; do
  mkdir -p "$HOME/.config/$pkg"
  stow --target="$HOME/.config/$pkg" "$pkg"
done

echo "→ Linking .hushlogin..."
ln -sf "$DIR/.hushlogin" "$HOME/.hushlogin"

echo "→ Stowing ssh..."
mkdir -p "$HOME/.ssh"
stow --target="$HOME/.ssh" ssh

echo ""
echo "✓ New machine ready!"
