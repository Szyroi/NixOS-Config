{
  lib,
  username,
  ...
}: {
  home-manager.users.${username}.imports = [
    ../modules/home-manager/desktop/hyprland/framework-laptop.nix
  ];

  hardware.cpu.amd.updateMicrocode = true;
  services.xserver.videoDrivers = ["amdgpu"];

  boot.kernelPatches = [
    {
      name = "ima";
      patch = null;

      structuredExtraConfig = with lib.kernel; {
        INTEGRITY = yes;

        IMA = yes;
        IMA_LSM_RULES = yes;
        IMA_NG_TEMPLATE = yes;

        CRYPTO_SHA512 = yes;

        IMA_READ_POLICY = yes;

        # Do not enable appraisal/EVM yet.
        #
        # IMA_APPRAISE = yes;
        # EVM = yes;
      };
    }
  ];

  boot.kernelParams = [
    "ima_hash=sha256"
  ];

  services.fprintd.enable = true;
  security.pam.services = {
    sddm.fprintAuth = true;
    login.fprintAuth = true;
    sudo.fprintAuth = true;
  };
}
