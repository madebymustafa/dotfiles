# Dotfiles Project Context

## Overview
macOS dotfiles managed with GNU Stow. User is `madebymustafa` (GitHub).

## Entry Points
- **`install.sh`**: one-command new-machine bootstrap. Installs all tools (brew, casks, fonts, opencode, oh-my-zsh, zsh plugins, tpm), then calls `setup.sh`.
- **`setup.sh`**: symlinks dotfiles via GNU Stow. Called by `install.sh`. Can also run standalone if tools are already installed.

## Machine Blueprint (what a fresh install gets)
The full inventory `install.sh` provisions — `<name>   # purpose` per line,
same style as the README Structure tree. Source of truth: `Brewfile`
(snapshot **Aug 31, 2026**: 168 formulae + 12 casks + 7 taps). Regenerate
with `bash brewfile-update.sh` and keep this in sync.

```text
brew-bundle/
├── Brewfile              # full brew mirror: 168 formulae + 12 casks (incl. deps)
├── install.sh            # one-command bootstrap: brew bundle, tools, plugins
├── brewfile-update.sh    # regenerate Brewfile (dump + append dependencies)
├── setup.sh              # symlinks everything via GNU Stow
├── formulae/             # 71 hand-picked brew packages
│   ├── asciiquarium                    # aquarium animation
│   ├── astroterm                       # planetarium
│   ├── atuin                           # improved shell history
│   ├── bandwhich                       # bandwidth monitor
│   ├── bat                             # cat with syntax highlighting + git
│   ├── bottom                          # process/system monitor
│   ├── btop                            # resource monitor
│   ├── cbonsai                         # bonsai tree generator
│   ├── cliamp                          # Winamp-style terminal player
│   ├── clipboard                       # clipboard from terminal
│   ├── cmatrix                         # matrix rain
│   ├── cowsay                          # talking cow
│   ├── cpufetch                        # CPU details
│   ├── croc                            # secure file transfer
│   ├── curlie                          # curl with httpie UX
│   ├── doppler                         # secrets/env CLI
│   ├── dua-cli                         # disk usage + cleanup
│   ├── duf                             # df alternative
│   ├── duti                            # default apps for file types
│   ├── elio                            # file manager with previews
│   ├── espeak-ng                       # speech synthesis
│   ├── eza                             # ls replacement
│   ├── fastfetch                       # system info on shell start
│   ├── fd                              # find replacement
│   ├── figlet                          # ASCII art banners
│   ├── fileicon                        # file/folder icons
│   ├── fortune                         # random quotes
│   ├── fzf                             # fuzzy finder
│   ├── gh                              # GitHub CLI
│   ├── git                             # version control
│   ├── gitleaks                        # git secret scanner
│   ├── gitlogue                        # cinematic commit replay
│   ├── gitmoji                         # emoji in commit messages
│   ├── glow                            # markdown rendered in terminal
│   ├── gnupg                           # OpenPGP
│   ├── gum                             # polish for shell scripts
│   ├── htop                            # process viewer
│   ├── hyfetch                         # system info + pride flags
│   ├── hyperfine                       # command benchmarking
│   ├── jolt                            # battery/energy monitor
│   ├── jrnl                            # journaling
│   ├── kilo                            # AI coding agent
│   ├── lazygit                         # git TUI
│   ├── lolcat                          # rainbow colorizer
│   ├── macchina                        # minimal system info
│   ├── mactop                          # Apple Silicon monitor
│   ├── midnight-commander              # ncurses file manager
│   ├── nano                            # fail-safe editor
│   ├── ncdu                            # ncurses disk usage
│   ├── neovim                          # daily editor (LazyVim)
│   ├── omp                             # coding agent wired to IDE
│   ├── onefetch                        # git repo info
│   ├── pipes-sh                        # pipes screensaver
│   ├── portal                          # file transfer
│   ├── portaudio                       # audio I/O library
│   ├── s-search                        # web search from terminal
│   ├── serpl                           # search & replace TUI
│   ├── sesh                            # session manager
│   ├── speedtest                       # network speed test
│   ├── stow                            # symlink manager (setup.sh dependency)
│   ├── switchaudio-osx                 # switch audio output
│   ├── television                      # fuzzy finder TUI
│   ├── thefuck                         # autocorrect mistyped commands
│   ├── tlrc                            # tldr pages
│   ├── tmux                            # terminal multiplexer
│   ├── toipe                           # typing test
│   ├── vhs                             # record terminal to GIF/video
│   ├── xcodegen                        # Xcode project generator
│   ├── yazi                            # file manager
│   ├── zellij                          # terminal workspace / multiplexer
│   └── zoxide                          # smart cd
├── dependencies/         # 97 auto-installed libraries (keep brew bundle exact)
│   ├── ada-url                         # URL parser
│   ├── argtable3                       # CLI argument parsing
│   ├── bash                            # modern bash (5.x)
│   ├── brotli                          # compression
│   ├── c-ares                          # async DNS
│   ├── ca-certificates                 # CA bundle
│   ├── certifi                         # CA bundle for Python
│   ├── cffi                            # C FFI for Python
│   ├── cryptography                    # crypto for Python
│   ├── dav1d                           # AV1 decoder
│   ├── deno                            # JS/TypeScript runtime
│   ├── diffutils                       # diff utilities
│   ├── ffmpeg                          # audio/video processing
│   ├── flac                            # lossless audio codec
│   ├── fmt                             # C++ formatting
│   ├── gettext                         # internationalization
│   ├── giflib                          # GIF
│   ├── glib                            # core utilities
│   ├── gmp                             # arbitrary-precision math
│   ├── gnutls                          # TLS library
│   ├── go                              # Go toolchain
│   ├── hdrhistogram_c                  # latency histograms
│   ├── icu4c@78                        # Unicode support
│   ├── jemalloc                        # memory allocator
│   ├── jpeg-turbo                      # JPEG
│   ├── json-c                          # JSON
│   ├── lame                            # MP3 encoder
│   ├── libassuan                       # GPG IPC
│   ├── libevent                        # event loop
│   ├── libffi                          # foreign function interface
│   ├── libgcrypt                       # GPG crypto primitives
│   ├── libgit2                         # git library
│   ├── libgpg-error                    # GPG error codes
│   ├── libidn2                         # internationalized domain names
│   ├── libksba                         # X.509 / ASN.1
│   ├── libnghttp2                      # HTTP/2
│   ├── libnghttp3                      # HTTP/3
│   ├── libngtcp2                       # QUIC/HTTP/3 core
│   ├── libogg                          # Ogg container
│   ├── libpng                          # PNG
│   ├── libssh2                         # SSH library
│   ├── libtasn1                        # ASN.1 library
│   ├── libtiff                         # TIFF
│   ├── libunistring                    # Unicode strings
│   ├── libusb                          # USB access
│   ├── libuv                           # async I/O
│   ├── libvmaf                         # video quality metric
│   ├── libvorbis                       # audio codec
│   ├── libvpx                          # VP8/VP9 codecs
│   ├── libwebsockets                   # websockets
│   ├── libyaml                         # YAML
│   ├── little-cms2                     # color management
│   ├── llhttp                          # HTTP parser
│   ├── lpeg                            # Lua parsing
│   ├── luajit                          # LuaJIT runtime
│   ├── luv                             # libuv bindings for Lua
│   ├── lz4                             # compression
│   ├── merve                           # C++ lexer (CommonJS exports)
│   ├── mpdecimal                       # decimal for Python
│   ├── mpg123                          # MPEG audio
│   ├── nbytes                          # byte handling (from Node.js core)
│   ├── ncurses                         # terminal UI
│   ├── nettle                          # crypto library
│   ├── node                            # JS runtime
│   ├── npth                            # GPG threading
│   ├── oniguruma                       # regex
│   ├── openssl@3                       # TLS/crypto
│   ├── openssl@4                       # TLS/crypto
│   ├── opus                            # audio codec
│   ├── p11-kit                         # PKCS#11 access
│   ├── pcaudiolib                      # audio I/O
│   ├── pcre2                           # regex
│   ├── pinentry                        # GPG passphrase prompt
│   ├── pycparser                       # C parser for Python
│   ├── python@3.13                     # Python
│   ├── python@3.14                     # Python
│   ├── readline                        # line editing
│   ├── ripgrep                         # fast search (television dep)
│   ├── s-lang                          # terminal UI (mc)
│   ├── sdl2-compat                     # SDL2 compatibility
│   ├── sdl3                            # SDL3
│   ├── simdjson                        # fast JSON
│   ├── simdutf                         # UTF validation
│   ├── sqlite                          # embedded database
│   ├── svt-av1                         # AV1 encoder
│   ├── tree-sitter                     # incremental parsing
│   ├── ttyd                            # share terminal over the web
│   ├── unibilium                       # terminfo
│   ├── utf8proc                        # Unicode processing
│   ├── uvwasi                          # WASI primitives
│   ├── webp                            # WebP image
│   ├── x264                            # H.264 encoder
│   ├── x265                            # HEVC encoder
│   ├── xz                              # compression
│   ├── yt-dlp                          # video download
│   ├── yyjson                          # fast JSON
│   └── zstd                            # compression
├── casks/                # 12 GUI apps + fonts
│   ├── aerospace                       # tiling window manager (i3-like)
│   ├── antigravity-cli                 # terminal for Antigravity agents
│   ├── caskhub                         # GUI for Homebrew casks
│   ├── cleanmymac-cli                  # CleanMyMac CLI
│   ├── codex                           # OpenAI coding agent
│   ├── espanso                         # text expander
│   ├── font-jetbrains-mono-nerd-font   # JetBrains Mono + Nerd glyphs
│   ├── font-meslo-lg-nerd-font         # Meslo LG + Nerd glyphs
│   ├── freeze                          # Amazon Glacier transfer
│   ├── ghostty                         # GPU terminal emulator
│   ├── localsend                       # AirDrop alternative
│   └── wezterm                         # daily terminal (GPU-accelerated)
├── taps/                 # 7 third-party Homebrew taps
│   ├── asmvik/formulae                 # tapped; no installed formula from it
│   ├── bjarneo/cliamp                  # cliamp
│   ├── can1357/tap                     # omp
│   ├── jordond/tap                     # jolt
│   ├── kilo-org/tap                    # kilo
│   ├── nikitabobko/tap                 # aerospace (cask)
│   └── teamookla/speedtest             # speedtest
├── shell/                # zsh + Oh My Zsh stack (not brew)
│   ├── zsh                             # macOS system shell
│   ├── oh-my-zsh                       # zsh framework (curl-installed)
│   ├── powerlevel10k                   # prompt theme
│   ├── zsh-autosuggestions             # inline history suggestions
│   └── fast-syntax-highlighting        # syntax highlighting (must stay last omz plugin)
├── tmux/                 # 12 plugins via tpm
│   ├── catppuccin/tmux                 # status bar theme
│   ├── omerxx/catppuccin-tmux          # status bar components
│   ├── tmux-continuum                  # auto-save/restore
│   ├── tmux-floax                      # floating pane
│   ├── tmux-fzf                        # fzf integration
│   ├── tmux-fzf-url                    # open URLs via fzf
│   ├── tmux-resurrect                  # session restore
│   ├── tmux-sensible                   # saner defaults
│   ├── tmux-sessionx                   # session switcher
│   ├── tmux-thumbs                     # quick copy with regex thumbs
│   ├── tmux-yank                       # system clipboard copy
│   └── vim-tmux-navigator              # vim-style pane navigation
└── other/                # non-brew components
    ├── nvim                            # LazyVim editor + 54 plugins (lockfile: lazy-lock.json)
    ├── fetch                           # system info fetcher built from fork (~/.local/bin/fetch)
    ├── opencode                        # AI coding agent (curl-installed)
    ├── raycast                         # script commands loaded straight from repo (toggle-aerospace.sh)
    ├── nix                             # Determinate Nix Installer; config stowed
    ├── sketchybar                      # config tracked; binary NOT installed
    └── vscode                          # settings + keybindings stowed to Code User dir
```

## Install Flow
**Preamble**: bootstraps Homebrew via the official installer when `brew` isn't on PATH (the only sudo prompt), then exports `/opt/homebrew/bin` on PATH for the rest of the run.
1. Oh My Zsh (via curl, skipped if exists)
2. Brew bundle via `Brewfile` (`brew bundle --file=Brewfile`): full mirror of this machine — 168 formulae + 12 casks across 7 taps (incl. fonts, aerospace, raycast, wezterm, ghostty, espanso). The file lists dependencies too, not just leaves, so a fresh machine reproduces the exact `fastfetch` package count. Regenerate it with `bash brewfile-update.sh` (this appends deps that a plain `brew bundle dump -force` would drop), then commit. VSCode extensions are excluded from the Brewfile on purpose (no `code` binary exists on a fresh machine).
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