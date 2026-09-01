{...}: {
  imports = [
    ./boot.nix
    ./kernel.nix
    ./console.nix
    ./locale.nix
    ./nix-options.nix
    ./security.nix
    ./firmware.nix
    ./networking.nix
    ./user.nix
    ./packages.nix
  ];
}
