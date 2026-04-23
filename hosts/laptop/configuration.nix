{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core/default.nix
    ../../modules/common/users/szyroi/nixos/default.nix
    ../../modules/nixos/optional/hardware/amd.nix
  ];

  security.pam.services.login.enableGnomeKeyring = true;
  services.tlp.enable = true;
  services.auto-cpufreq.enable = false;

  powerManagement.cpuFreqGovernor = "powersave";

  services.logind.settings.Login.lidSwitch = "suspend";
  services.timesyncd.enable = true;

  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      disableWhileTyping = true;
      clickMethod = "clickfinger";
    };
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    lm_sensors
    acpi
    powertop
    usbutils
    pciutils
  ];




  system.stateVersion = "25.05";
}
