{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.sessionVariables = {
    # Wayland Core
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

    # Desktop Session
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";

    JAVA_HOME = "${pkgs.jdk}";
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  time.timeZone = "Europe/Berlin";
  console.keyMap = "de";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
    };
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
        kdePackages.fcitx5-qt
      ];
    };
  };
}
