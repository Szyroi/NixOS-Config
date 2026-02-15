{inputs, ...}: let
  # upstream hm-module.nix patchen: "visible = ..." entfernen
  patchedHmModule =
    builtins.toFile "zen-hm-module-patched.nix"
    (builtins.replaceStrings
      ["visible = true;" "visible = false;"]
      ["" ""]
      (builtins.readFile "${inputs.zen-browser}/hm-module.nix"));

  # Name anpassen: "beta" / "twilight" / ...
  zenHm = import patchedHmModule {
    home-manager = inputs.home-manager;
    self = inputs.zen-browser;
    name = "beta";
  };
in {
  imports = [zenHm];
}
