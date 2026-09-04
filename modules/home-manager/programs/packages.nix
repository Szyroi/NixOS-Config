{pkgs, ...}: {
  home.packages = with pkgs; [
    easyeffects
    obsidian
    vesktop
    anki
    yazi
    thunderbird
    nautilus

    # Screenshot Utills
    grim
    slurp
    swappy
  ];
}
