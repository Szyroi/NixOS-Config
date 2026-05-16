{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];

    config = {
      hyprland = {
        default = ["hyprland"];
        "org.freedesktop.impl.portal.FileChooser" = ["hyprland"];
        "org.freedesktop.impl.portal.OpenURI" = ["hyprland"];
        "org.freedesktop.impl.portal.Settings" = ["gtk"];
      };
    };
  };

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "text/html" = ["zen-beta.desktop"];
      "text/xml" = ["zen-beta.desktop"];
      "application/xhtml+xml" = ["zen-beta.desktop"];
      "x-scheme-handler/http" = ["zen-beta.desktop"];
      "x-scheme-handler/https" = ["zen-beta.desktop"];
    };
    addedAssociations = {
      "text/plain" = "kate.desktop";
    };
  };
}
