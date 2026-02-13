{
  config,
  pkgs,
  username,
  ...
}: let
  user = config.users.users.${username};
  uid = user.uid;
  gid = config.users.groups.${user.group}.gid;
in {
  imports = [
    ./hardware-configuration.nix

    ../../system/default.nix
  ];

  fileSystems."/mnt/windows3" = {
    device = "/dev/nvme0n1p3";
    fsType = "ntfs3";
    options = [
      "nofail"
      "x-systemd.automount"
      "x-systemd.device-timeout=2s"
      "uid=${toString uid}"
      "gid=${toString gid}"
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
      "uid=${toString uid}"
      "gid=${toString gid}"
      "dmask=027"
      "fmask=137"
    ];
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  system.stateVersion = "25.05";
}
