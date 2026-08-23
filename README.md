## 🚀 Install

```bash
git clone git@github.com:madebymustafa/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh   # installs all tools, then runs setup.sh to symlink everything
```

First run asks for Accessibility and Input Monitoring permissions — these
power AeroSpace and the skhd pause key. Approve both.

## 🗂️ Structure

```
dotfiles/
├── install.sh      # one-command bootstrap: tools, taps, casks, plugins, services
├── setup.sh        # symlinks everything via GNU Stow
├── aerospace/      → .config/aerospace/
├── atuin/          → .config/atuin/
├── bat/            → .config/bat/
├── btop/           → .config/btop/
├── fd/             → .config/fd/
├── gh-dash/        → .config/gh-dash/
├── ghostty/        → .config/ghostty/
├── git/            → ~/.gitconfig
├── htop/           → .config/htop/
├── .hushlogin      # suppress "Last login" on terminal start
├── fastfetch/      → .config/fastfetch/
├── nix/            → .config/nix/
├── nvim/           → .config/nvim/
├── opencode/       → .config/opencode/
├── sesh/           → .config/sesh/
├── skhd/           → .config/skhd/
├── sketchybar/     → .config/sketchybar/   # tracked for reference, not installed
├── ssh/            → ~/.ssh/
├── starship/       → .config/starship/
├── television/     → .config/television/
├── thefuck/        → .config/thefuck/
├── tmux/           → ~/.tmux.conf
├── vscode/         → ~/Library/Application Support/Code/User/
├── wezterm/        → ~/.wezterm.lua
├── yazi/           → .config/yazi/
├── zellij/         → .config/zellij/
└── zsh/            → ~/.zshrc, ~/.p10k.zsh
```

Each directory is a [GNU Stow](https://www.gnu.org/software/stow/) package
containing only the files that belong in its target location. `setup.sh`
symlinks them into place — your config lives in `~/dotfiles`, your system
just sees symlinks. Every package folder has its own README explaining what
it does and what's worth knowing before editing it.

**How it maps:**
- **Home packages** (`git`, `tmux`, `zsh`, `wezterm`) → symlinked into `$HOME` directly (e.g. `git/.gitconfig` → `~/.gitconfig`).
- **Config packages** (most others) → symlinked into `$XDG_CONFIG_HOME/<pkg>/` (e.g. `nvim/` → `~/.config/nvim/`).
- **ssh** → targets `~/.ssh/` so `ssh/config` becomes `~/.ssh/config`.
- **vscode** → targets `~/Library/Application Support/Code/User`.
- **`.hushlogin`** lives at the repo root and is symlinked manually by `setup.sh` — no stow package needed for a single file.
- **sketchybar** → kept in the repo for reference but deliberately excluded from `setup.sh`.

Window management is handled by [AeroSpace](https://github.com/nikitabobko/AeroSpace)
with the skhd daemon providing the Hyper+Esc pause toggle. Every keybinding is
documented in [`aerospace/README.md`](aerospace/README.md).

## 🙌 Credits

Inspired by the dotfiles of the broader Linux/macOS ricing community.
