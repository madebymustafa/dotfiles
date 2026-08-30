# Dotfiles Project Context

## Overview
macOS dotfiles managed with GNU Stow. User is `madebymustafa` (GitHub).

## Entry Points
- **`install.sh`**: one-command new-machine bootstrap. Installs all tools (brew, casks, fonts, opencode, oh-my-zsh, zsh plugins, tpm), then calls `setup.sh`. Full categorized inventory of what a fresh machine ends up with: see **Machine Blueprint** below.
- **`setup.sh`**: symlinks dotfiles via GNU Stow. Called by `install.sh`. Can also run standalone if tools are already installed.

## Machine Blueprint (categorized inventory of a fresh install)
Everything `install.sh` puts on a brand-new Mac, categorized. Source of truth is the `Brewfile` (regenerate with `bash brewfile-update.sh`), which mirrors this machine exactly as of **Aug 31, 2026**: **168 formulae** (71 hand-picked + 97 auto-installed dependencies), **12 casks**, **7 taps**. The README's Structure section only shows the stow/package layout; the full package inventory lives here. Keep this section in sync whenever the Brewfile changes.

### 🔌 Homebrew taps (7)
| tap | contributes |
|---|---|
| `asmvik/formulae` | tapped; no currently-installed formula comes from it (kept in the mirror) |
| `bjarneo/cliamp` | `cliamp` |
| `can1357/tap` | `omp` |
| `jordond/tap` | `jolt` |
| `kilo-org/tap` | `kilo` |
| `nikitabobko/tap` | `aerospace` (cask) |
| `teamookla/speedtest` | `speedtest` |

### 🧰 Formulae — hand-picked (71)
Grouped by purpose:

**Shell core & navigation** (13): atuin (history timeline), bat (cat + syntax), eza (`ls` + git), fd (`find`), fzf (fuzzy finder), television (fuzzy TUI), zoxide (smart `cd`), gum (glamorous scripting), glow (markdown), tlrc (`tldr`), thefuck (command correction), fastfetch (system info), stow (dotfiles symlinks — required by `setup.sh`)

**Multiplexing & sessions** (3): tmux · zellij · sesh (smart session manager)

**File & disk management** (6): yazi (file manager), elio (preview file manager), midnight-commander (MC), dua-cli, duf, ncdu

**Editors** (2): neovim (daily driver) · nano (fail-safe fallback)

**Git & GitHub workflow** (7): git · gh · lazygit · gitlogue (commit replay) · gitmoji · onefetch · hyperfine (benchmarking)

**Security & secrets** (3): gnupg (OpenPGP) · gitleaks (secret scanning) · doppler (env/secrets CLI)

**AI coding agents** (2): omp (can1357/tap) · kilo (kilo-org/tap) — plus casks codex & antigravity-cli and curl-installed opencode (see below)

**Terminal fun & screensavers** (13): asciiquarium · astroterm · cbonsai · cmatrix · cowsay · espeak-ng · figlet · fortune · hyfetch · lolcat · macchina · pipes-sh · toipe

**System & resource monitoring** (7): bottom · btop · cpufetch · htop · mactop (Apple Silicon) · bandwhich (bandwidth) · jolt (battery/energy, jordond/tap)

**Networking & transfer** (6): croc (secure transfer) · curlie (curl + httpie) · portal (file transfer) · s-search (web search) · serpl (search & replace) · speedtest (teamookla/tap)

**macOS utilities** (5): clipboard (clipboard from CLI) · duti (default apps) · fileicon (icons) · jrnl (journal) · switchaudio-osx (audio device)

**Apple dev & media** (4): cliamp (Winamp-style terminal player, bjarneo/tap) · portaudio (audio I/O lib) · vhs (terminal GIF/video recorder) · xcodegen (Xcode project generator)

### 📚 Formulae — auto-installed dependencies (97)
Not hand-chosen; listed only so `brew bundle` reproduces this machine exactly.

**Language runtimes** (6): bash · deno · go · node · python@3.13 · python@3.14

**Crypto & TLS stack** (16): ca-certificates · gmp · gnutls · libassuan · libgcrypt · libgpg-error · libidn2 · libksba · libssh2 · libtasn1 · nettle · npth · openssl@3 · openssl@4 · p11-kit · pinentry

**Compression** (4): brotli · lz4 · xz · zstd

**Media & codec libraries** (19): dav1d · ffmpeg · flac · giflib · jpeg-turbo · lame · libogg · libpng · libtiff · libvmaf · libvorbis · libvpx · little-cms2 · mpg123 · opus · svt-av1 · webp · x264 · x265

**Networking libraries** (9): ada-url · c-ares · libevent · libnghttp2 · libnghttp3 · libngtcp2 · libuv · libwebsockets · llhttp

**Text & parsing libraries** (20): argtable3 · fmt · gettext · glib · icu4c@78 · jemalloc · json-c · libgit2 · libunistring · libyaml · ncurses · oniguruma · pcre2 · readline · s-lang · simdjson · simdutf · sqlite · utf8proc · yyjson

**Neovim runtime** (6): lpeg · luajit · luv · tree-sitter · unibilium · uvwasi

**Python ecosystem deps** (6): certifi · cffi · cryptography · libffi · mpdecimal · pycparser

**Audio & graphics runtime** (3): pcaudiolib · sdl2-compat · sdl3

**Transitive tools** (8): diffutils · hdrhistogram_c · libusb · merve (C++ lexer) · nbytes · ripgrep (behind television) · ttyd · yt-dlp

