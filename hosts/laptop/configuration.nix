{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core/default.nix
    ../../modules/common/users/szyroi/nixos/default.nix
    ../../modules/nixos/optional/laptop/default.nix
  ];

  security.pam.services.login.enableGnomeKeyring = true;

  services.tlp.enable = true;
  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      disableWhileTyping = true;
      clickMethod = "clickfinger";
    };
  };

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    KillUserProcesses = false;
  };

  system.stateVersion = "25.05";
}
