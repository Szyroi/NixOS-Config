{username, ...}: {
  imports = [
    ../modules/nixos/virtualisation
    ../modules/nixos/programs/development.nix
  ];

  home-manager.users.${username}.imports = [
    ../modules/home-manager/development
  ];
}
