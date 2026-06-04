## 🚀 Quick start

```bash
git clone git@github.com:madebymustafa/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh
```

## 🗂️ Structure

```
dotfiles/
├── install.sh      # installs all tools (brew, curl, omz, plugins, tpm)
├── setup.sh        # symlinks dotfiles via GNU Stow
├── aerospace/      → .config/aerospace/
├── atuin/          → .config/atuin/
├── bat/            → .config/bat/
├── btop/           → .config/btop/
├── fd/             → .config/fd/
├── ghostty/        → .config/ghostty/
├── git/            → ~/.gitconfig
├── htop/           → .config/htop/
├── .hushlogin      # suppress "Last login" on terminal start
├── neofetch/       → .config/neofetch/
├── nix/            → .config/nix/
├── nvim/           → .config/nvim/
├── opencode/       → .config/opencode/
├── sketchybar/     → .config/sketchybar/
├── ssh/            → ~/.ssh/
├── starship/       → .config/starship/
├── television/     → .config/television/
├── thefuck/        → .config/thefuck/
├── tmux/           → ~/.tmux.conf
├── wezterm/        → ~/.wezterm.lua
├── yazi/           → .config/yazi/
├── zellij/         → .config/zellij/
└── zsh/            → ~/.zshrc, ~/.p10k.zsh
```

Each directory in the tree is a [GNU Stow](https://www.gnu.org/software/stow/) package containing only the files that belong in its target location. Running `./setup.sh` creates symlinks from each package into the appropriate place on your system — your config stays in one place (`~/dotfiles`), and your system just sees symlinks.

**How it maps:**
- **Home packages** (`git`, `tmux`, `zsh`, `wezterm`) → symlinked into `$HOME` directly (e.g. `git/.gitconfig` → `~/.gitconfig`).
- **Config packages** (most others) → symlinked into `$XDG_CONFIG_HOME/<pkg>/` (e.g. `nvim/` → `~/.config/nvim/`).
- **ssh** → targets `~/.ssh/` so `ssh/config` becomes `~/.ssh/config`.
- **`.hushlogin`** lives at the repo root and is symlinked manually by `setup.sh` — no stow package needed for a single file.

## 🙌 Credits

Inspired by the dotfiles of the broader Linux/macOS ricing community.

