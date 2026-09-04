{
  pkgs,
  lib,
  ...
}: {
  gtk = {
    enable = true;
    iconTheme = {
      name = lib.mkDefault "Colloid-Dark";
      package = lib.mkDefault pkgs.colloid-icon-theme;
    };

    gtk3.extraConfig."gtk-application-prefer-dark-theme" = 1;
    gtk4.extraConfig."gtk-application-prefer-dark-theme" = 1;
  };

  qt = {
    enable = true;
    platformTheme.name = lib.mkDefault "gtk";
  };

  home.packages = with pkgs; [
    adwaita-icon-theme
  ];
}
