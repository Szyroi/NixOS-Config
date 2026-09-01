{pkgs, ...}: {
  console = {
    keyMap = "de";
    font = "ter-u32b";
    earlySetup = true;
    packages = with pkgs; [
      terminus_font
    ];
  };
}
