{
  pkgs,
  lib,
  config,
  username,
  inputs,
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
      activeConfig = "~/.config/quickshell/shell.qml";
    };
  };

  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    defaultSopsFormat = "yaml";
  };

  stylix = {
    enable = true;

    image = builtins.path {path = ./wallpapers/WP2.png;};

    polarity = "dark";

    base16Scheme = {
      # === Hintergrund Ebenen  ===
      base00 = "111113"; # Default Background
      base01 = "1a1b1f"; # Lighter Background
      base02 = "23242a"; # Selection Background
      base03 = "333232"; # Comments, Invisibles, Line Highlighting  (Vercel)

      # === Text Hierarchie ===
      base04 = "8754f2"; # Dark Foreground (Statusbars)
      base05 = "ffffff"; # Default Foreground, Caret, Operators (Vercel text)
      base06 = "f2f6fa"; # Light Foreground
      base07 = "ffffff"; # Light Background (not often used)

      # === Syntax ===
      base08 = "6346ff"; # Variables / Tags (default text color)
      base09 = "43aaf9"; # Numbers, Booleans, Constants 🔵
      base0A = "43aaf9"; # Classes / Data Types 🔵
      base0B = "bf7af0"; # Strings 🟢
      base0C = "43aaf9"; # Support / Regex / Escapes 🔵
      base0D = "8754f2"; # Functions / Methods 🟣
      base0E = "f75f8f"; # Keywords 💗
      base0F = "e61f44"; # Errors / Deprecated 🔴
    };

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
    };
  };

  stylix.targets.hyprland.enable = true;
  stylix.targets.wofi.enable = true;
  stylix.targets.zen-browser.enable = false;
  stylix.targets.starship.enable = true;
  stylix.targets.kitty.enable = true;
  stylix.targets.vesktop.enable = true;

  stylix.targets.hyprland.colors.enable = true;
  stylix.targets.kitty.colors.enable = true;
  stylix.targets.starship.colors.enable = true;
  stylix.targets.wofi.colors.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    easyeffects
    obsidian
    vesktop
    wl-clipboard
    quickshell
    syncthing
    anki
    bitwarden-desktop
  ];

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };

  home.file = {
  };

  programs.home-manager.enable = true;
}
