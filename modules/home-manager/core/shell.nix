{hostname, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#${hostname}";
      vpn-up = "sudo openvpn /etc/nixos/openvpn/client.ovpn";
    };
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      uwu = "sudo";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#${hostname}";
      firmware = "sudo systemctl reboot --firmware-setup";
      update-lock = "sudo nix flake update --flake ~/nixos-config";
      update-flake = "sudo nix flake update --commit-lock-file";
      vpn-up = "sudo openvpn /etc/nixos/openvpn/client.ovpn";
    };

    shellInit = ''
      set -g fish_greeting ""
      starship init fish | source
    '';
  };
}
