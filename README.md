# dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Install

```bash
cd ~/dotfiles
./setup.sh
```

Or manually:

```bash
cd ~/dotfiles && stow .
```

## Structure

Each tool gets its own package directory. Files inside preserve their path
relative to `$HOME`, so stow creates symlinks in the right place.

```
dotfiles/
├── .stowrc          # stow defaults (target=$HOME)
├── setup.sh         # bootstrap script
├── aerospace/       → .config/aerospace/
├── bat/             → .config/bat/config
├── btop/            → .config/btop/
├── fd/              → .config/fd/ignore
├── ghostty/         → .config/ghostty/
├── git/             → .gitconfig
├── htop/            → .config/htop/htoprc
├── neofetch/        → .config/neofetch/
├── nix/             → .config/nix/nix.conf
├── nix-darwin/      → .config/nix-darwin/
├── nvim/            → .config/nvim/
├── opencode/        → .config/opencode/tui.json
├── starship/        → .config/starship/
├── ssh/             → .ssh/config
├── thefuck/         → .config/thefuck/
├── tmux/            → .config/tmux/
├── wezterm/         → .wezterm.lua
├── yazi/            → .config/yazi/
├── zellij/          → .config/zellij/
└── zshrc/           → .zshrc, .p10k.zsh
```
