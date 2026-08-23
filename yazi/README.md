# yazi

Terminal file manager. Config: `yazi.toml`; theme via the bundled
catppuccin-mocha flavor in `flavors/`.

- 1:4:3 preview ratio, alphabetical sort with directories first
- Click and scroll mouse events enabled

## Keybindings

`keymap.toml` documents the full (default) map - vim-style throughout.
The ones worth having in your fingers:

- `j/k` move · `h/l` leave/enter dirs · `gg/G` top/bottom
- `Space` select · `v` visual select · `y/x/p` copy/cut/paste
- `d` trash · `a` create · `r` rename
- `s` search (fd) · `S` search content (rg) · `z` zoxide jump
- `t` new tab · `w` task manager · `~` help shows everything else
