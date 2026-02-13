{
  config,
  pkgs,
  lib,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      videoDriver = "nvidia";
      xkb = {
        layout = "de";
        variant = "";
      };
    };

    pcscd.enable = true;
    dbus.enable = true;
    udisks2.enable = true;
    openssh.enable = true;
    blueman.enable = true;
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
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
