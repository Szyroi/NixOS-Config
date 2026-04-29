{...}: {
  imports = [
    ./bootloader/default.nix
    ./hardware/nvidia.nix
    ./core/core.nix
    ./displaymanager/displaymanager.nix
  ];
}
