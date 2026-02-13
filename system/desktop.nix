{
  config,
  pkgs,
  lib,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --asterisks -t -c ${config.programs.hyprland.package}/bin/start-hyprland";
        user = "greeter";
      };
    };
  };

  users.users.greeter = {
    isSystemUser = true;
    group = "greeter";
    home = "/var/lib/greeter";
    createHome = true;
  };
  users.groups.greeter = {};

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = ["hyprland" "gtk"];
        "org.freedesktop.impl.portal.FileChooser" = ["gtk"];
      };
    };
  };

  xdg.mime = {
    enable = true;
    addedAssociations = {
      "text/plain" = "kate.desktop";
    };
  };

  programs = {
    firefox.enable = true;
    thunar.enable = true;
    xfconf.enable = true;
    hyprland = {
      enable = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [protonup-ng];
    };
    nix-ld.enable = true;
  };

  programs.dconf.enable = true;
}
