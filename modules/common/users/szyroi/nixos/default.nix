{
  config,
  lib,
  pkgs,
  ...
}: let
  system = with pkgs; [
    vim
    btop
    htop
    eza
    bat
    fzf
    curl
    wget
    unzip
    aria2
    ripgrep
    kdePackages.ark
    git-filter-repo
    age
    sops
    gnome-keyring
    libsecret
    keepassxc
    webex
    openvpn
    gnome-keyring
  ];

  media = with pkgs; [
    mpv
    ffmpeg
    loupe
    qbittorrent-enhanced
    papers
    libreoffice-fresh
    gnome-calendar
    gnome-calculator
    ausweisapp
    texliveFull
    jetbrains.idea
    jetbrains.clion
    seahorse
    parabolic
    kew
    pavucontrol
  ];

  development = with pkgs; [
    #Nix
    alejandra
    nixd
    statix
    deadnix

    #Java
    jdk
    javaPackages.compiler.openjdk25
    jdt-language-server
    maven

    #Assembly
    nasm

    #C/C++
    gcc
    gdb
    clang
    clang-tools
    cmake

    #Python
    python3
    python313Packages.pip
    virtualenv
    ruff
    pyright

    #SQL
    dbeaver-bin
  ];

  allPackages = system ++ media ++ development;
in {
  environment.systemPackages = allPackages;
}
