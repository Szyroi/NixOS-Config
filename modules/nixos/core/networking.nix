{
  config,
  lib,
  ...
}: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;

      allowedTCPPorts = [
        22
        80
        443
      ];
      allowedUDPPorts = [
        53
        5353
        24727
      ];
    };
  };
}
