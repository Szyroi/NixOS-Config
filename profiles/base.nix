{username, ...}: {
  imports = [
    ../modules/nixos/core
    ../modules/nixos/core/stylix.nix
  ];

  home-manager.users.${username}.imports = [
    ../modules/home-manager/core
    ../modules/home-manager/programs
  ];
}
