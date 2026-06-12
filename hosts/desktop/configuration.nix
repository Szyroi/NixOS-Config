{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core/default.nix
    ../../modules/common/users/szyroi/nixos/default.nix
    ../../modules/nixos/optional/desktop/default.nix
    inputs.silentSDDM.nixosModules.default
    inputs.rux-compiler.nixosModules.default
  ];

  services.rux = {
    enable = true;
    version = "dev";
  };

  programs.silentSDDM = {
    enable = true;
    theme = "rei";
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];

  services.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
    wayland.enable = true;
  };

  security.pam.services.sddm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;

  hardware.cpu.amd.updateMicrocode = true;

  system.stateVersion = "25.05";
}
