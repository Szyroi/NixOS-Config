{
  config,
  pkgs,
  lib,
  ...
}: let
  c = config.lib.stylix.colors.withHashtag;
in {
  programs.wofi = {
    enable = true;

    settings = {
      width = 600;
      height = 500;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      allow_images = true;
      image_size = 40;
      no_actions = true;
      halign = "fill";
      hide_scrollbar = true;
      term = "kitty";
      insensitive = true;
      parse_search = false;

      mode = "vertical";
      lines = 10;
      columns = 1;
      line_wrap = "off";
      cycle = true;
      always_parse_args = true;

      gtk_dark = true;
      dynamic_lines = false;
      cache_file = "/dev/null";
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
      }

      window {
        padding: 0px;
        border-radius: 20px;
        background: transparent;
      }

      #outer-box {
        padding: 14px;
        border-radius: 20px;
        background-color: ${c.base00};
        border: 1px solid ${c.base08};
      }

      #input {
        margin-bottom: 10px;
        padding: 12px 16px;
        border-radius: 16px;

        background-color: ${c.base01};
        border: 1px solid ${c.base03};
        color: ${c.base05};
      }

      #input:focus {
        border: 1px solid ${c.base0C};
      }

      #inner-box {
        border-radius: 16px;
        padding: 6px;
        background-color: ${c.base00};
      }

      #entry {
        padding: 10px 14px;
        margin: 4px 0px;
        border-radius: 14px;
        transition: 0.12s ease-in-out;
      }

      #entry:hover {
        background-color: ${c.base01};
      }

      #entry:selected {
        background-color: ${c.base02};
        border: 1px solid ${c.base0C};
      }

      #text {
        color: ${c.base05};
      }

      #entry:selected #text {
        color: ${c.base07};
      }

      #img {
        margin-right: 12px;
        opacity: 0.95;
      }

      scrollbar, scrollbar slider {
        background: transparent;
        border: none;
      }

      scrollbar slider {
        background-color: ${c.base03};
        border-radius: 999px;
      }
    '';
  };
}
