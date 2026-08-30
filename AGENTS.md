# Dotfiles Project Context

## Overview
macOS dotfiles managed with GNU Stow. User is `madebymustafa` (GitHub).

## Entry Points
- **`install.sh`**: one-command new-machine bootstrap. Installs all tools (brew, casks, fonts, opencode, oh-my-zsh, zsh plugins, tpm), then calls `setup.sh`.
- **`setup.sh`**: symlinks dotfiles via GNU Stow. Called by `install.sh`. Can also run standalone if tools are already installed.

## Machine Blueprint (what a fresh install gets)
Every tap, formula, cask and non-brew component `install.sh` provisions, in
`<name>   # purpose` form (same style as the README structure tree). Source of
truth: `Brewfile` — snapshot **Aug 31, 2026**: 168 formulae (71 hand-picked +
97 dependencies), 12 casks, 7 taps. Regenerate with `bash brewfile-update.sh`
and keep this synced.

### Taps (7)
asmvik/formulae                 # tapped; no installed formula from it
bjarneo/cliamp                  # cliamp
can1357/tap                     # omp
jordond/tap                     # jolt
kilo-org/tap                    # kilo
nikitabobko/tap                 # aerospace (cask)
teamookla/speedtest             # speedtest

### Formulae — hand-picked (71)

Shell core & navigation (13):
atuin                           # improved shell history
bat                             # cat with syntax highlighting + git
eza                             # ls replacement
fastfetch                       # system info on shell start
fd                              # find replacement
fzf                             # fuzzy finder
glow                            # markdown rendered in terminal
gum                             # polish for shell scripts
stow                            # symlink manager (required by setup.sh)
television                      # fuzzy finder TUI
thefuck                         # autocorrect mistyped commands
tlrc                            # tldr pages
zoxide                          # smart cd

Multiplexing & sessions (3):
tmux                            # terminal multiplexer
zellij                          # terminal workspace / multiplexer
sesh                            # session manager

File & disk (6):
yazi                            # file manager
elio                            # file manager with previews
midnight-commander              # ncurses file manager
dua-cli                         # disk usage + cleanup
duf                             # df alternative
ncdu                            # ncurses disk usage

Editors (2):
neovim                          # daily editor (LazyVim)
nano                            # fail-safe editor

Git & GitHub (7):
git                             # version control
gh                              # GitHub CLI
lazygit                         # git TUI
gitlogue                        # cinematic commit replay
gitmoji                         # emoji in commit messages
onefetch                        # git repo info
hyperfine                       # command benchmarking

Security & secrets (3):
gnupg                           # OpenPGP
gitleaks                        # git secret scanner
doppler                         # secrets/env CLI

AI coding agents (2):
omp                             # coding agent wired to IDE (can1357/tap)
kilo                            # AI coding agent (kilo-org/tap)

Terminal fun (13):
asciiquarium                    # aquarium animation
astroterm                       # planetarium
cbonsai                         # bonsai tree generator
cmatrix                         # matrix rain
cowsay                          # talking cow
espeak-ng                       # speech synthesis
figlet                          # ASCII art banners
fortune                         # random quotes
hyfetch                         # system info + pride flags
lolcat                          # rainbow colorizer
macchina                        # minimal system info
pipes-sh                        # pipes screensaver
toipe                           # typing test

System monitoring (7):
bottom                          # process/system monitor
btop                            # resource monitor
cpufetch                        # CPU details
htop                            # process viewer
jolt                            # battery/energy monitor (jordond/tap)
mactop                          # Apple Silicon monitor
bandwhich                       # bandwidth monitor

Networking & transfer (6):
croc                            # secure file transfer
curlie                          # curl with httpie UX
portal                          # file transfer
s-search                        # web search from terminal
serpl                           # search & replace TUI
speedtest                       # network speed test (teamookla/tap)

macOS utilities (5):
clipboard                       # clipboard from terminal
duti                            # default apps for file types
fileicon                        # file/folder icons
jrnl                            # journaling
switchaudio-osx                 # switch audio output

Apple dev & media (4):
xcodegen                        # Xcode project generator
vhs                             # record terminal to GIF/video
cliamp                          # Winamp-style terminal player (bjarneo/cliamp)
portaudio                       # audio I/O library

### Formulae — dependencies (97)
Auto-installed with the 71 above; listed so `brew bundle` reproduces this machine exactly.

Language runtimes (6):
bash                            # modern bash (5.x)
deno                            # JS/TypeScript runtime
go                              # Go toolchain
node                            # JS runtime
python@3.13                     # Python
python@3.14                     # Python

Crypto & TLS (16):
ca-certificates                 # CA bundle
gmp                             # arbitrary-precision math
gnutls                          # TLS library
libassuan                       # GPG IPC
libgcrypt                       # GPG crypto primitives
libgpg-error                    # GPG error codes
libidn2                         # internationalized domain names
libksba                         # X.509 / ASN.1
libssh2                         # SSH library
libtasn1                        # ASN.1 library
nettle                          # crypto library
npth                            # GPG threading
openssl@3                       # TLS/crypto
openssl@4                       # TLS/crypto
p11-kit                         # PKCS#11 access
pinentry                        # GPG passphrase prompt

