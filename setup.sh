#!/usr/bin/env bash
#
# Bootstrap dotfiles — creates symlinks via GNU Stow.
# Run from the dotfiles directory.
#
# Usage:
#   cd ~/dotfiles && bash setup.sh

set -euo pipefail

# Ensure we're in the dotfiles directory
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "→ Stowing dotfiles..."
stow .
echo "✓ Done"
