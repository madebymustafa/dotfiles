# fastfetch

System info display. `config.jsonc` carries over the module order, labels
and song format from the old neofetch setup.

## Layout details

- The `Host` line is a `command` module: it shells out to fastfetch against the
  tiny `host.jsonc` helper (just the host module, no logo) to get the raw
  marketing model name, then strips the trailing `Thunderbolt N ports` detail
  fastfetch appends from its model table (e.g. `MacBook Pro (16-inch, 2024,
  Three Thunderbolt 5 ports)` → `MacBook Pro (16-inch, 2024)`).
- The `Disk` line uses an explicit `format` that omits the `[Read-only]` mount
  flag fastfetch adds by default.
