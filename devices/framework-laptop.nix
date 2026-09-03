{username, ...}: {
  home-manager.users.${username}.imports = [
    ../modules/home-manager/desktop/hyprland/framework-laptop.nix
  ];

  hardware.cpu.amd.updateMicrocode = true;
  services.xserver.videoDrivers = ["amdgpu"];

  services.fprintd.enable = true;

  security.pam.services = {
    sddm.fprintAuth = true;
    login.fprintAuth = true;
    sudo.fprintAuth = true;
  };
}
