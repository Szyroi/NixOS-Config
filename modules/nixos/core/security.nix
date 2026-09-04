{pkgs, ...}: {
  security = {
    polkit.enable = true;
    rtkit.enable = true;
    pam.services.hyprlock = {};
  };
  environment.systemPackages = with pkgs; [
    age
    sops
    libsecret
    keepassxc
  ];
}
