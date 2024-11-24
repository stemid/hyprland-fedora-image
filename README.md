# Fedora Atomic Hyprland image

This is a bootable image of Fedora Atomic Sway with the latest Hyprland Window Manager built and installed.

The image includes no hyprland config, so you should prepare that in your home directory before switching.

## Install bootc

On any Fedora Atomic 41 system you can do this.

    rpm-ostree install bootc

Reboot into this new layer.

    systemctl reboot

## Switch to my Hyprland image

I suggest pinning your current layer as a backup.

    sudo ostree admin pin 0

Then fetch this image and switch to it.

    sudo bootc switch ghcr.io/stemid/fedora-atomic-hyprland:latest

Reboot and select this new layer in Grub to test it.

## Build it yourself

You can also build this yourself on your local computer by running buildah, push it to a registry of your choice, and boot from it.

    buildah bud -f Containerfile -t hyprland-fedora-image .

To build the latest Hyprland version edit the Containerfile on the line with ``git clone -b v0.45.2``, I won't make any effort to keep this repo updated.
