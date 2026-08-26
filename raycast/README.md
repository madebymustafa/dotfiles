# Raycast

Script commands Raycast loads directly from this folder. Nothing here is
stowed - Raycast points at `scripts/` in place, since the repo already sits
at a stable path.

## Setup

1. Raycast Settings → Extensions → Script Commands → Add Directories…
2. Select `~/dotfiles/raycast/scripts`
3. Open the command → record a hotkey

## Toggle AeroSpace

Runs `aerospace enable toggle`. Bound to Hyper + Esc it is a true two-way
toggle: Raycast keeps listening even while AeroSpace is disabled, which no
in-app binding can do. Keep the chord out of `../aerospace/aerospace.toml` -
two listeners on one chord fire twice and cancel each other out.
