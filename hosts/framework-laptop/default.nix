{
  imports = [
    ./hardware-configuration.nix

    ../../devices/framework-laptop.nix

    ../../profiles/base.nix
    ../../profiles/laptop.nix
    ../../profiles/workstation.nix
    ../../profiles/gaming.nix
  ];

  networking.hostName = "framework";

  system.stateVersion = "26.11";
}
