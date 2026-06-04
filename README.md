# dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Install

```bash
cd ~/dotfiles
./setup.sh
```

## Structure

```
dotfiles/
├── setup.sh         # bootstrap script
├── aerospace/       → .config/aerospace/aerospace.toml
├── bat/             → .config/bat/config
├── btop/            → .config/btop/btop.conf
├── fd/              → .config/fd/ignore
├── ghostty/         → .config/ghostty/
├── git/             → .gitconfig
├── htop/            → .config/htop/htoprc
├── neofetch/        → .config/neofetch/config.conf
├── nix/             → .config/nix/nix.conf
├── nvim/            → .config/nvim/
├── opencode/        → .config/opencode/
├── starship/        → .config/starship/starship.toml
├── ssh/             → .ssh/config
├── thefuck/         → .config/thefuck/
├── tmux/            → .tmux.conf, .tmux.reset.conf
├── wezterm/         → .wezterm.lua
├── yazi/            → .config/yazi/
├── zellij/          → .config/zellij/
└── zsh/             → .zshrc, .p10k.zsh
```
