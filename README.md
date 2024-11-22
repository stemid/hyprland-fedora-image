# Fedora Atomic Hyprland image

This is a bootable image of Fedora Atomic Sway with the latest Hyprland Window Manager built and installed.

The image includes no hyprland config, so you should prepare that in your home directory before switching.

## Install bootc

On any Fedora Atomic 41 system you can do this.

    rpm-ostree install bootc

Reboot into this new layer.

## Switch to this image

I suggest pinning your current layer as a backup.

    sudo ostree admin pin 0

Then fetch this image and switch to it.

    sudo bootc switch ghcr.io/stemid/fedora-atomic-hyprland:latest

Reboot and select this new layer in Grub to test it.

# Disclaimer

This image installs hyprland from Fedora packages, which is only a couple releases behind. Then it builds the latest Hyprland from git source, and overwrites the ``/usr/bin/Hyprland`` binary with the newly built one.

If I knew more about Atomic images I think it would be smarter to install only the built Hyprland under /usr/local, but I couldn't figure out how to install something in a safe path that would be retained after boot. I don't think it's a good idea to have the Hyprland package installed and modify it the way I do.
