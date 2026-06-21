{
  inputs,
  pkgs,
  ...
}: let
  system = with pkgs; [
    vim
    btop
    man-pages
    man-pages-posix
    bat
    fzf
    curl
    wget
    unzip
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
    inputs.sqldeveloper.packages.${pkgs.system}.default
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
    vscode-json-languageserver # JSON
    taplo # TOML
    yaml-language-server
    systemd-lsp

    # Lua
    lua-language-server
    stylua

    # Markdown
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
    clippy

    # Cmake
    neocmakelsp
    cmake-format

    # Python
    pyright
    ruff

    #Typst
    tinymist

    #LaTeX
    texlab
    tex-fmt
  ];

  development = with pkgs; [
    #Nix
    statix
    deadnix

    #Java
    jdk17
    maven

    #Assembly
    nasm

    #C/C++
    gcc
    gdb

    #Rust
    cargo
    rustc

    # cmake
    cmake
    ninja

    #Python
    python3
    python313Packages.pip
    virtualenv

    #SQL
    dbeaver-bin

    # JavaScript
    nodejs

    #Qt6
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtwayland
    qt6.qttools
    qt6.qtvirtualkeyboard
    qt6.qtmultimedia
  ];

  allPackages = system ++ media ++ language-servers ++ development;
in {
  environment.systemPackages = allPackages;
}
