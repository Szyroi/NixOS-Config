{
  config,
  lib,
  pkgs,
  ...
}: let
  # hex ohne '#': "rrggbb"
  col = config.lib.stylix.colors;

  line = col.base03;
  acc = col.base08;
  acc2 = col.base0C;
  text = col.base05;
in {
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "auto";
        source = "nixos";
        padding = {right = 1;};
      };

      display = {separator = " ";};

      modules = [
        {
          type = "custom";
          key = "{##${line}}╭───────────╮{#}";
        }

        {
          type = "title";
          key = "{##${line}}│ {##${acc}} user    {##${line}}│{#}";
          format = "{user-name}";
        }
        {
          type = "title";
          key = "{##${line}}│ {##${acc}}󰇅 hname   {##${line}}│{#}";
          format = "{host-name}";
        }
        {
          type = "os";
          key = "{##${line}}│ {##${acc}}{icon} distro  {##${line}}│{#}";
        }
        {
          type = "kernel";
          key = "{##${line}}│ {##${acc}} kernel  {##${line}}│{#}";
        }
        {
          type = "de";
          key = "{##${line}}│ {##${acc}}󰇄 desktop {##${line}}│{#}";
        }
        {
          type = "terminal";
          key = "{##${line}}│ {##${acc}} term    {##${line}}│{#}";
        }
        {
          type = "shell";
          key = "{##${line}}│ {##${acc}} shell   {##${line}}│{#}";
        }
        {
          type = "cpu";
          key = "{##${line}}│ {##${acc}}󰍛 cpu     {##${line}}│{#}";
          showPeCoreCount = true;
        }
        {
          type = "disk";
          key = "{##${line}}│ {##${acc}}󰉉 disk    {##${line}}│{#}";
          folders = "/";
        }
        {
          type = "memory";
          key = "{##${line}}│ {##${acc}} memory  {##${line}}│{#}";
        }

        {
          type = "custom";
          key = "{##${line}}├───────────┤{#}";
        }

        {
          type = "colors";
          key = "{##${line}}│ {##${acc2}} colors  {##${line}}│{#}";
          symbol = "circle";
        }

        {
          type = "custom";
          key = "{##${line}}╰───────────╯{#}";
        }
      ];
    };
  };
}
