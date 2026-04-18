{...}: {
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
        scrolloff = 8;
        cursorline = true;

        file-picker = {
          hidden = false;
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
          display-signature-help-docs = true;
        };
      };

      keys.normal = {
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
          name = "c";
          auto-format = true;
          language-servers = ["clangd"];
        }
        {
          name = "rust";
          auto-format = true;
          language-servers = ["rust-analyzer"];
        }
        {
          name = "python";
          auto-format = true;
          language-servers = ["pyright"];
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
