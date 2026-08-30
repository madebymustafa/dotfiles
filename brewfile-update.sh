#!/usr/bin/env bash
#
# Regenerate the full-mirror Brewfile: every formula + cask installed on this
# machine, INCLUDING auto-installed dependencies, so a fresh `brew bundle`
# reproduces the exact package count fastfetch reports (e.g. 168 brews / 12
# casks) - not just the top-level packages `brew bundle dump` captures.
#
# Usage:
#   cd ~/dotfiles && bash brewfile-update.sh
#   then commit the Brewfile change.

set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

echo "→ Dumping top-level packages (leaves, casks, taps)..."
brew bundle dump --force --file=./Brewfile >/dev/null

echo "→ Appending dependency formulae not captured by dump..."
comm -23 \
  <(brew list --formula --full-name | sort) \
  <(grep '^brew ' Brewfile | sed 's/^brew "\([^"]*\)".*$/\1/' | sort) \
  | while read -r formula; do
      printf 'brew "%s"\n' "$formula"
    done >> Brewfile

printf '✓ Brewfile now mirrors: %s formulae + %s casks\n' \
  "$(grep -c '^brew ' Brewfile)" "$(grep -c '^cask ' Brewfile)"

# Note: a plain `brew bundle dump --force` later will drop the dependency
# lines again (dump only writes top-level packages). Rerun THIS script to
# keep the full mirror, or run `bash brewfile-update.sh` in a cleanup step.