{pkgs, ...}: {
  home.packages = with pkgs; [
    gcr
    playerctl
    easyeffects
    obsidian
    vesktop
    wl-clipboard
    quickshell
    syncthing
    anki
    bitwarden-desktop
    yazi
    thunderbird
    element-desktop
    pawn-appetit
    nautilus
    rustfmt
    rust-analyzer
    clippy
  ];
}
