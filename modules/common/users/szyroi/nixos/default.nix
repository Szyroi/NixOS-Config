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
    seahorse
    parabolic
    kew
    pavucontrol
  ];

  language-servers = with pkgs; [
    #Scripting/Conf
    hyprls
    fish-lsp
    bash-language-server
    shfmt
    vscode-json-languageserver #JSON
    taplo #TOML
    yaml-language-server
    systemd-lsp
    lua-language-server
    stylua
    markdown-oxide

    # Web dev
    superhtml
    vscode-css-languageserver
    typescript-language-server
    svelte-language-server
    prettierd

    # Nix
    nixd
    alejandra

    # Java
    jdt-language-server
    google-java-format

    # Assembly
    asm-lsp

    # Haskell
    haskell-language-server

    # C/C++
    clang
    clang-tools

    # Rust
    rust-analyzer
    rustfmt

    # Cmake
    neocmakelsp

    # Python
    pyright
    ruff

    #Typst
    tinymist
  ];

  development = with pkgs; [
    #Nix
    statix
    deadnix

    #Java
    jdk25
    javaPackages.compiler.openjdk25
    maven

    #Assembly
    nasm

    #C/C++
    gcc
    gdb

    # cmake
    cmake

    #Python
    python3
    python313Packages.pip
    virtualenv

    #SQL
    dbeaver-bin
  ];

  allPackages = system ++ media ++ language-servers ++ development;
in {
  environment.systemPackages = allPackages;
}
