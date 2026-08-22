{...}: {
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true; # Important for Wayland/Hyprland
    nvidiaSettings = true; # nvidia-settings App
    open = false;
    nvidiaPersistenced = false;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    steam-hardware.enable = true;
  };
}
