{...}: {
  imports = [
    ../modules/nixos/hardware/laptop.nix
    ../modules/nixos/services/power.nix
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
