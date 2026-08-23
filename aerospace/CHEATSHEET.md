# AeroSpace Cheatsheet

Hyper = Caps Lock (Raycast Hyper Key) = Cmd+Ctrl+Opt+Shift held together.
Every "Hyper + ..." combo can be pressed either way.

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
- Alt + Shift + F ................ fullscreen (AeroSpace-safe, stays tiled)
- Hyper + Esc .................... pause/resume AeroSpace entirely
                                   (works both directions; while paused:
                                   Raycast & mouse rule everything)

## Workspaces

- Alt + number/letter ............ switch to workspace
- Hyper + number/letter .......... send focused window to workspace

### The Map

  1-9  generic scratch spaces
  B    Browser      (Arc, Zen)
  C    Code         (VS Code, Cursor)
  D    Design       (Figma)
  E    Email        (Spark, Apple Mail)
  F    Finder
  M    Music
  S    Slack
  T    Terminal     (WezTerm)
  V    Video editing (free slot)

Examples:
  Alt + T ........ go to terminal
  Hyper + C ...... throw this window to Code

## Modes

Modes are "sub-keyboards": enter once, keys behave differently, leave with Esc.

Enter Resize mode with   Hyper + R
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

Enter Apps mode with     Alt + Shift + Enter
    W ............. open WezTerm

## App Launchers (Cmd + Opt + key)

  W ... WezTerm          Z ... Zen            S ... Slack
  M ... Music            F ... Finder         Q ... QuickTime Player

## Mouse Behavior

Mouse follows focus: whenever focus changes, the cursor moves to the center
of the newly focused window / monitor. No hunting for the pointer.

## Inside the Terminal (Neovim + tmux)

- Ctrl + H / J / K / L .......... move between vim splits AND tmux panes
- Ctrl + \ ....................... go to previously used pane/split

Same home-row keys as AeroSpace: Ctrl navigates inside the terminal world,
Alt navigates between OS windows.

## Good to Know

- NEVER use macOS native fullscreen (green button / Ctrl+Cmd+F). It stacks a
  Space on top of the tiling and causes overlapping windows.
  Use Alt + Shift + F instead.
- New windows auto-fly to their letter's workspace (see map above).
  Unrouted apps open wherever you currently are.
- Workspaces 1-9 B C D E F M S T V always stay alive, even when empty.
- The pause key (Hyper + Esc) is powered by the skhd daemon, which listens
  even while AeroSpace itself is paused - that's what makes it a true toggle.
- Config lives at ~/dotfiles/aerospace/aerospace.toml
  (symlinked to ~/.config/aerospace/aerospace.toml).
  Hotkey daemon config: ~/dotfiles/skhd/skhdrc
    (symlinked to ~/.config/skhd/skhdrc).
  Reload after editing: Service mode then Esc, or run: aerospace reload-config
