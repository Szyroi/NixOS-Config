{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "ini"
      "toml"
      "java-eclipse-jdtls"
      "java"
      "LaTeX"
      "sql"
      "make"
      "neocmake"
      "svelte"
      "scss"
      "lua"
      "xml"
      "html"
      "dockerfile"
      "git-firefly"
      "jsonnet"
      "assembly-language-server"
    ];

    userSettings = {
      base_keymap = "VSCode";

      ui_font_weight = 400.0;
      ui_font_size = lib.mkDefault 16.0;
      buffer_font_weight = lib.mkDefault 400.0;
      buffer_font_size = lib.mkDefault 15.0;
      buffer_font_family = lib.mkDefault "JetBrainsMono Nerd Font";

      format_on_save = "on";
      prettier.allowed = false;
      enable_language_server = true;
      linked_edits = true;
      completions = {
        lsp = true;
      };
      diagnostics = {
        lsp_pull_diagnostics = {
          enabled = true;
        };
        inline = {
          enabled = true;
        };
        include_warnings = true;
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      terminal = {
        shell = {
          program = "fish";
        };
        working_directory = "current_project_directory";
        cursor_shape = "bar";
      };

      icon_theme = {
        mode = "dark";
        light = "Colored Zed Icons Theme Light";
        dark = "Colored Zed Icons Theme Dark";
      };

      languages = {
        Nix = {
          formatter = {
            external = {
              command = "alejandra";
              arguments = ["--quiet"];
            };
          };
          language_servers = ["nixd"];
        };
        C = {
          language_servers = ["clangd"];
        };
        Python = {
          language_servers = [
            "ruff"
            "pyright"
          ];
          formatter = {
            external = {
              command = "ruff";
              arguments = [
                "format"
                "-"
              ];
            };
          };
          enable_language_server = true;
          inlay_hints = {
            show_other_hints = true;
            show_parameter_hints = true;
            show_type_hints = true;
            show_value_hints = true;
            enabled = true;
          };
          show_completion_documentation = true;
          show_completions_on_input = true;
          use_auto_surround = true;
          use_autoclose = true;
          ensure_final_newline_on_save = true;
          remove_trailing_whitespace_on_save = true;
          format_on_save = "on";
          indent_guides = {
            coloring = "indent_aware";
          };
        };
        Java = {
          show_edit_predictions = false;
          prettier.allowed = true;
          inlay_hints = {
            show_other_hints = true;
            show_parameter_hints = true;
            show_type_hints = true;
            show_value_hints = true;
            enabled = true;
          };
          show_completion_documentation = true;
          show_completions_on_input = true;
          show_whitespaces = "selection";
          use_auto_surround = true;
          use_autoclose = true;
          ensure_final_newline_on_save = true;
          remove_trailing_whitespace_on_save = true;
          format_on_save = "on";
          allow_rewrap = "in_comments";
          show_wrap_guides = true;
          soft_wrap = "none";
          auto_indent = true;
          auto_indent_on_paste = true;
          indent_guides = {
            active_line_width = 2;
            line_width = 1;
            background_coloring = "disabled";
            coloring = "indent_aware";
            enabled = true;
          };
        };
      };
    };
  };
}
