{lib, ...}: {
  services.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
    wayland.enable = lib.mkForce true;
  };
}
