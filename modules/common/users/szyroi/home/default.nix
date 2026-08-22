{pkgs, ...}: {
  home.packages = with pkgs; [
    playerctl
    easyeffects
    obsidian
    vesktop
    wl-clipboard
    syncthing
    anki
    # bitwarden-desktop
    yazi
    thunderbird
    nautilus
    kdePackages.kate
    zellij
    colloid-icon-theme
  ];
}
