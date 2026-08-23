# skhd

Hotkey daemon. One rule in `skhdrc`:

    cmd + ctrl + alt + shift - escape : aerospace enable toggle

This is the AeroSpace pause/resume key (Hyper + Esc). It lives here instead
of the aerospace config because AeroSpace cannot hear its own bindings while
disabled - an always-running daemon makes it a true toggle.

Runs as a launchd service (`skhd --start-service`). Requires Accessibility
and Input Monitoring permissions.
