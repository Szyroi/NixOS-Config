{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core/default.nix
    ../../modules/common/users/szyroi/nixos/default.nix
    ../../modules/nixos/optional/desktop/default.nix
    inputs.silentSDDM.nixosModules.default
  ];

  programs.silentSDDM = {
    enable = true;
    theme = "rei";
    settings = {
      General = {
        scale = 1.0;
      };
    };
  };

  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/5A043880043860E5";
    fsType = "ntfs3";
    options = ["rw" "uid=1000" "gid=100" "umask=022" "nofail" "x-systemd.device-timeout=2s"];
  };

  fileSystems."/mnt/windows-data" = {
    device = "/dev/disk/by-uuid/C662F2A262F29701";
    fsType = "ntfs3";
    options = ["rw" "uid=1000" "gid=100" "umask=022" "nofail" "x-systemd.device-timeout=2s"];
  };

  services.gnome.gnome-keyring.enable = true;

  hardware.cpu.amd.updateMicrocode = true;

  system.stateVersion = "25.05";
}
