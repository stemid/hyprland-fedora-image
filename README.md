# Fedora Atomic Hyprland image

This is a bootable image of Fedora Atomic Sway with the latest Hyprland Window Manager built and installed.

The image includes no hyprland config, so you should prepare that in your home directory before switching.

## Install bootc

    rpm-ostree install bootc

Reboot into this new layer.

## Switch to this image

I suggest pinning your current layer as a backup.

    sudo ostree admin pin 0

Then fetch this image and switch to it.

    sudo bootc switch ghcr.io/stemid/fedora-atomic-hyprland:latest

Reboot and select this new layer in Grub to test it.
