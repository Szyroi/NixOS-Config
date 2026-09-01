{...}: {
  imports = [
    ./boot.nix
    ./kernel.nix
    ./console.nix
    ./locale.nix
    ./nix-options.nix
    ./security.nix
    ./networking.nix
    ./user.nix
  ];
}
