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

    # Graphics Driver
    GBM_BACKEND = "nvidia-drm";

    QT_SCREEN_SCALE_FACTORS = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_ENABLE_HIGHDPI_SCALING = "1";

    JAVA_HOME = "${pkgs.jdk}";
  };

  time.timeZone = "Europe/Berlin";

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
