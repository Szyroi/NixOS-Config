{...}: {
  imports = [
    ./nix/options.nix
    ./zswap/default.nix
    ./xdg/default.nix
    ./security/default.nix
    ./networking.nix
    ./services.nix
    ./desktop.nix
    ./user.nix
    ./stylix.nix
  ];
}
