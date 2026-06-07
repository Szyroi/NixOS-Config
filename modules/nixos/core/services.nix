{
  config,
  pkgs,
  lib,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "de";
        variant = "";
      };
    };

    fstrim.enable = true;
    dbus.enable = true;
    pcscd.enable = true;
    udisks2.enable = true; # USB functionalities
    openssh.enable = true;
    blueman.enable = true;
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
        hplipWithPlugin
        gutenprint
      ];
    };
  };
}
