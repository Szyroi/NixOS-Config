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
            cargo-tauri

            # Frontend
            bun

            # Build tools
            pkg-config

            # Tauri deps
            gtk3
            webkitgtk_4_1
            openssl
            libsoup_3
            wrapGAppsHook4
            librsvg
          ];

          shellHook = ''

            export GDK_BACKEND=x11
            export XDG_DATA_DIRS="$GSETTINGS_SCHEMAS_PATH"
            export WEBKIT_DISABLE_COMPOSITING_MODE=1
            export GSK_RENDERER=cairo
            export GST_PLUGIN_SYSTEM_PATH_1_0="${pkgs.gst_all_1.gstreamer}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-base}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-good}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-bad}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-ugly}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-libav}/lib/gstreamer-1.0"


            echo "Tauri Dev Shell ready (${system})"
            fish
          '';
        };
      }
    );
}
