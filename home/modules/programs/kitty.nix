{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      name = lib.mkDefault "JetBrainsMono Nerd Font";
      size = 12;
    };

    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      background_opacity = lib.mkDefault 0.85;
      confirm_os_window_close = 0;

      background_blur = 0;

      cursor_shape = "beam";
      cursor_shape_unfocused = "beam";
      cursor_beam_thickness = 4;
      cursor_blink = true;
      cursor_blink_interval = 0.5;
      cursor_trail = 3;
    };
    extraConfig = ''
      cursor_trail_decay 0.1 0.4
      shell ${pkgs.fish}/bin/fish -c 'fastfetch; exec fish'



    '';
  };
}
