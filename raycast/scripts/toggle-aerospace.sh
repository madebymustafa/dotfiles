#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle AeroSpace
# Optional parameters:
# @raycast.mode silent
# @raycast.icon 🪟
# Documentation:
# @raycast.description Pause or resume AeroSpace tiling. Bound to Hyper+Esc,
# @raycast.description it stays a true two-way toggle because Raycast listens
# @raycast.description even while AeroSpace itself is disabled.

/opt/homebrew/bin/aerospace enable toggle
