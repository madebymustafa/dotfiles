## 🚀 Install

**New machine — everything, one command.** `install.sh` installs all tools
(brew bundle, Oh My Zsh, plugins, tpm, …) and then runs `setup.sh` as its final
step, so you never need to call it yourself to get a working setup.

```bash
git clone git@github.com:madebymustafa/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh   # tools → symlinks, in one go
```

> Prerequisite: Homebrew must already be installed, because every tool ships
> through `brew bundle`. On a brand-new Mac, bootstrap it first:
> `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

First run asks for the Accessibility permission, which powers AeroSpace.
Approve it.

**Tools already installed — symlinks only.** Skip `install.sh` and just wire
up the config files:

```bash
cd ~/dotfiles
bash setup.sh   # symlinks via GNU Stow (brew bundle installs stow for you)
```

`setup.sh` creates symlinks only — see Structure below for where each package
lands. It is safe to re-run after any `git pull` to refresh symlinks. Caveat:
stow refuses to clobber a real file, so if a target like `~/.zshrc` already
exists as a regular file (not a link), move it out of the way first.

## 🗂️ Structure

```
dotfiles/
├── Brewfile        # full brew mirror: 168 formulae + 12 casks (incl. deps)
├── install.sh      # one-command bootstrap: brew bundle, tools, plugins
├── brewfile-update.sh  # regenerate Brewfile (dump + append dependencies)
├── setup.sh        # symlinks everything via GNU Stow
├── aerospace/      → .config/aerospace/
├── atuin/          → .config/atuin/
├── bat/            → .config/bat/
├── btop/           → .config/btop/
├── cliamp/         → .config/cliamp/
├── fd/             → .config/fd/
├── fetch/          → .config/fetch/
├── gh-dash/        → .config/gh-dash/
├── ghostty/        → .config/ghostty/
├── git/            → ~/.gitconfig
├── htop/           → .config/htop/
├── .hushlogin      # suppress "Last login" on terminal start
├── fastfetch/      → .config/fastfetch/
├── nix/            → .config/nix/
├── nvim/           → .config/nvim/
├── opencode/       → .config/opencode/
├── raycast/        # script commands loaded by Raycast directly (not stowed)
├── sesh/           → .config/sesh/
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
└── zsh/            → ~/.zshrc, ~/.p10k.zsh, ~/.zprofile
```

Every directory is a [GNU Stow](https://www.gnu.org/software/stow/) package.
`setup.sh` symlinks each one into its target, so the real files live in
`~/dotfiles` and the system just sees links. Most packages land in
`~/.config/<pkg>/`; `git`, `tmux`, `zsh` and `wezterm` link straight into
`$HOME`; `ssh` targets `~/.ssh/` and `vscode` targets Code's User directory.
`.hushlogin` is symlinked manually since a single file needs no stow package,
and `sketchybar/` is tracked for reference only, skipped by `setup.sh`.

Each package has a README covering what it does and what's worth knowing
before editing it. Window management is [AeroSpace](https://github.com/nikitabobko/AeroSpace);
Hyper + Esc toggles tiling via a Raycast script command, and every keybinding
is documented in [`aerospace/README.md`](aerospace/README.md).

## 🙌 Credits

Inspired by the macOS and Linux ricing communities.
