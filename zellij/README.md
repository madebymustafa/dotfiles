# zellij

Alternative terminal multiplexer kept alongside tmux. Config: `config.kdl`
clears all default keybinds and rebuilds from scratch; catppuccin-mocha theme,
pane frames off, simplified UI.

## Global chords (work from normal mode)

- Ctrl+a .................. pane mode
- Ctrl+n .................. resize mode
- Ctrl+t .................. tab mode
- Ctrl+s .................. scroll/search mode
- Ctrl+x .................. session mode (detach `d`, session manager `w`)
- Ctrl+b .................. tmux-style mode (`"` split down, `%` split right,
                            `c` new tab, `h/j/k/l` move, `[` scrollback)
- Ctrl+g .................. lock/unlock everything (toggle)
- Alt+n / Alt+r ........... new pane / rename tab

## Inside modes

- Pane mode: `h/j/k/l` focus · `n` new · `d` split down · `x` close ·
  `z` fullscreen · `w` toggle floating · `e` embed/float · `r` rename
- Resize mode: `h/j/k/l` grow edges · `H/J/K/L` shrink · `=/-` both sides
- Tab mode: `n/x` new/close · `1-9` jump · `r` rename · `b` break pane out
- Scroll mode: `j/k` line · `Ctrl+f/Ctrl+b` page · `s` search · `e` edit in $EDITOR
- Esc or Enter exits any mode back to normal

## Also handy

- Alt+h/l/j/k moves focus without any mode at all
- Mouse support is on; pane frames are permanently hidden
