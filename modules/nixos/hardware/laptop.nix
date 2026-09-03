{...}: {
  hardware.sensor.iio.enable = true;
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
