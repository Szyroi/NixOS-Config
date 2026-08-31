{...}: {
  imports = [
    ./nix/options.nix
    ./xdg/default.nix
    ./security/default.nix
    ./networking.nix
    ./user.nix
  ];
}
