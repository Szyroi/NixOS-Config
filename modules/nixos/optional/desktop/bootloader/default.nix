{pkgs, ...}: {
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "ondemand";
  };
  hardware.cpu.amd.updateMicrocode = true;
  services.fstrim.enable = true;
  services.earlyoom.enable = true;

  programs.coolercontrol.enable = true;

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
  };

  boot = {
    kernelParams = ["nvidia-drm.modeset=1" "pcie_aspm=off"];
    kernelPackages = pkgs.linuxPackages_latest;
    kernel = {
      sysctl = {
        "kernel.sysrq" = 1;
        "net.ipv4.tcp_syncookies" = true;
        "vm.swappiness" = 100;
        "vm.vfs_cache_pressure" = 50;
        "vm.dirty_background_ratio" = 10;
        "vm.dirty_ratio" = 30;
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

  environment.systemPackages = with pkgs; [
    htop
    btop
    nvtopPackages.nvidia
    iotop # I/O monitor
    powertop # Power consumption analyzer
  ];
}
