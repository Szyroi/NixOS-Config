{pkgs, ...}: {
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };
  environment.systemPackages = with pkgs; [
    age
    sops
    gnome-keyring
    libsecret
    keepassxc
  ];
}