### 🖥️ Casks — GUI apps & fonts (12)
- **Terminals** (2): ghostty · wezterm (daily driver)
- **Window management** (1): aerospace (tiling WM)
- **AI agents** (2): antigravity-cli · codex
- **Fonts** (2): font-jetbrains-mono-nerd-font · font-meslo-lg-nerd-font
- **Productivity** (1): espanso (text expander)
- **Utilities** (4): caskhub (GUI for casks) · cleanmymac-cli · freeze (Amazon Glacier client) · localsend (AirDrop alternative)

### 🐚 Shell stack (not brew)
- `zsh` (ships with macOS) + **Oh My Zsh** (curl-installed by install.sh)
- Theme **powerlevel10k**; plugins **zsh-autosuggestions** + **fast-syntax-highlighting** — all cloned into `$ZSH_CUSTOM` by install.sh. F-Sy-H must stay the last omz plugin and is the only highlighter; never reinstall any of these via brew (see Shell Setup).

### 🖥️ tmux + tpm
**12 plugins** wired in `.tmux.conf`, installed headless by install.sh: catppuccin/tmux · omerxx/catppuccin-tmux · tmux-sensible · tmux-yank · tmux-resurrect · tmux-continuum · tmux-thumbs · tmux-fzf · tmux-fzf-url · tmux-sessionx · tmux-floax · vim-tmux-navigator

### 🌱 Neovim (LazyVim)
install.sh syncs plugins headless (`nvim --headless "+Lazy! sync"`). **54 plugins** recorded in `~/.config/nvim/lazy-lock.json`: LazyVim distro + Mason (LSP / DAP / formatters, incl. helm-ls + nvim-lint), blink.cmp completions, Copilot + blink-copilot, mini.\* utility modules (ai · files · icons · pairs · surround), snacks.nvim, which-key, noice, trouble, neo-tree, nvim-dap + virtual-text/go UI, treesitter + textobjects + ts-autotag, render-markdown, grug-far (search & replace), kulala (REST client), windsurf.vim, lualine, persistence, etc.

### 🛠️ Other components install.sh provisions
- **fetch** — clone of the `madebymustafa/fetch` fork (areofyl/fetch + bracketed-panel patches) → `~/src/fetch`, built → `~/.local/bin/fetch`
- **opencode** — curl-installed (`https://opencode.ai/install.sh`) AI coding agent
- **raycast** — Script Commands in `raycast/scripts/` (e.g. `toggle-aerospace.sh`); wiring the directory + recording the Hyper+Esc hotkey are manual finish steps
- **nix** — Determinate Nix Installer (config stowed, binary not part of brew)
- **sketchybar** — config tracked at `sketchybar/` but **binary not installed** (reference only)
- **vscode** — `settings.json` + `keybindings.json` stowed into Code's User dir; extensions deliberately excluded from the Brewfile

## Install Flow
**Preamble**: bootstraps Homebrew via the official installer when `brew` isn't on PATH (the only sudo prompt), then exports `/opt/homebrew/bin` on PATH for the rest of the run.
1. Oh My Zsh (via curl, skipped if exists)
2. Brew bundle via `Brewfile` (`brew bundle --file=Brewfile`): full mirror of this machine — 168 formulae + 12 casks across 7 taps (incl. fonts, aerospace, raycast, wezterm, ghostty, espanso). Full categorized inventory: **Machine Blueprint** above. The file lists dependencies too, not just leaves, so a fresh machine reproduces the exact `fastfetch` package count. Regenerate it with `bash brewfile-update.sh` (this appends deps that a plain `brew bundle dump -force` would drop), then commit. VSCode extensions are excluded from the Brewfile on purpose (no `code` binary exists on a fresh machine).
3. `fetch` — cloned from the `madebymustafa/fetch` fork (areofyl/fetch + bracketed-panel layout patches) into `~/src/fetch`, built, installed to `~/.local/bin/fetch`. Re-runs `reset --hard` `~/src/fetch` to the fork's main: edit `fetch.c` there and push to the fork to keep installs reproducible
4. opencode via `curl -fsSL https://opencode.ai/install.sh | sh`
5. Zsh plugins cloned/pulled into `$ZSH_CUSTOM`: Powerlevel10k (theme), zsh-autosuggestions, fast-syntax-highlighting
6. Tmux plugin manager (tpm) cloned/pulled into `~/.tmux/plugins/tpm`
7. Calls `bash setup.sh` to symlink all dotfiles
8. Installs tmux plugins headless via tpm (`bin/install_plugins.sh` against a throwaway server)
9. Syncs neovim plugins headless (`nvim --headless "+Lazy! sync"`)
10. Launches AeroSpace; user must approve the Accessibility permission when macOS prompts

## Packages NOT installed by install.sh
- **sketchybar**: config folder tracked but deliberately excluded from `setup.sh` (user preference); binary never installed
- **raycast**: script commands in `raycast/` load straight from the repo via Raycast's Add Directories; wiring the directory and recording the Hyper+Esc hotkey are manual finish steps in install.sh (Raycast keeps hotkeys in its own database)
- **JankyBorders**: intentionally absent everywhere
- **ghostty**: config kept and stowed via setup.sh and its cask now ships via the Brewfile; wezterm stays the daily terminal
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
- The old brew copies (`powerlevel10k`, `zsh-autosuggestions`, `zsh-syntax-highlighting` formulae) were uninstalled - the shell loads these from `$ZSH_CUSTOM` instead. Do not reinstall them via brew; it raises a hardcoding trap exactly like the Homebrew-path sources the repo removed in commit `398663a`.
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
