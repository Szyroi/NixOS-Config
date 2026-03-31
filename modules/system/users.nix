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
      "nix"
      "pcscd"
      "scard"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
