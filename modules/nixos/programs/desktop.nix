{pkgs, ...}: {
  programs = {
    firefox.enable = true;
    xfconf.enable = true;
    dconf.enable = true;
  };

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-vcs-plugin
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
      file-roller
    ];
  };
}
