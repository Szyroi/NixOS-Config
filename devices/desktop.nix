{
  pkgs,
  username,
  ...
}: {
  home-manager.users.${username}.imports = [
    ../modules/home-manager/desktop/hyprland/desktop.nix
  ];

  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
  ];

  hardware.cpu.amd.updateMicrocode = true;
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    nvidiaPersistenced = false;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
  };

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
    "nvidia.NVreg_EnableGpuFirmware=0"
    "pcie_aspm=off"
    "nvme_core.default_ps_max_latency_us=0"
  ];
}
