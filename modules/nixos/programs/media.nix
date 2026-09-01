{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
  ];
}
