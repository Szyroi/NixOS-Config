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
    man-pages
    man-pages-posix
  ];
}
