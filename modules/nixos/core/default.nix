{...}: {
  imports = [
    ./core.nix
    ./nix.nix
    ./boot.nix
    ./networking.nix
    ./services.nix
    ./desktop.nix
    ./user.nix
    ./stylix.nix
  ];
}