Compression (4):
brotli                          # compression
lz4                             # compression
xz                              # compression
zstd                            # compression

Media & codecs (19):
dav1d                           # AV1 decoder
ffmpeg                          # audio/video processing
flac                            # lossless audio codec
giflib                          # GIF
jpeg-turbo                      # JPEG
lame                            # MP3 encoder
libogg                          # Ogg container
libpng                          # PNG
libtiff                         # TIFF
libvmaf                         # video quality metric
libvorbis                       # audio codec
libvpx                          # VP8/VP9 codecs
little-cms2                     # color management
mpg123                          # MPEG audio
opus                            # audio codec
svt-av1                         # AV1 encoder
webp                            # WebP image
x264                            # H.264 encoder
x265                            # HEVC encoder

Networking libraries (9):
ada-url                         # URL parser
c-ares                          # async DNS
libevent                        # event loop
libnghttp2                      # HTTP/2
libnghttp3                      # HTTP/3
libngtcp2                       # QUIC/HTTP/3 core
libuv                           # async I/O
libwebsockets                   # websockets
llhttp                          # HTTP parser

Text & parsing (20):
argtable3                       # CLI argument parsing
fmt                             # C++ formatting
gettext                         # internationalization
glib                            # core utilities
icu4c@78                        # Unicode support
jemalloc                        # memory allocator
json-c                          # JSON
libgit2                         # git library
libunistring                    # Unicode strings
libyaml                         # YAML
ncurses                         # terminal UI
oniguruma                       # regex
pcre2                           # regex
readline                        # line editing
s-lang                          # terminal UI (mc)
simdjson                        # fast JSON
simdutf                         # UTF validation
sqlite                          # embedded database
utf8proc                        # Unicode processing
yyjson                          # fast JSON

Neovim runtime (6):
lpeg                            # Lua parsing
luajit                          # LuaJIT runtime
luv                             # libuv bindings for Lua
tree-sitter                     # incremental parsing
unibilium                       # terminfo
uvwasi                          # WASI primitives

Python ecosystem (6):
certifi                         # CA bundle for Python
cffi                            # C FFI for Python
cryptography                    # crypto for Python
libffi                          # foreign function interface
mpdecimal                       # decimal for Python
pycparser                       # C parser for Python

Audio & graphics runtime (3):
pcaudiolib                      # audio I/O
sdl2-compat                     # SDL2 compatibility
sdl3                            # SDL3

Transitive tools (8):
diffutils                       # diff utilities
hdrhistogram_c                  # latency histograms
libusb                          # USB access
merve                           # C++ lexer (CommonJS exports)
nbytes                          # byte handling (from Node.js core)
ripgrep                         # fast search (television dep)
ttyd                            # share terminal over the web
yt-dlp                          # video download

### Casks (12)

Terminals (2):
ghostty                         # GPU terminal emulator
wezterm                         # daily terminal (GPU-accelerated)

Window management (1):
aerospace                       # tiling window manager (i3-like)

AI agents (2):
antigravity-cli                 # terminal for Antigravity agents
codex                           # OpenAI coding agent

Fonts (2):
font-jetbrains-mono-nerd-font   # JetBrains Mono + Nerd glyphs
font-meslo-lg-nerd-font         # Meslo LG + Nerd glyphs

Productivity (1):
espanso                         # text expander

Utilities (4):
caskhub                         # GUI for Homebrew casks
cleanmymac-cli                  # CleanMyMac CLI
freeze                          # Amazon Glacier transfer
localsend                       # AirDrop alternative

### Shell (zsh + omz — not brew)
zsh                             # macOS system shell
oh-my-zsh                       # zsh framework (curl-installed)
powerlevel10k                   # prompt theme ($ZSH_CUSTOM/themes)
zsh-autosuggestions             # inline history suggestions
fast-syntax-highlighting        # syntax highlighting (must stay last plugin)

### tmux plugins (12, via tpm)
catppuccin/tmux                 # status bar theme
omerxx/catppuccin-tmux          # status bar components
tmux-sensible                   # saner defaults
tmux-yank                       # system clipboard copy
tmux-resurrect                  # session restore
tmux-continuum                  # auto-save/restore
tmux-thumbs                     # quick copy with regex thumbs
tmux-fzf                        # fzf integration
tmux-fzf-url                    # open URLs via fzf
tmux-sessionx                   # session switcher
tmux-floax                      # floating pane
vim-tmux-navigator              # vim-style pane navigation

### Other components
nvim plugins (54)               # LazyVim; lockfile ~/.config/nvim/lazy-lock.json
fetch fork                      # built → ~/.local/bin/fetch
opencode                        # AI coding agent (curl install)
raycast/scripts                 # script commands, e.g. toggle-aerospace.sh
nix (Determinate)               # package manager; config stowed
sketchybar                      # config tracked; binary NOT installed
vscode                          # settings + keybindings stowed to Code User dir

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