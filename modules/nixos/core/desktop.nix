{pkgs, ...}: {
  services.xserver.enable = true;

  programs = {
    firefox.enable = true;
    thunar.enable = true;
    xfconf.enable = true;
    dconf.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
    };

    steam = {
      enable = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [protonup-ng];
    };
    nix-ld.enable = true;
  };
}
