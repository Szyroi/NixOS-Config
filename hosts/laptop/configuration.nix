{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core/default.nix
    ../../modules/common/users/szyroi/nixos/default.nix
    ../../modules/nixos/optional/hardware/amd.nix
  ];

  security.pam.services.login.enableGnomeKeyring = true;

  system.stateVersion = "25.05";
}
