# zsh

Shell config. `.zshrc` + Powerlevel10k prompt (`.p10k.zsh`) + `.zprofile`.

- Oh My Zsh is the framework (`ZSH_THEME="powerlevel10k/powerlevel10k"`), with
  autosuggestions and fast-syntax-highlighting (async; loaded last). Everything
  is cloned into `~/.oh-my-zsh/custom` by `install.sh`, so a fresh machine
  renders the same prompt with zero extra steps.
- PATH blocks for ~/.local/bin, LM Studio, bun and Homebrew bin/sbin
- thefuck alias, secrets sourced from untracked `~/.env`

## Aliases worth knowing

- `rm` ................ moves to trash, never deletes (use `command rm` to force)
- `l` / `ls` .......... eza with icons
- `ll` / `la` ......... long / all
- `lt` / `lt1` / `lt2` . tree views (full, depth 1, depth 2)
- `reload-zsh` ........ source ~/.zshrc
- `edit-zsh` .......... open .zshrc in nvim
- `cursor` ............ VS Code fork in classic mode
- `y` ................. yazi wrapper that cd's your shell to wherever you quit it

Plugin managers and completions are installed by `install.sh`.
