{ pkgs, ... }:

{
  stylix = {
    enable = true;

    image = ../home/wallpapers/WP2.png;

    polarity = "dark";

    base16Scheme = {
      base00 = "111113";
      base01 = "1a1b1f";
      base02 = "23242a";
      base03 = "333232";

      base04 = "8754f2";
      base05 = "ffffff";
      base06 = "f2f6fa";
      base07 = "ffffff";

      base08 = "6346ff";
      base09 = "43aaf9";
      base0A = "43aaf9";
      base0B = "bf7af0";
      base0C = "43aaf9";
      base0D = "8754f2";
      base0E = "f75f8f";
      base0F = "e61f44";
    };

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };

      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
    };
  };
}
