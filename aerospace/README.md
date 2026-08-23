# AeroSpace

i3-style tiling window manager. Main config is `aerospace.toml`.

- Workspaces `1-9` plus mnemonic letters (B browser, C code, D design,
  E email, F finder, M music, S slack, T terminal, V video)
- Apps auto-route to their workspace on launch via `on-window-detected`
- Uniform 10px gaps, starts at login, mouse never moves automatically
- Hyper + Esc pauses/resumes the whole manager (handled by `../skhd`)

Every keybinding is documented in [CHEATSHEET.md](CHEATSHEET.md).
