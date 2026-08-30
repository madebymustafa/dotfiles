# Dotfiles Project Context

## Overview
macOS dotfiles managed with GNU Stow. User is `madebymustafa` (GitHub).

## Entry Points
- **`install.sh`**: one-command new-machine bootstrap. Installs all tools (brew, casks, fonts, opencode, oh-my-zsh, zsh plugins, tpm), then calls `setup.sh`.
- **`setup.sh`**: symlinks dotfiles via GNU Stow. Called by `install.sh`. Can also run standalone if tools are already installed.

## Install Flow
1. Oh My Zsh (via curl, skipped if exists)
2. Brew formulae: `zsh tmux neovim git bat fd ripgrep fzf thefuck htop btop fastfetch starship zellij yazi television atuin zoxide eza gh bjarneo/cliamp/cliamp ffmpeg yt-dlp`
3. Brew casks: `wezterm font-jetbrains-mono-nerd-font aerospace raycast` (taps `nikitabobko/tap` first)
4. `fetch` — cloned from the `madebymustafa/fetch` fork (areofyl/fetch + bracketed-panel layout patches) into `~/src/fetch`, built, installed to `~/.local/bin/fetch`. Re-runs `reset --hard` `~/src/fetch` to the fork's main: edit `fetch.c` there and push to the fork to keep installs reproducible
5. opencode via `curl -fsSL https://opencode.ai/install.sh | sh`
6. Zsh plugins cloned/pulled into `$ZSH_CUSTOM`: Powerlevel10k (theme), zsh-autosuggestions, fast-syntax-highlighting
7. Tmux plugin manager (tpm) cloned/pulled into `~/.tmux/plugins/tpm`
8. Calls `bash setup.sh` to symlink all dotfiles
9. Installs tmux plugins headless via tpm (`bin/install_plugins.sh` against a throwaway server)
10. Syncs neovim plugins headless (`nvim --headless "+Lazy! sync"`)
11. Launches AeroSpace; user must approve the Accessibility permission when macOS prompts

## Packages NOT installed by install.sh
- **sketchybar**: config folder tracked but deliberately excluded from `setup.sh` (user preference); binary never installed
- **raycast**: script commands in `raycast/` load straight from the repo via Raycast's Add Directories; wiring the directory and recording the Hyper+Esc hotkey are manual finish steps in install.sh (Raycast keeps hotkeys in its own database)
- **JankyBorders**: intentionally absent everywhere
- **ghostty**: config kept and stowed via setup.sh; wezterm stays the daily terminal so its brew cask is not installed on fresh machines
- **nix**: Determinate Nix Installer

## Stow Strategy
- **setup.sh** uses per-package targets.
- Home-rooted packages (git, tmux, zsh, wezterm) → `$HOME` directly.
- Config packages (aerospace, atuin, bat, btop, fastfetch, fd, fetch, gh-dash, ghostty, htop, nix, nvim, opencode, sesh, starship, television, thefuck, yazi, zellij) → `$HOME/.config/<pkg>`.
- **ssh** → special case: targets `$HOME/.ssh/` (not `$HOME`).
- **vscode** → special case: targets `$HOME/Library/Application Support/Code/User`.
- **`.hushlogin`** → at repo root, symlinked manually by `setup.sh` via `ln -sf`.

## Package Structure
Flat directories only (no nested `.config/app/` prefix inside packages):
- `television/` contains `config.toml` and `cable/` directly (was `.config/television/` prefix before flattening)
- `ssh/` contains `config` directly (was `.ssh/config` before flattening)
- All other packages follow the same flat convention
- Every package folder ships exactly one doc: its `README.md`. For
  keybinding-heavy packages (aerospace, tmux, zellij, yazi...) it doubles as
  the cheatsheet - list bindings and gotchas there instead of making people
  read the config. Keep these in sync when behavior changes

## Shell Setup
- Interactive shell: `zsh` with Powerlevel10k theme.
- `setup.sh` uses `bash` (portable on macOS/Linux).
- `.zshrc` loads Oh My Zsh (`$ZSH/oh-my-zsh.sh`) as the framework; `ZSH_THEME="powerlevel10k/powerlevel10k"` resolves to the p10k clone in `$ZSH_CUSTOM/themes`.
- Plugins: zsh-autosuggestions, fast-syntax-highlighting (git cloned into `$ZSH_CUSTOM/plugins` by install.sh, loaded via the omz `plugins=()` array). F-Sy-H is the only highlighter and must stay the last plugin. zsh-syntax-highlighting is deliberately NOT used - both would re-wrap the same widgets.
- Default terminal: wezterm (font: JetBrains Mono Nerd Font).

## Key Decisions
- Flat package dirs throughout: never nested `.config/app/` inside packages.
- `~/.hushlogin` tracked at repo root, symlinked manually (not as a stow package).
- `git/.gitconfig` contains only public info (username, email, LFS). No credentials.
- `install.sh` and `setup.sh` are separate: one installs binaries, one creates symlinks.
- Public repo: avoid comments suggesting configs were copied from elsewhere.
- AeroSpace does not auto-start: start-at-login = false, no login item. install.sh launches it once during bootstrap to trigger the Accessibility prompt; after that the user launches manually.
- No hotkey daemon (skhd was removed - its launchd service showed up as an unidentified-developer item in Login Items). The Hyper+Esc toggle is a Raycast script command (`raycast/scripts/toggle-aerospace.sh`) running `aerospace enable toggle`; Raycast listens even while AeroSpace is disabled, so one chord toggles both ways. The chord must stay out of aerospace.toml (double-fire).
- WezTerm updates itself without daemons: brew cask install + a weekly scheduler inside `.wezterm.lua` (stamp-gated, detached, logs to `~/.cache/wezterm-upgrade.log`). No LaunchAgent.
- tmux plugin paths use `~/.tmux/` (not `$XDG_CONFIG_HOME`).

## README Structure
Only 3 sections:
1. **Install**: clone + cd + `bash install.sh`
2. **Structure**: tree with `→ target` alignment (`#` and `→` at column 17)
3. **Credits**: generic community credit

## Git Info
- Remote: `git@github.com:madebymustafa/dotfiles.git` but pushes currently authenticate over HTTPS via GitHub credentials
- No SSH keypair on this machine yet; if switching to SSH: `ssh-keygen -t ed25519`, add public half to GitHub
- Repo topics: aerospace, dotfiles, ghostty, homebrew, macos, neovim, sketchybar, tmux, wezterm, zsh
