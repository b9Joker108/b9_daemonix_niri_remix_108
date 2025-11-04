#!/bin/bash

# Niri core components

DESKTOP_ENV_PACKAGES=(
  lightdm-gtk
  wofi
  niri
  dunst
  ddcutil
  nautilus
  gvfs
  gvfs-smb
)

dnf install -y "${DESKTOP_ENV_PACKAGES[@]}"

# Removed RPMS

RM_PACKAGES=(
  waybar
)

dnf remove -y "${RM_PACKAGES[@]}"

# Installed RPMS

PACKAGES=(
  distrobox
  fastfetch
  libavcodec-freeworld
  btop
  ghostty
)

dnf install --setopt=install_weak_deps=False -y "${PACKAGES[@]}"