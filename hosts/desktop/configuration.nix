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
    theme = "rei";
  };

  services.gnome.gnome-keyring.enable = true;

  hardware.cpu.amd.updateMicrocode = true;

  system.stateVersion = "25.05";
}
