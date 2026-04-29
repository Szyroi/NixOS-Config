{pkgs, ...}: {
  boot = {
    kernelParams = [];
    kernelPackages = pkgs.linuxPackages_latest;
    kernel = {
      sysctl = {
        "net.ipv4.tcp_syncookies" = true;
        "vm.swappiness" = 10;
        "kernel.sysrq" = 1;
      };
    };
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      timeout = 3;
    };
  };

  console = {
    keyMap = "de";
    font = "ter-u32b";
    earlySetup = true;
    packages = with pkgs; [terminus_font];
  };
}
