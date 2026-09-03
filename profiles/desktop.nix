{username, ...}: {
  imports = [
    ../modules/nixos/desktop
    ../modules/nixos/desktop/stylix.nix
    ../modules/nixos/hardware
    ../modules/nixos/programs
    ../modules/nixos/services
  ];

  home-manager.users.${username}.imports = [
    ../modules/home-manager/desktop
  ];
}
