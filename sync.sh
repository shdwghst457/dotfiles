#!/bin/bash

# Copy latest configs
cp ~/.config/hypr/hyprland.lua ~/dotfiles/
cp ~/.config/hypr/hyprlock.conf ~/dotfiles/
cp ~/.config/hypr/hypridle.conf ~/dotfiles/
cp ~/.config/mako/config ~/dotfiles/mako-config
cp ~/.config/kitty/kitty.conf ~/dotfiles/ 2>/dev/null

# Commit and push
cd ~/dotfiles
git add .
git commit -m "sync $(date '+%Y-%m-%d %H:%M')"
git push

echo "Dotfiles synced to GitHub"
