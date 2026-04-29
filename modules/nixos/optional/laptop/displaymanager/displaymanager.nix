{lib, ...}: {
  services.displayManager.sddm = {
    enable = true;
    theme = "silent";
    wayland.enable = lib.mkForce true;
  };
}
