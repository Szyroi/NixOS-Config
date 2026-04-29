{...}: {
  imports = [
    ./bootloader/default.nix
    ./hardware/amd.nix
    ./core/core.nix
    ./displaymanager/displaymanager.nix
  ];
}
