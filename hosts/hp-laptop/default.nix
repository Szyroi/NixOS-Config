{...}: {
  imports = [
    ./hardware-configuration.nix

    ../../devices/hp-laptop.nix

    ../../profiles/base.nix
    ../../profiles/laptop.nix
    ../../profiles/workstation.nix
  ];

  system.stateVersion = "25.05";
}
