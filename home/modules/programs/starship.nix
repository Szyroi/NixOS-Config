# starship.nix
{
  config,
  lib,
  pkgs,
  ...
}: let
  # Stylix Base16 Farben mit "#"
  c = config.lib.stylix.colors.withHashtag;
in {
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      scan_timeout = 10;

      format = lib.concatStrings [
        "[╭─](bold ${c.base08})"
        "$os"
        "$username"
        "[@](dimmed ${c.base03})"
        "$hostname"
        "\n"
        "[│](bold ${c.base08})"
        " $directory"
        "$git_branch"
        "$git_status"
        "$fill"
        "$time"
        "\n"
        "[╰─](bold ${c.base08})"
        "$character"
      ];

      right_format = "$cmd_duration$status$container$rust$python";

      fill = {
        symbol = " ";
        style = "bold ${c.base01}";
      };

      character = {
        success_symbol = "[](bold ${c.base08}) ";
        error_symbol = "[✗](bold ${c.base0F}) ";
      };

      username = {
        show_always = true;
        style_user = "bold ${c.base08}";
        style_root = "bold ${c.base0F}";
        format = "[$user]($style)";
        disabled = false;
      };

      hostname = {
        format = "[$hostname](bold ${c.base0C})";
        ssh_only = false;
        ssh_symbol = "🌐 ";
        disabled = false;
      };

      os = {
        style = "fg:${c.base08}";
        format = "[ $symbol ]($style)";
        disabled = false;
        symbols = {NixOS = " ";};
      };

      directory = {
        style = "bold ${c.base0D}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        fish_style_pwd_dir_length = 1;

        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = "󰇚 ";
          "Music" = "󰎄 ";
          "Pictures" = "󰉏 ";
          "Videos" = "󰕧 ";
          "Desktop" = "󰀻 ";
          "Public" = "󰐰 ";
          "Templates" = "󰏓 ";
          ".config" = " ";
          ".local" = " ";
          "src" = "󰘦 ";
          "github" = " ";
          "gitlab" = " ";
          "work" = "󰑴 ";
          "projects" = " ";
          "nixos" = " ";
          ".dotfiles" = " ";
          ".cache" = "󰅨 ";
        };

        read_only = " 󰌾";
        read_only_style = "fg:${c.base09}";
        home_symbol = "~";
      };

      git_branch = {
        symbol = "";
        style = "bold ${c.base0E}";
        format = "[$symbol $branch]($style) ";
      };

      git_status = {
        style = "bold ${c.base08}";
        format = "[$all_status$ahead_behind]($style)";
        conflicted = "󰟍";
        ahead = "󰜷\${count}";
        behind = "󰜮\${count}";
        diverged = "󰜭";
        up_to_date = " 󰄬";
        untracked = "󰝥 \${count}";
        stashed = "󰆍";
        modified = "󰏫 \${count}";
        staged = "󰐕 \${count}";
        renamed = "󰑕 \${count}";
        deleted = "󰩹 \${count}";
      };

      git_commit = {
        commit_hash_length = 7;
        style = "bold ${c.base0E}";
        only_detached = false;
        format = "[(\\($hash\\))]($style) ";
      };

      git_state = {
        style = "bold ${c.base0A}";
        format = "[$state( $progress_current/$progress_total)]($style) ";
      };

      rust = {
        symbol = "";
        style = "bold ${c.base0D}";
        format = "[$symbol($version )]($style)";
      };

      python = {
        symbol = "";
        style = "bold ${c.base0C}";
        format = "[$symbol($version )]($style)";
      };

      java = {
        symbol = "";
        style = "bold ${c.base09}";
        format = "[$symbol($version )]($style)";
      };

      time = {
        disabled = false;
        time_format = "%H:%M";
        style = "bold ${c.base0C}";
        format = "[󰥔 $time]($style)";
      };

      cmd_duration = {
        min_time = 2000;
        format = "took [\\[$duration\\]]($style)";
        style = "bold ${c.base0A}";
      };

      nix_shell = {
        symbol = "";
        style = "bold ${c.base0C}";
        format = "[$symbol($name)]($style) ";
        impure_msg = "[impure](bold ${c.base08})";
        pure_msg = "[pure](bold ${c.base0B})";
      };

      status = {
        style = "bold ${c.base08}";
        format = "[\\[$symbol$common_meaning\\]]($style) ";
        map_symbol = true;
        disabled = false;
        symbol = "✗";
        success_symbol = "[✓](bold ${c.base08})";
      };

      memory_usage = {
        disabled = false;
        threshold = 85;
        symbol = "󰍛";
        style = "bold ${c.base09}";
        format = "[$symbol]($style) ";
      };

      line_break.disabled = false;
      package.disabled = true;
    };
  };
}
