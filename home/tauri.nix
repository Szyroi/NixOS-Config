{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.tauri;

  # -----------------------------
  # Toolchains
  # -----------------------------

  tauriPkgs = [
    pkgs.cargo-tauri
  ];

  jsPkgs = [
    pkgs.nodejs
    pkgs.bun
    pkgs.pnpm
    pkgs.yarn
  ];

  rustPkgs = [
    pkgs.rustc
    pkgs.cargo
  ];

  dotnetPkgs = [
    pkgs.dotnet-sdk
  ];

  # -----------------------------
  # UI templates per language
  # -----------------------------
  rustTemplates = ["vanilla" "yew" "leptos" "sycamore"];

  jsTemplates = [
    "vanilla"
    "vue"
    "svelte"
    "react"
    "solid"
    "angular"
    "preact"
  ];

  dotnetTemplates = ["blazor"];
in {
  imports = [];

  options.programs.tauri = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enables the Tauri dev Module";
    };

    language = lib.mkOption {
      type = lib.types.enum ["rust" "javascript" ".net"];
      default = "javascript";
    };

    packageManager = lib.mkOption {
      type = lib.types.enum ["auto" "npm" "pnpm" "yarn" "bun" "cargo" "dotnet"];
      default = "auto";
    };

    ui = {
      template = lib.mkOption {
        type = lib.types.str;
        default = "vanilla";
      };

      flavor = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum ["typescript" "javascript"]);
        default = null;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    # -----------------------------
    # TOOLCHAINS (language-based)
    # -----------------------------
    home.packages =
      if cfg.language == "rust"
      then rustPkgs
      else if cfg.language == "javascript"
      then jsPkgs
      else if cfg.language == ".net"
      then dotnetPkgs
      else [];

    # -----------------------------
    # AUTO package manager
    # -----------------------------
    programs.tauri.packageManager = lib.mkDefault (
      if cfg.packageManager != "auto"
      then cfg.packageManager
      else if cfg.language == "rust"
      then "cargo"
      else if cfg.language == "javascript"
      then "npm"
      else if cfg.language == ".net"
      then "dotnet"
      else "npm"
    );

    # -----------------------------
    # SMART DEFAULTS
    # -----------------------------
    ui.flavor = lib.mkDefault (
      if cfg.language == "javascript"
      then "typescript"
      else null
    );
  };

  meta = {
  };
}
