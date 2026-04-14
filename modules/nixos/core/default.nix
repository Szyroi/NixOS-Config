{...}: {
  imports = [
    ./core.nix
    ./nix.nix
    ./boot.nix
    ./nvidia.nix
    ./networking.nix
    ./services.nix
    ./desktop.nix
    ./user.nix
    ../../packages/default.nix
    ./stylix.nix
  ];
}
