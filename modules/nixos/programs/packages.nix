{
  inputs,
  pkgs,
  ...
}: let
  system = with pkgs; [
    vim
    btop
    iotop
    powertop
    man-pages
    man-pages-posix
    bat
    fzf
    curl
    wget
    kdePackages.ark
    thunar-archive-plugin
    age
    sops
    gnome-keyring
    libsecret
    keepassxc
    openvpn
    steamtinkerlaunch
    unar
    tree-sitter
    networkmanagerapplet
    quickshell
    inputs.sqldeveloper.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  media = with pkgs; [
    mpv
    ffmpeg
    loupe
    qbittorrent-enhanced
    libreoffice-fresh
    gnome-calendar
    gnome-calculator
    ausweisapp
    texliveFull
    seahorse
    parabolic
    cliamp
    pavucontrol
  ];
in {
  environment.systemPackages = system ++ media;
}
