## 🚀 Install

```bash
git clone git@github.com:madebymustafa/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh   # installs all tools, then runs setup.sh to symlink everything
```

First run asks for Accessibility and Input Monitoring permissions, which
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

Every directory is a [GNU Stow](https://www.gnu.org/software/stow/) package.
`setup.sh` symlinks each one into its target, so the real files live in
`~/dotfiles` and the system just sees links. Most packages land in
`~/.config/<pkg>/`; `git`, `tmux`, `zsh` and `wezterm` link straight into
`$HOME`; `ssh` targets `~/.ssh/` and `vscode` targets Code's User directory.
`.hushlogin` is symlinked manually since a single file needs no stow package,
and `sketchybar/` is tracked for reference only, skipped by `setup.sh`.

Each package has a README covering what it does and what's worth knowing
before editing it. Window management is [AeroSpace](https://github.com/nikitabobko/AeroSpace)
with the skhd pause toggle; every keybinding is documented in
[`aerospace/README.md`](aerospace/README.md).

## 🙌 Credits

Inspired by the macOS and Linux ricing communities.
