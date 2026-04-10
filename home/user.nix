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
    ./tauri.nix
  ];

  programs.tauri = {
    enable = true;
  };

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
    #----Tauri-----
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy
    webkitgtk_6_0
    pkg-config
    openssl
    glib
    gtk3
    librsvg
    wrapGAppsHook4
    bun
    nodejs_25
    cairo
    libsoup_3
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
