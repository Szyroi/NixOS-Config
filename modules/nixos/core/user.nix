{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  users.defaultUserShell = pkgs.fish;

  programs.fish.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    description = "Main User";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
