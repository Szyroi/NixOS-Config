{
  config,
  pkgs,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core/default.nix
    ../../modules/common/users/szyroi/nixos/default.nix
    ../../modules/nixos/optional/hardware/nvidia.nix
  ];

  security.pam.services.login.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;

  fileSystems."/run/media/${username}/windows3" = {
    device = "/dev/nvme0n1p3";
    fsType = "ntfs3";
    options = [
      "nofail"
      "x-systemd.automount"
      "x-systemd.device-timeout=2s"
      "uid=1000"
      "gid=100"
      "dmask=000"
      "fmask=000"
    ];
  };

  fileSystems."/run/media/${username}/windows5" = {
    device = "/dev/nvme0n1p5";
    fsType = "ntfs3";
    options = [
      "nofail"
      "x-systemd.automount"
      "x-systemd.device-timeout=2s"
      "uid=1000"
      "gid=100"
      "dmask=000"
      "fmask=000"
    ];
  };

  system.stateVersion = "25.05";
}
