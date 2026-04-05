{
  pkgs,
  config,
  lib,
  ...
}: {
  gtk = {
    enable = true;
    iconTheme = {
      name = lib.mkDefault "Papirus-Dark";
      package = lib.mkDefault pkgs.papirus-icon-theme;
    };

    gtk4.theme = null;
    gtk3.extraConfig."gtk-application-prefer-dark-theme" = 1;
    gtk4.extraConfig."gtk-application-prefer-dark-theme" = 1;
  };

  qt = {
    enable = true;
    platformTheme.name = lib.mkDefault "gtk";
  };

  home.packages = with pkgs; [papirus-icon-theme];
}
