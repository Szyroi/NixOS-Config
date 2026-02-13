{...}: {
  imports = [
    ./core.nix
    ./nix.nix
    ./boot.nix
    ./hardware.nix
    ./networking.nix
    ./services.nix
    ./desktop.nix
    ./users.nix
    ./packages.nix
  ];
}
