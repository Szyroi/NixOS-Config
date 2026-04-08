{
  config,
  pkgs,
  username,
  ...
}: let
  user = config.users.users.${username};
  uid = toString user.uid;
  gid = toString config.users.groups.${user.group}.gid;
in {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/default.nix
  ];

  fileSystems."/mnt/windows3" = {
    device = "/dev/nvme0n1p3";
    fsType = "ntfs3";
    options = [
      "nofail"
      "x-systemd.automount"
      "x-systemd.device-timeout=2s"
      "uid=${uid}"
      "gid=${gid}"
      "dmask=027"
      "fmask=137"
    ];
  };

  fileSystems."/mnt/windows5" = {
    device = "/dev/nvme0n1p5";
    fsType = "ntfs3";
    options = [
      "nofail"
      "x-systemd.automount"
      "x-systemd.device-timeout=2s"
      "uid=${uid}"
      "gid=${gid}"
      "dmask=027"
      "fmask=137"
    ];
  };

  system.stateVersion = "25.05";
}
