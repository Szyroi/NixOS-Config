{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.helix = {
    enable = true;

    settings = {
      editor = {
        line-number = "relative";
        mouse = true;
        auto-save = true;
        bufferline = "multiple";
        color-modes = true;
        auto-pairs = true;

        file-picker = {
          hidden = false;
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };

      keys.normal = {
        "C-s" = [":format" ":write"];
      };
    };

    languages = {
      language = [
        {
          name = "java";
          auto-format = true;
          language-servers = ["jdtls"];
        }
        {
          name = "typst";
          auto-format = true;
          language-servers = ["tinymist"];
        }
        {
          name = "nix";
          auto-format = true;
          language-servers = ["nixd"];
        }
      ];
    };
  };
}
