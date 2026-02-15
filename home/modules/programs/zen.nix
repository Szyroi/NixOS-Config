{inputs, ...}: {
  imports = [
    ./zen-browser-fixed.nix
  ];

  programs.zen-browser.enable = true;
}
