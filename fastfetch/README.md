# fastfetch

System info display. `config.jsonc` carries over the module order, labels
and song format from the old neofetch setup.

The logo is width-aware (no wrapper needed): `logos/apple.ans` (classic) is
shown at >= 104 columns, `logos/apple-small.ans` at smaller widths, so the
same 72-wide bracketed box fits half-split terminals while the Apple art
stays visible everywhere. The command reads the terminal width from its own
stdin (`stty size <&0`). Below 88 columns the box clips cleanly at the right
edge (`display.disableLinewrap`) instead of wrapping into garbage.
