{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    iotop
    powertop
    btop
    bat
    fzf
    curl
    wget
    unar
    man-pages
    man-pages-posix
    brightnessctl
    playerctl
    wl-clipboard
  ];
}
