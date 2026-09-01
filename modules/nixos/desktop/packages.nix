{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kdePackages.ark
    thunar-archive-plugin
    unar
    networkmanagerapplet
    quickshell
    pavucontrol
  ];
}
