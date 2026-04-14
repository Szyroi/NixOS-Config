{
  config,
  pkgs,
  lib,
  ...
}: {
  boot.kernelParams = ["nvidia-drm.modeset=1" "nvidia.NVreg_RestrictProfilingToAdminUsers=0"];

  boot.loader = {
    systemd-boot = {
      enable = true;
      consoleMode = "max";
    };
    efi.canTouchEfiVariables = true;
    timeout = 3;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
  };
}
