<div align="center">
  <h1>🍎 dotfiles</h1>
  <p>
    <b>macOS dotfiles managed with GNU Stow</b>
  </p>
  <p>
    <img src="https://img.shields.io/github/stars/madebymustafa/dotfiles?style=flat&label=stars&color=eed49f" alt="Stars">
    <img src="https://img.shields.io/github/license/madebymustafa/dotfiles?style=flat&color=a6da95" alt="License">
    <img src="https://img.shields.io/badge/macOS-Sequoia-18181b?style=flat&logo=apple&logoColor=white" alt="macOS">
    <img src="https://img.shields.io/badge/shell-zsh-4e4e4e?style=flat&logo=gnu-bash&logoColor=white" alt="Zsh">
    <img src="https://img.shields.io/badge/stow-v2.4-7f849c?style=flat" alt="Stow">
  </p>
  <p>
    <a href="#install">Install</a> •
    <a href="#structure">Structure</a> •
    <a href="#credits">Credits</a>
  </p>
</div>

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

