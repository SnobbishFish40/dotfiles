#!/bin/bash

OVERRIDE="$HOME/.config/alacritty/font/font-size-override.toml"

# Count connected monitors
MONITOR_COUNT=$(xrandr --query | grep -c " connected")

if [ "$MONITOR_COUNT" -gt 1 ]; then
    ln -sf "$HOME/.config/alacritty/font/font-monitor.toml" "$OVERRIDE"
else
    ln -sf "$HOME/.config/alacritty/font/font-laptop.toml" "$OVERRIDE"
fi
