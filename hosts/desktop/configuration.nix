{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core/default.nix
    ../../modules/common/users/szyroi/nixos/default.nix
    ../../modules/nixos/optional/desktop/default.nix
    inputs.silentSDDM.nixosModules.default
  ];

  programs.silentSDDM = {
    enable = true;
    theme = "ken";
    settings = {
      "LoginScreen" = {
        background = "/home/szyroi/Pictures/PFP";
      };
    };
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  system.stateVersion = "25.05";
}
