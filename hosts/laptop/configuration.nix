{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/default.nix
  ];

  security.pam.services.login.enableGnomeKeyring = true;

  system.stateVersion = "25.05";
}
