{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../devices/desktop.nix
    ../../profiles/base.nix
    ../../profiles/desktop.nix
    ../../profiles/workstation.nix
    ../../profiles/gaming.nix
  ];

  networking.hostName = "nixos";

  programs.qylock = {
    enable = true;
    theme = "sword";
    sddm.enable = true;
    quickshell.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  system.stateVersion = "25.05";
}
