#FROM quay.io/fedora/fedora-sway-atomic:latest
FROM quay.io/fedora/fedora-coreos:testing

RUN dnf -y install \
    curl git tmux \
    # Hyprland build dependencies
    ninja-build cmake meson gcc-c++ libxcb-devel libX11-devel pixman-devel \
    wayland-protocols-devel cairo-devel pango-devel wayland-devel libdrm-devel \
    libxkbcommon-devel systemd-devel libseat-devel mesa-libEGL-devel \
    libinput-devel xcb-util-wm-devel xorg-x11-server-Xwayland-devel \
    mesa-libgbm-devel xcb-util-renderutil-devel \
    hwdata libdisplay-info-devel libliftoff-devel 'dnf5-command(builddep)' && \
    dnf -y builddep hyprland && \
    pushd /root && curl -LO https://github.com/hyprwm/Hyprland/releases/latest/download/source-v0.45.2.tar.gz && \
    sudo tar -xvaf source-v0.45.2.tar.gz && pushd /root/hyprland-source && \
    sudo meson _build && sudo ninja -C _build && sudo ninja -C _build install && \
    sudo cp example/hyprland.desktop /usr/share/wayland-sessions/
