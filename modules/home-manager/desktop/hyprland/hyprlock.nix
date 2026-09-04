{lib, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 0;
        hide_cursor = true;
      };

      background = lib.mkForce [
        {
          path = "/nix/store/k45vp7iy6lvvcqk44m8ajpz50lsqk6lp-WP11.png";
          color = "rgb(111113)";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = lib.mkForce [
        {
          size = "250, 50";
          outline_thickness = 3;
          dots_size = 0.2;
          dots_spacing = 0.64;
          fade_on_empty = false;
          inner_color = "rgb(111113)";
          font_color = "rgb(ffffff)";
          outer_color = "rgb(137, 180, 250)";
          check_color = "rgb(249, 226, 175)";
          fail_color = "rgb(243, 139, 168)";
        }
      ];
    };
  };
}
