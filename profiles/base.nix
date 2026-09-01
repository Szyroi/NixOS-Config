{username, ...}: {
  imports = [
    ../modules/nixos/core
  ];

  home-manager.users.${username}.imports = [
    ../modules/home-manager/core
    ../modules/home-manager/programs
  ];
}
