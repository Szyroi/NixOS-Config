{
  imports = [
    ./sops.nix

    ./packages.nix
    ./packages.nix

    ./programs/git.nix
    ./programs/zed.nix
    ./programs/zen.nix
    ./programs/kitty.nix
    ./programs/starship.nix
    ./programs/fastfetch.nix
    ./programs/wofi.nix
    ./programs/helix.nix
    ./programs/hyprpaper.nix

    ./theme/gtk.nix
    ./theme/theme.nix

    ./shell/sh.nix
  ];
}
