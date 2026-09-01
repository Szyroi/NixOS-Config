{
  lib,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;

    settings = {
      theme = "tokyonight";
      editor = {
        line-number = "relative";
        mouse = true;
        auto-save = true;
        bufferline = "multiple";
        color-modes = true;
        auto-pairs = true;
        scrolloff = 8;
        cursorline = true;

        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "warning";
          other-lines = "info";
        };

        file-picker = {
          hidden = false;
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = false;
          display-signature-help-docs = true;
        };
      };
    };

    languages = {
      language-server = {
        hyprls = {command = lib.getExe pkgs.hyprls;};
        fish-lsp = {command = lib.getExe pkgs.fish-lsp;};
        bash-language-server = {command = lib.getExe pkgs.bash-language-server;};
        vscode-json-language-server = {command = lib.getExe pkgs.vscode-json-languageserver;};
        taplo = {
          command = lib.getExe pkgs.taplo;
          args = ["lsp" "stdio"];
        };
        yaml-language-server = {command = lib.getExe pkgs.yaml-language-server;};
        systemd-lsp = {command = lib.getExe pkgs.systemd-lsp;};
        lua-language-server = {command = lib.getExe pkgs.lua-language-server;};
        markdown-oxide = {command = lib.getExe pkgs.markdown-oxide;};
        superhtml = {command = lib.getExe pkgs.superhtml;};
        vscode-css-language-server = {command = lib.getExe pkgs.vscode-css-languageserver;};
        typescript-language-server = {
          command = lib.getExe pkgs.typescript-language-server;
          args = ["--stdio"];
        };
        svelte-language-server = {command = lib.getExe pkgs.svelte-language-server;};
        clangd = {
          command = lib.getExe' pkgs.clang-tools "clangd";
          args = ["--background-index" "--clang-tidy"];
        };
        asm-lsp = {command = lib.getExe pkgs.asm-lsp;};
        neocmakelsp = {command = lib.getExe pkgs.neocmakelsp;};
      };

      language = [
        {
          name = "java";
          scope = "source.java";
          file-types = ["java"];
          roots = ["pom.xml" "build.gradle" "build.gradle.kts"];
          auto-format = true;
          language-servers = ["jdtls"];
          formatter.command = lib.getExe pkgs.google-java-format;
        }
        {
          name = "c";
          scope = "source.c";
          file-types = ["c" "h"];
          auto-format = true;
          language-servers = ["clangd"];
        }
        {
          name = "cpp";
          scope = "source.cpp";
          file-types = ["cpp" "hpp" "cc" "cxx" "c++"];
          auto-format = true;
          language-servers = ["clangd"];
        }
        {
          name = "rust";
          scope = "source.rust";
          file-types = ["rs"];
          roots = ["Cargo.toml" "Cargo.lock"];
          shebangs = ["rust-script" "cargo"];
          auto-format = true;
          language-servers = ["rust-analyzer"];
        }
        {
          name = "python";
          scope = "source.python";
          file-types = ["py" "pyi" "pyw"];
          auto-format = true;
          language-servers = ["pyright"];
          formatter.command = lib.getExe pkgs.ruff;
        }
        {
          name = "typst";
          scope = "source.typst";
          file-types = ["typ"];
          auto-format = true;
          language-servers = ["tinymist"];
          formatter.command = lib.getExe pkgs.typstyle;
        }
        {
          name = "nix";
          scope = "source.nix";
          file-types = ["nix"];
          auto-format = true;
          language-servers = ["nixd"];
          formatter.command = lib.getExe pkgs.alejandra;
        }
        {
          name = "hyprlang";
          scope = "source.hyprlang";
          roots = ["hyprland.conf"];
          file-types = ["conf"];
          comment-token = "#";
          auto-format = true;
          language-servers = ["hyprls"];
        }
        {
          name = "haskell";
          scope = "source.haskell";
          file-types = ["hs"];
          auto-format = true;
          language-servers = ["haskell-language-server-wrapper"];
          formatter.command = lib.getExe (pkgs.haskell.lib.justStaticExecutables pkgs.haskellPackages.fourmolu);
        }
        {
          name = "fish";
          scope = "source.fish";
          file-types = ["fish"];
          auto-format = true;
          language-servers = ["fish-lsp"];
        }
        {
          name = "bash";
          scope = "source.bash";
          file-types = ["sh" "bash"];
          auto-format = true;
          language-servers = ["bash-language-server"];
          formatter.command = lib.getExe pkgs.shfmt;
        }
        {
          name = "json";
          scope = "source.json";
          file-types = ["json"];
          auto-format = true;
          language-servers = ["vscode-json-language-server"];
          formatter.command = lib.getExe pkgs.prettierd;
        }
        {
          name = "toml";
          scope = "source.toml";
          file-types = ["toml"];
          auto-format = true;
          language-servers = ["taplo"];
          formatter.command = lib.getExe pkgs.taplo;
          formatter.args = ["fmt" "-"];
        }
        {
          name = "yaml";
          scope = "source.yaml";
          file-types = ["yaml" "yml"];
          auto-format = true;
          language-servers = ["yaml-language-server"];
          formatter.command = lib.getExe pkgs.prettierd;
        }
        {
          name = "systemd";
          scope = "source.ini";
          file-types = ["service" "socket" "timer" "target"];
          auto-format = true;
          language-servers = ["systemd-lsp"];
        }
        {
          name = "lua";
          scope = "source.lua";
          file-types = ["lua"];
          auto-format = true;
          language-servers = ["lua-language-server"];
          formatter.command = lib.getExe pkgs.stylua;
        }
        {
          name = "markdown";
          scope = "source.markdown";
          file-types = ["md" "markdown"];
          auto-format = true;
          language-servers = ["markdown-oxide"];
          formatter.command = lib.getExe pkgs.prettierd;
        }
        {
          name = "html";
          scope = "source.html";
          file-types = ["html" "htm"];
          auto-format = true;
          language-servers = ["superhtml"];
        }
        {
          name = "css";
          scope = "source.css";
          file-types = ["css" "scss" "sass"];
          auto-format = true;
          language-servers = ["vscode-css-language-server"];
        }
        {
          name = "javascript";
          scope = "source.js";
          file-types = ["js" "mjs" "cjs" "rules" "es6" "pac" "gs"];
          shebangs = ["node"];
          roots = ["package.json" "jsconfig.json"];
          auto-format = true;
          language-servers = ["typescript-language-server"];
        }
        {
          name = "jsx";
          scope = "source.jsx";
          language-id = "javascriptreact";
          file-types = ["jsx"];
          roots = ["package.json" "jsconfig.json"];
          language-servers = ["typescript-language-server"];
        }
        {
          name = "typescript";
          scope = "source.ts";
          file-types = ["ts" "tsx" "mts" "cts"];
          auto-format = true;
          language-servers = ["typescript-language-server"];
        }
        {
          name = "tsx";
          scope = "source.tsx";
          language-id = "typescriptreact";
          file-types = ["tsx"];
          roots = ["package.json" "jsconfig.json"];
          language-servers = ["typescript-language-server"];
        }
        {
          name = "svelte";
          scope = "source.svelte";
          file-types = ["svelte"];
          auto-format = true;
          language-servers = ["svelte-language-server"];
        }
        {
          name = "assembly";
          scope = "source.asm";
          file-types = ["s" "S" "asm" "nasm"];
          auto-format = true;
          language-servers = ["asm-lsp"];
        }
        {
          name = "cmake";
          scope = "source.cmake";
          file-types = ["cmake" "CMakeLists.txt"];
          auto-format = true;
          language-servers = ["neocmakelsp"];
        }
      ];
    };
  };
}
