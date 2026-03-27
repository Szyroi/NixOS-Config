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
      activeConfig = "~/.config/quickshell/shell.qml";
    };

    helix = {
      enable = true;

      settings = {
        editor = {
          line-number = "relative";
          mouse = true;
          auto-save = true;
          bufferline = "multiple";
          color-modes = true;
          auto-pairs = true;

          file-picker = {
            hidden = false;
          };
          lsp = {
            display-messages = true;
            display-inlay-hints = true;
          };
        };

        keys.normal = {
          "C-s" = [":format" ":write"];
        };
      };

      languages = {
        language = [
          {
            name = "java";
            auto-format = true;
            language-servers = ["jdtls"];
          }
          {
            name = "typst";
            auto-format = true;
            language-servers = ["tinymist"];
          }
          {
            name = "nix";
            auto-format = true;
            language-servers = ["nixd"];
          }
        ];
      };
    };
  };

  sops = {
    defaultSopsFile = ./../secrets/secrets.yaml;
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    defaultSopsFormat = "yaml";
  };

  stylix.targets.hyprland.enable = true;
  stylix.targets.wofi.enable = true;
  stylix.targets.zen-browser.enable = false;
  stylix.targets.starship.enable = true;
  stylix.targets.kitty.enable = true;
  stylix.targets.vesktop.enable = true;
  stylix.targets.obsidian.colors.enable = true;

  stylix.targets.hyprland.colors.enable = true;
  stylix.targets.kitty.colors.enable = true;
  stylix.targets.starship.colors.enable = true;
  stylix.targets.wofi.colors.enable = true;
  stylix.targets.obsidian.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
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
    tmux
    #stoat-desktop
    element-desktop
  ];

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  fonts.fontconfig.enable = true;

  xdg.portal.enable = lib.mkForce false;

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };

  home.file = {
  };

  programs.home-manager.enable = true;
}
