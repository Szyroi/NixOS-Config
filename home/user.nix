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
    ./core/default.nix
    ../modules/common/users/szyroi/home/default.nix
  ];

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
    gtk = {
      enable = true;
      colors.enable = true;
    };
    qt = {
      enable = true;
    };

    obsidian = {
      enable = true;
      colors.enable = true;
    };

    zed = {
      enable = false;
      colors.enable = false;
    };
    zen-browser.enable = false;
  };

  services.gnome-keyring.enable = true;

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  programs.home-manager.enable = true;
}
