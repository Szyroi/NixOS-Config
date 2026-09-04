{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mpv
    ffmpeg
    loupe
    qbittorrent-enhanced
    libreoffice-stable
    gnome-calendar
    gnome-calculator
    ausweisapp
    texliveFull
    seahorse
    parabolic
    cliamp
  ];
}
