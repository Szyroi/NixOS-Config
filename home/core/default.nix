{...}: {
  imports = [
    ./programs/git.nix
    ./programs/zed.nix
    ./programs/zen.nix
    ./programs/kitty.nix
    ./programs/starship.nix
    ./programs/fastfetch.nix
    ./programs/wofi.nix
    ./programs/helix.nix
    ./theme/gtk.nix
    ./shell/sh.nix
  ];
}
