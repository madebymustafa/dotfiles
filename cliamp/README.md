# cliamp

Retro terminal music player ([cliamp.stream](https://cliamp.stream)). Streams
local files, radio, Spotify, Qobuz, YouTube Music, and self-hosted servers.

- Theme/visualizer: not pinned — cliamp saves the last session's theme and
  visualizer into `~/.config/cliamp/config.toml` itself, so what you had last
  time is restored on launch (`T` = theme picker, `v`/Ctrl+V = visualizer).
- Default source: Radio. In the player press `S` = Spotify, `R` = Radio,
  `L` = Local, `V` = full-screen visualizer (uppercase), `v` = cycle visualizer.
- Spotify: requires a Premium account. `client_id` is read from
  `$CLIAMP_SPOTIFY_ID` (set in `~/.env`, kept out of the repo) — see install.sh
  finish notes. Playlists shown are library (created/saved/followed) only.
  Reset auth with `cliamp spotify reset`.
- Config also lives at `~/.config/cliamp/`; `cliamp` rewrites `config.toml` while
  running (e.g. when you cycle visualizers), so a running instance can overwrite
  this checked-in copy. Quit cliamp before editing.
