# Dotfiles Project Context

## Overview
macOS dotfiles managed with GNU Stow. User is `madebymustafa` (GitHub).

## Stow Strategy
- **setup.sh** uses per-package targets (no global `--target`).
- Home-rooted packages (git, tmux, zsh, wezterm, ssh) → `$HOME`.
- Config packages (aerospace, bat, btop, fd, ghostty, htop, neofetch, nix, nvim, opencode, sketchybar, starship, thefuck, yazi, zellij) → `$HOME/.config/<pkg>`.

## Shell Setup
- Interactive shell: `zsh` with Powerlevel10k theme.
- `setup.sh` uses `bash` (portable on macOS/Linux).
- Plugins managed via zsh-completions, zsh-autosuggestions, zsh-syntax-highlighting, fast-syntax-highlighting (git cloned in zsh/.zsh/).

## Packages
- **tmux**: Config at `~/.tmux.conf`, plugins as git submodules in `tmux/.tmux/plugins/` (tpm, tmux-yank, tmux-resurrect, tmux-continuum).
- **nvim**: Uses lazy.nvim, based on omerxx's NvChad-styled config.
- **sketchybar**: Not installed yet — only config files stowed. Needs `brew install sketchybar` + compile C helper in `~/.config/sketchybar/helper/`.
- **aerospace**: Installed via `brew install nikitabobko/tap/aerospace`.
- **ghostty**: Installed via `brew install --cask ghostty`.
- **zellij**: Installed via `brew install zellij`.
- **nix**: Installed via Determinate Nix Installer. Binary at `/nix/var/nix/profiles/default/bin/nix`. Used for package management only (nix-darwin not active).
- **starship**: Cross-shell prompt, configured to show minimal info.
- **yazi**: Terminal file manager with gruvbox-dark theme, custom keybindings.

## Key Decisions
- Flat package dirs (like omerxx/dotfiles), not nested `.config/app/` structure.
- No global stow target — each package's target is explicit in setup.sh.
- .stowrc kept minimal with general note (no references to omerxx).
- Public repo — avoid comments suggesting configs were copied from elsewhere.
- tmux plugin paths use `~/.tmux/` (not `$XDG_CONFIG_HOME`).

## Installation Steps (for new machine)
1. Install GNU Stow: `brew install stow`
2. Clone: `git clone git@github.com:madebymustafa/dotfiles.git ~/dotfiles`
3. Run: `cd ~/dotfiles && bash setup.sh`
4. Install brew bundle (if set up) or tools individually.

## Dependencies to Install
- brew: stow, zsh, tmux, neovim, git, bat, fd, ripgrep, fzf, thefuck, htop, btop, neofetch, starship, zellij, yazi, sketchybar
- brew cask: ghostty, nikitabobko/tap/aerospace
- nix: Determinate Nix Installer
- tmux plugins: `~/.tmux/plugins/tpm` (git submodule)

## Git Info
- Remote: `git@github.com:madebymustafa/dotfiles.git`
- SSH key: `~/.ssh/id_ed25519` (added to GitHub)
