{pkgs, ...}: {
  home.packages = with pkgs; [
    playerctl
    easyeffects
    obsidian
    vesktop
    wl-clipboard
    anki
    yazi
    thunderbird
    nautilus
    kdePackages.kate
    zellij
    colloid-icon-theme
  ];
}
