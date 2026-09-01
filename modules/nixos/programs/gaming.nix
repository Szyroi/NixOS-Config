{pkgs, ...}: {
  hardware.steam-hardware.enable = true;

  programs.steam = {
    enable = true;

    protontricks.enable = true;

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    gamescopeSession.enable = true;

    extraCompatPackages = with pkgs; [
      protonup-ng
    ];
  };

  environment.systemPackages = with pkgs; [
    steamtinkerlaunch
  ];
}
