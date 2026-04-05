{
  pkgs,
  lib,
  config,
  inputs,
  username,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";

  imports = [
    ./modules/default.nix
  ];

  programs = {
    quickshell = {
      enable = true;
      activeConfig = "${config.xdg.configHome}/quickshell/shell.qml";
    };
  };

  sops = {
    defaultSopsFile = ./../secrets/secrets.yaml;
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFormat = "yaml";
  };

  stylix.targets = {
    hyprland.enable = true;
    wofi.enable = true;
    starship.enable = true;
    kitty.enable = true;
    vesktop.enable = true;

    obsidian = {
      enable = true;
      colors.enable = true;
    };

    zen-browser.enable = false;
  };

  home.packages = with pkgs; [
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
  ];

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  programs.home-manager.enable = true;
}
