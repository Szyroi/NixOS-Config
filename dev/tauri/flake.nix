{
  description = "Tauri Dev Shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Rust
            rustc
            cargo
            rust-analyzer
            cargo-tauri

            # Frontend
            bun
            nodejs

            # Build tools
            pkg-config
            cmake

            # Tauri deps
            gtk3
            webkitgtk_4_1
            glib
            cairo
            pango
            harfbuzz
            openssl
            libsoup_3
            librsvg
            libappindicator-gtk3
            at-spi2-atk
            xdotool

            # GStreamer
            gst_all_1.gstreamer
            gst_all_1.gst-plugins-base
            gst_all_1.gst-plugins-good
            gst_all_1.gst-plugins-bad
            gst_all_1.gst-plugins-ugly
            gst_all_1.gst-libav
          ];

          RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";

          shellHook = ''
            export GDK_BACKEND=x11
            export XDG_DATA_DIRS="$GSETTINGS_SCHEMAS_PATH"
            export GST_PLUGIN_SYSTEM_PATH_1_0="${pkgs.gst_all_1.gst-plugins-base}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-good}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-bad}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-ugly}/lib/gstreamer-1.0"
            echo "🚀 Tauri Dev Shell ready (${system})"
          '';
        };
      }
    );
}
