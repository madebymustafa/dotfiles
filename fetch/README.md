# fetch

Spinning-3D-logo system info (donut.c-style), a fork of
[areofyl/fetch](https://github.com/areofyl/fetch) carrying the layout work.
`install.sh` clones the fork into `~/src/fetch`, builds it and installs to
`~/.local/bin/fetch`, so the visual patches survive a fresh machine.

## Config

`config` renders the info block in the same bracketed panel style as the
fastfetch config:

- `box=1` — top rail (`╭─╮`) and bottom rail (`╰─╯`), no side borders; the
  title sits centered above the top rail
- content lines are indented 4 cols from the left corner with a 3-col right
  margin
- `label_color=38;2;203;166;247` — mauve `#cba6f7` (catppuccin mocha)
- a single `colors` swatch row of eight `●` renders centered below the bottom
  rail, using the terminal's ANSI slots 30–37
- `separator=` is parsed but no longer drawn under the title

Anything mapped to `logo_outer`/`logo_inner` recolors the extruded logo edges
vs its face; the binary is rebuilt with `make` after source changes
(`~/src/fetch/fetch.c`).