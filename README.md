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
    <a href="#features">Features</a> •
    <a href="#packages">Packages</a> •
    <a href="#install">Install</a> •
    <a href="#structure">Structure</a> •
    <a href="#credits">Credits</a>
  </p>
</div>

A curated set of configuration files for macOS, bringing together a modern terminal experience, a tiling window manager, and a powerful Neovim setup — all bootstrapped with a single command.

## ✨ Features

| Tool | Description |
|------|-------------|
| **aerospace** | Tiling window manager for macOS, keyboard-driven |
| **atuin** | Encrypted, synced shell history with fuzzy search |
| **bat** | Modern `cat` replacement with syntax highlighting and Git integration |
| **btop** | Resource monitor with CPU, memory, and process views |
| **fd** | Fast file search — a modern alternative to `find` |
| **ghostty** | GPU-accelerated terminal with custom keybindings and theme |
| **git** | Version control aliases and configuration |
| **htop** | Interactive process viewer |
| **hushlogin** | Suppress the "Last login" message on terminal start |
| **neofetch** | Stylish system information display |
| **neovim** | LazyVim-based config with Copilot, DAP, Treesitter, 15+ language extras |
| **nix** | Declarative package management and reproducible environments |
| **opencode** | AI-powered CLI coding tool |
| **sketchybar** | Feature-rich macOS menu bar replacement |
| **ssh** | Secure shell configuration with hosts and options |
| **starship** | Minimal, customizable cross-shell prompt |
| **television** | TUI fuzzy-finder for files, git branches, processes, and more |
| **thefuck** | Auto-correct mistyped shell commands |
| **tmux** | Terminal multiplexer with resurrect/continuum session persistence |
| **wezterm** | GPU-accelerated terminal emulator (default terminal) |
| **yazi** | Terminal file manager with image previews and file operations |
| **zellij** | Terminal multiplexer with built-in layout system |
| **zsh** | Shell config with Powerlevel10k, autosuggestions, syntax highlighting, FZF |

## 📦 Packages

| Domain | Tools |
|--------|-------|
| **Shell** | zsh, Powerlevel10k, zsh-autosuggestions, zsh-syntax-highlighting, FZF, zoxide, thefuck, atuin, starship |
| **Editor** | Neovim (LazyVim), bat, fd, ripgrep |
| **Window Manager** | aerospace |
| **Terminal** | Ghostty, wezterm, tmux, television, yazi, zellij |
| **UI** | sketchybar, neofetch |
| **System** | git, ssh, htop, btop, nix, GNU Stow |
| **Other** | opencode CLI |

## 🚀 Install

**Prerequisites:** [Homebrew](https://brew.sh), [GNU Stow](https://www.gnu.org/software/stow/)

```bash
brew install stow

git clone git@github.com:madebymustafa/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

Then install the tools you need:

<details>
<summary>Brew bundle</summary>

```bash
brew install zsh tmux neovim git bat fd ripgrep fzf thefuck htop btop \
  neofetch starship zellij yazi sketchybar television atuin
brew install --cask ghostty nikitabobko/tap/aerospace
```
</details>

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
├── hushlogin/      → ~/.hushlogin
├── neofetch/       → .config/neofetch/
├── nix/            → .config/nix/
├── nvim/           → .config/nvim/
├── opencode/       → .config/opencode/
├── sketchybar/     → .config/sketchybar/
├── ssh/            → ~/.ssh/config
├── starship/       → .config/starship/
├── television/     → .config/television/
├── thefuck/        → .config/thefuck/
├── tmux/           → ~/.tmux.conf
├── wezterm/        → ~/.wezterm.lua
├── yazi/           → .config/yazi/
├── zellij/         → .config/zellij/
└── zsh/            → ~/.zshrc, ~/.p10k.zsh
```

Home-rooted packages (git, hushlogin, tmux, zsh, wezterm, ssh) symlink directly into `$HOME`.  
Config-rooted packages symlink into `$XDG_CONFIG_HOME/<pkg>/`.

## 🔧 Customization

Each package directory mirrors the target layout. Edit the file in `dotfiles/<pkg>/` and the changes are reflected immediately through the stow symlink.

```bash
nvim ~/dotfiles/zsh/.zshrc      # edit zsh config
nvim ~/dotfiles/nvim/           # edit Neovim config
```

## 🙌 Credits

Inspired by the dotfiles of the broader Linux/macOS ricing community.

---

<sub> ⚡ Managed with GNU Stow · built for macOS </sub>
