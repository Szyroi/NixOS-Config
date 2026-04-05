{
  pkgs,
  config,
  lib,
  ...
}: {
  gtk = {
    enable = true;
    theme = null;
    iconTheme = null;
    font = null;
    gtk3.extraConfig."gtk-application-prefer-dark-theme" = 1;
    gtk4.extraConfig."gtk-application-prefer-dark-theme" = 1;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = null;
  };

  home.packages = with pkgs; [];
}
