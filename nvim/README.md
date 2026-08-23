# nvim

Neovim built on [LazyVim](https://www.lazyvim.org/). Entry point is
`init.lua`; personal code lives under `lua/`.

- Colorscheme: Catppuccin
- Enabled extras: copilot, dap, mini-files, rest, and language support for
  docker, go, helm, json, markdown and yaml
- `lua/plugins/` holds local plugin specs, including vim-tmux-navigator so
  `Ctrl+h/j/k/l` moves between neovim splits and tmux panes as one grid

Plugins install themselves on first launch via lazy.nvim.
