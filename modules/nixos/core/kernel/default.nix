{
  pkgs,
  lib,
  config,
  ...
}: {
  boot.kernelParams = ["nvidia-drm.modeset=1" "nvidia.NVreg_RestrictProfilingToAdminUsers=0"];
}
