{
  config,
  lib,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true; # Important for Wayland/Hyprland
    nvidiaSettings = true; # nvidia-settings App
    open = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      offload.enable = true; # for Hybrid GPU Offloading
      amdgpuBusId = "PCI:11:0:0"; # AMD iGPU
      nvidiaBusId = "PCI:01:0:0"; # NVIDIA GPU
    };
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    steam-hardware.enable = true;
  };
}
