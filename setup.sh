#!/usr/bin/env bash
#
# Bootstrap dotfiles — creates symlinks via GNU Stow.
# Run from the dotfiles directory.
#
# Usage:
#   cd ~/dotfiles && bash setup.sh

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

HOME_PKGS=(git tmux zsh wezterm ssh)
CONFIG_PKGS=(aerospace bat btop fd ghostty htop neofetch nix nvim opencode sketchybar starship thefuck yazi zellij)

echo "→ Stowing home-rooted packages..."
for pkg in "${HOME_PKGS[@]}"; do
  stow --target="$HOME" "$pkg"
done

echo "→ Stowing config-rooted packages..."
for pkg in "${CONFIG_PKGS[@]}"; do
  mkdir -p "$HOME/.config/$pkg"
  stow --target="$HOME/.config/$pkg" "$pkg"
done

echo "✓ Done"
