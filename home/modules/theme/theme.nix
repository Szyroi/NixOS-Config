{
  lib,
  config,
  ...
}: let
  # Standard: Base + ANSI 16 Farben
  themes = {
    blood = {
      background = "#0a0a0d";
      foreground = "#f5f5f5";
      cursor = "#ff1b2d";

      # ANSI 16
      color0 = "#0a0a0d";
      color1 = "#ff1b2d";
      color2 = "#a83232";
      color3 = "#b8001f";
      color4 = "#ff335c";
      color5 = "#ff0066";
      color6 = "#ff6b81";
      color7 = "#d0d0d0";

      color8 = "#2a2a36";
      color9 = "#ff4d4d";
      color10 = "#c43c3c";
      color11 = "#cc0033";
      color12 = "#ff335c";
      color13 = "#ff3399";
      color14 = "#ff6b81";
      color15 = "#ffffff";

      # UI-Helper (optional, aber standardisiert vorhanden)
      muted = "#2a2a36";
      accent = "#ff1b2d";
      accentSoft = "#ff4d4d";

      accentCode = 31;
    };

    nix = {
      background = "#0b0f1a";
      foreground = "#f0f0ff";
      cursor = "#5e60ff";

      # ANSI 16
      color0 = "#0b0f1a";
      color1 = "#ff4d6d";
      color2 = "#2dd4bf";
      color3 = "#ffd166";
      color4 = "#00b4ff";
      color5 = "#8c52ff";
      color6 = "#5e60ff";
      color7 = "#d8dcff";

      color8 = "#1a1f2e";
      color9 = "#ff7a90";
      color10 = "#5eead4";
      color11 = "#ffe29a";
      color12 = "#4dc9ff";
      color13 = "#b084ff";
      color14 = "#8aa1ff";
      color15 = "#ffffff";

      muted = "#1a1f2e";
      accent = "#5e60ff";
      accentSoft = "#8c52ff";

      accentCode = 35;
    };
  };

  selected = themes.${config.myTheme.name} or themes.blood;
in {
  options.myTheme = {
    name = lib.mkOption {
      type = lib.types.enum (builtins.attrNames themes);
      default = "blood";
      description = "Aktives Farbschema";
    };

    colors = lib.mkOption {
      type = lib.types.attrs;
      readOnly = true;
      description = "Abgeleitete Farben (Base + ANSI16 + UI helper)";
    };
  };

  config.myTheme.colors = selected;
}
