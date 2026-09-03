{username, ...}: {
  imports = [
    ../modules/nixos/desktop
    ../modules/nixos/desktop/stylix.nix
    ../modules/nixos/hardware
    ../modules/nixos/hardware/laptop.nix
    ../modules/nixos/programs
    ../modules/nixos/services
    ../modules/nixos/services/power.nix
  ];

  home-manager.users.${username}.imports = [
    ../modules/home-manager/desktop
  ];
}
