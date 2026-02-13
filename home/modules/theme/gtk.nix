{
  pkgs,
  config,
  lib,
  ...
}: {
  gtk = {
    enable = true;

    theme = {
      name = lib.mkDefault "Colloid-Dark";
      package = lib.mkDefault pkgs.colloid-gtk-theme;
    };

    iconTheme = {
      name = lib.mkDefault "Papirus-Dark";
      package = lib.mkDefault pkgs.papirus-icon-theme;
    };

    font = {
      name = lib.mkDefault "Inter";
      package = lib.mkDefault pkgs.inter;
      size = 12;
    };

    gtk3.extraConfig."gtk-application-prefer-dark-theme" = 1;
    gtk4.extraConfig."gtk-application-prefer-dark-theme" = 1;
  };

  qt = {
    enable = true;
    platformTheme.name = lib.mkDefault "gtk";
    style = {
      name = lib.mkDefault "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  home.packages = with pkgs; [adw-gtk3];
}
