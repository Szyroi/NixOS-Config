{
  pkgs,
  config,
  inputs,
  username,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";

  imports = [
    ../../modules/common/users/szyroi/home/default.nix
    ../core/default.nix
    ../optional/desktop/default.nix
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;
    configDir = ../core/ags;
  };

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFormat = "yaml";
  };

  stylix.targets = {
    hyprland.enable = true;
    wofi.enable = true;
    starship.enable = true;
    kitty.enable = true;
    vesktop.enable = true;
    helix.enable = false;
    gtk = {
      enable = false;
      colors.enable = false;
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

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    GTK_USE_PORTAL = "1";
  };

  programs.home-manager.enable = true;
}
