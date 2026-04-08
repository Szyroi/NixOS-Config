{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    cargo
    rustc
    rust-analyzer
    clippy
    cargo-tauri
    nodejs
    bun
    cmake
    gcc
    perl
    python3
  ];

  buildInputs = with pkgs; [
    glibc
    libsoup_3
    gtk3
    cairo
    webkitgtk_6_0
    openssl
    at-spi2-atk
    atkmm
    gdk-pixbuf
    harfbuzz
    librsvg
    pango
    libappindicator-gtk3
    xdotool
    # GStreamer und alle benötigten Plugins
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

    # Setze den Pfad zu den GStreamer-Plugins
    export GST_PLUGIN_SYSTEM_PATH_1_0="${pkgs.gst_all_1.gst-plugins-base}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-good}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-bad}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-ugly}/lib/gstreamer-1.0"

    echo "✅ Rust source path: $RUST_SRC_PATH"
    echo "✅ Build-Tools: cmake, gcc, perl, python3 verfügbar"
  '';
}
