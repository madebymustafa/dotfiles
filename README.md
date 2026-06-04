## 🚀 Install

**Prerequisites:** [Homebrew](https://brew.sh), [GNU Stow](https://www.gnu.org/software/stow/)

```bash
brew install stow

git clone git@github.com:madebymustafa/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

## 🗂️ Structure

```
dotfiles/
├── setup.sh                   # bootstrap — runs stow for all packages
├── aerospace/      → .config/aerospace/
├── atuin/          → .config/atuin/
├── bat/            → .config/bat/
├── btop/           → .config/btop/
├── fd/             → .config/fd/
├── ghostty/        → .config/ghostty/
├── git/            → ~/.gitconfig
├── htop/           → .config/htop/
├── .hushlogin                  # suppress "Last login" on terminal start
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

Home-rooted packages (git, tmux, zsh, wezterm) symlink directly into `$HOME`.  
The `.hushlogin` file lives at the repo root and is symlinked separately.  
The `ssh` package symlinks into `~/.ssh/`.  
Config-rooted packages symlink into `$XDG_CONFIG_HOME/<pkg>/`.

## 🙌 Credits

Inspired by the dotfiles of the broader Linux/macOS ricing community.

