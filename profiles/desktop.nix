{username, ...}: {
  imports = [
    ../modules/nixos/desktop
    ../modules/nixos/hardware/graphics.nix
    ../modules/nixos/programs/desktop.nix
    ../modules/nixos/services/desktop.nix
    ../modules/nixos/services/display-manager.nix
  ];

  home-manager.users.${username}.imports = [
    ../modules/home-manager/desktop
    ../modules/home-manager/desktop/hyprland/desktop.nix
  ];
}
