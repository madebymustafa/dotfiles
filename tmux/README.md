# tmux

Terminal multiplexer. Config: `.tmux.conf`.

Prefix is **Ctrl+a** (screen-style, not the default Ctrl+b). Press prefix,
release, then press the key.

## Sessions & projects (via sesh)

- Prefix T ................ session/project picker (fzf over sesh + zoxide)
- Prefix W ................ window picker
- Prefix L ................ jump to last session
- Prefix 9 ................ switch to the root session of the current directory

## Panes

- Ctrl+h / j / k / l ...... move between tmux panes AND neovim splits as one
                            grid (vim-tmux-navigator)
- Prefix x ................ kill pane without the y/n confirmation

## Popups & pickers (plugins)

- Prefix p ................ floating terminal popup (floax)
- Prefix o ................ sessionx picker with zoxide mode on
- Prefix Ctrl-y ........... open sessionx selection as a new window
- Prefix u ................ fzf-url: open URLs found in scrollback

## Persistence (resurrect + continuum)

- Prefix Ctrl-s ........... save sessions/windows/panes
- Prefix Ctrl-r ........... restore
- continuum auto-saves in the background; restore-on-boot is off

## Notes

- Theme: catppuccin mocha with hand-built status pills - session name left,
  window list center, current path right.
- Plugins are managed by tpm (`~/.tmux/plugins/`, untracked). New machines
  install them automatically via `install.sh`.
- `.tmux.reset.conf` is a bare fallback config for debugging broken setups:
  `tmux -f ~/dotfiles/tmux/.tmux.reset.conf`
