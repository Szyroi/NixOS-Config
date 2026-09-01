{username, ...}: {
  imports = [
    ../modules/nixos/desktop/stylix.nix
    ../modules/nixos/hardware/laptop.nix
    ../modules/nixos/services/power.nix
  ];

  home-manager.users.${username}.imports = [
    ../modules/home-manager/desktop
    ../modules/home-manager/desktop/hyprland/laptop.nix
  ];

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
}
