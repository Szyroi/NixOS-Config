{...}: {
  hardware.sensor.iio.enable = true;
  services.power-profiles-daemon.enable = true;

  services.libinput = {
    enable = true;

    touchpad = {
      tapping = true;
      naturalScrolling = true;
      disableWhileTyping = true;
      clickMethod = "clickfinger";
    };
  };

  systemd.sleep.settings.Sleep = {
    HibernateDelaySec = "2h";
  };

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend-then-hibernate";
    HandleLidSwitchExternalPower = "ignore";
    KillUserProcesses = false;
  };
}
