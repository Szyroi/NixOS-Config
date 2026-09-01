{username, ...}: {
  imports = [
    ../modules/nixos/programs/development.nix
  ];

  home-manager.users.${username}.imports = [
    ../modules/home-manager/development
  ];
}
