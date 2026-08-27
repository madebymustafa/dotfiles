# AeroSpace

i3-style tiling window manager for macOS. Config lives here as `aerospace.toml`
(symlinked to `~/.config/aerospace/aerospace.toml`).

Hyper = Caps Lock (Raycast Hyper Key) = Cmd+Ctrl+Opt+Shift held together.
Every "Hyper + ..." combo below can be pressed either way.

## Focus & Movement

- Alt + H / J / K / L ............ focus left / down / up / right
- Alt + Shift + H / J / K / L .... move window left / down / up / right
- Alt + Shift + Arrow ............ join window with neighbor in that direction
- Alt + Tab ...................... jump back to previous workspace
- Alt + Shift + Tab .............. move whole workspace to next monitor

## Layouts & Resizing

- Alt + / ........................ cycle tiling layouts
- Alt + , ........................ cycle accordion layouts
- Alt + Shift + - or = ........... shrink / grow window (smart)
- Alt + Shift + Space ............ toggle floating <-> tiling (detach window)
- Hyper + T ...................... same float toggle (detach/re-attach window)
- Cmd + Ctrl + F ................. fullscreen (hijacks Apple's native-fullscreen
                                   shortcut safely - no more Space-stacking)
- Hyper + Esc .................... pause/resume AeroSpace entirely
                                   (Raycast script command - see ../raycast/;
                                   while paused Raycast & mouse rule everything)

## Workspaces

- Alt + number/letter ............ switch to workspace
- Alt + Shift + number/letter .... send focused window to workspace

### The Map

  1-9  generic scratch spaces
  B    Browser      (Arc, Zen)
  C    Code         (VS Code, Cursor, Codex)
  D    Design       (Figma)
  E    Email        (Spark, Apple Mail)
  F    Finder
  M    Music
  N    Notes        (Apple Notes, Notion)
  P    Photoshop    (Adobe Photoshop)
  R    Lightroom    (Lightroom Classic)
  S    Slack
  T    Terminal     (WezTerm)
  V    Video editing (free slot)

Examples:
  Alt + T ........ go to terminal
  Alt + Shift + C  throw this window to Code

## Modes

Modes are "sub-keyboards": enter once, keys behave differently, leave with Esc.

Enter Resize mode with   Cmd + Ctrl + R
    H / L ......... narrower / wider
    J / K ......... taller / shorter
    B ............. balance sizes
    - / = ......... smart shrink / grow
    Esc or Enter .. exit

Enter Service mode with  Alt + Shift + ;
    Esc ........... reload config (+ exit)
    R ............. reset layout
    F ............. toggle floating
    Backspace ..... close all windows except current

## Mouse Behavior

The mouse never moves on its own. Focus changes, workspace switches and
monitor switches leave the cursor exactly where you left it.

## Good to Know

- NEVER use macOS native fullscreen (green button / Ctrl+Cmd+F). It stacks a
  Space on top of the tiling and causes overlapping windows.
  Use Cmd + Ctrl + F instead.
- New windows auto-fly to their letter's workspace via `on-window-detected`.
  Unrouted apps open wherever you currently are.
- Workspaces 1-9 B C D E F M N P R S T V always stay alive, even when empty.
- The pause chord (Hyper + Esc) is a Raycast script command (`../raycast/`),
  not an AeroSpace binding and not a hotkey daemon. Raycast listens even while
  AeroSpace is disabled, which makes it a true two-way toggle - the one thing
  AeroSpace can't do itself ("key events are not intercepted when disabled").
  Don't also bind it inside `aerospace.toml`: two listeners on one chord fire
  twice and cancel out.
- AeroSpace does not auto-start (start-at-login = false); run open -a AeroSpace manually when you want tiling.
