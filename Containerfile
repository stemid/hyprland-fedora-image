FROM quay.io/fedora/fedora-sway-atomic:41

RUN dnf -y install \
    curl git tmux vim \
    ninja-build cmake meson gcc-c++ libxcb-devel libX11-devel pixman-devel \
    wayland-protocols-devel cairo-devel pango-devel wayland-devel libdrm-devel \
    libxkbcommon-devel systemd-devel libseat-devel mesa-libEGL-devel \
    libinput-devel xcb-util-wm-devel xorg-x11-server-Xwayland-devel \
    mesa-libgbm-devel xcb-util-renderutil-devel \
    hwdata libdisplay-info-devel libliftoff-devel 'dnf5-command(builddep)' && \
    dnf -y builddep hyprland && \
    rm -rf ./Hyprland && git clone -b v0.45.2 https://github.com/hyprwm/Hyprland && \
    pushd Hyprland && mkdir -p --mode=0755 /var/usrlocal && \
    mkdir -p --mode=0755 /var/usrlocal/{include,share,bin,etc,games,lib,man,sbin,src} && \
    meson _build && ninja -C _build && ninja -C _build install && \
    dnf -y history undo 2 && dnf -y install hyprland hyprpaper && \
    cp example/hyprland.desktop /usr/share/wayland-sessions/ && \
    cp /usr/local/bin/Hyprland /usr/bin/Hyprland && \
    dnf -y autoremove && ostree container commit
