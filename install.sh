#!/bin/bash

# Update system first
yay -Syu --noconfirm

# Core packages
yay -S --needed --noconfirm \
    kitty \
    waybar \
    wofi \
    dunst \
    hyprlock \
    hypridle \
    hyprswitch \
    hyprpaper \
    grimblast \
    mako \
    libinput-gestures \
    libinput-tools \
    brightnessctl \
    playerctl \
    pipewire \
    wireplumber \
    gnome-keyring \
    network-manager-applet \
    blueman \
    nm-connection-editor \
    tlp \
    btop \
    micro \
    dolphin \
    kate \
    tailscale \
    steam \
    docker \
    google-chrome \
    discord \
    remmina \
    cifs-utils \
    liquidctl \
    lm_sensors \
    syncthing

# Skip claude-desktop — install manually when you have time
echo "Remember to install claude-desktop manually: yay -S claude-desktop-bin"
