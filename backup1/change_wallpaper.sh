#!/bin/bash

# Path to your wallpaper folder
WALLPAPER_DIR="/home/mai/Pictures/wallpp/"

# Function to set the wallpaper using qdbus
set_wallpaper() {
    qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'string:desktops().forEach(d => { d.wallpaperPlugin = "org.kde.image"; d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General"); d.writeConfig("Image", "file://'"$1"'") })'
}

# Get list of wallpapers
wallpapers=$(ls "$WALLPAPER_DIR")

# Display wallpapers using rofi
selected_wallpaper=$(echo "$wallpapers" | rofi -dmenu -i -p "")

# If a wallpaper is selected, set it as the wallpaper
if [ -n "$selected_wallpaper" ]; then
    wallpaper_path="$WALLPAPER_DIR/$selected_wallpaper"
    set_wallpaper "$wallpaper_path"
fi

