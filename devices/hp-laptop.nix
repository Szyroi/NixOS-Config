{username, ...}: {
  home-manager.users.${username}.imports = [
    ../modules/home-manager/desktop/hyprland/hp-laptop.nix
  ];

  hardware.cpu.amd.updateMicrocode = true;
  services.xserver.videoDrivers = ["amdgpu"];
}
