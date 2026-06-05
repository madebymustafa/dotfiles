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

HOME_PKGS=(git tmux zsh wezterm)
CONFIG_PKGS=(aerospace atuin bat btop fd gh-dash ghostty htop neofetch nix nvim opencode sketchybar starship television thefuck yazi zellij)

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

echo "✓ Done"
