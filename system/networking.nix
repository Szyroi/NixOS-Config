{
  config,
  lib,
  ...
}: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;

      trustedInterfaces = [
        "lo"
        "eno1"
      ];

      allowedTCPPorts = [
        80
        443
        22
      ];
      allowedUDPPorts = [5353];
    };
  };
}
