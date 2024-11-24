FROM quay.io/fedora/fedora-sway-atomic:41

RUN dnf -y install \
    curl git tmux vim hyprpaper hyprcursor aquamarine 'dnf5-command(builddep)' && \
    dnf -y builddep hyprland && \
    rm -rf ./Hyprland && git clone -b v0.45.2 https://github.com/hyprwm/Hyprland && \
    pushd ./Hyprland && \
    meson setup --prefix=/usr _build && ninja -C _build && ninja -C _build install && \
    cp example/hyprland.desktop /usr/share/wayland-sessions/ && \
    popd && rm -rf ./Hyprland && \
    dnf -y history undo last && dnf -y autoremove && ostree container commit
