{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  users.users.${username} = {
    isNormalUser = true;
    description = "User";
    extraGroups = [
      "wheel"
      "networkmanager"
      "nixbld"
      "pcscd"
      "scard"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
