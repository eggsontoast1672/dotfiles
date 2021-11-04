#!/bin/sh

# Compositor
compton &

# Wallpaper
#feh --bg-scale ~/Pictures/Backgrounds/given.jpg
nitrogen --restore

# DE/WM
exec i3
