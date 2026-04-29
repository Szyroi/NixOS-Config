{
  description = "NixOS with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    username = "szyroi";
    pkgs = nixpkgs.legacyPackages.${system};
    specialArgs = {inherit inputs system username;}; # SpecialArgs for both Configs

    # NixOS Defaults
    nixDefaultsModule = {
      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = ["nix-command" "flakes"];
    };
  in {
    formatter.${system} = pkgs.alejandra;

    # NixOS Configuration
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          nixDefaultsModule
          inputs.silentSDDM.nixosModules.default
          inputs.stylix.nixosModules.stylix

          ./modules/nixos/core/stylix.nix
          ./hosts/desktop/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "hm-bak";
              users.${username} = import ./home/desktop/home.nix;
              extraSpecialArgs = specialArgs;
              sharedModules = [
                inputs.sops-nix.homeModules.sops
              ];
            };
          }
        ];
      };
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = specialArgs;
        modules = [
          nixDefaultsModule
          inputs.stylix.nixosModules.stylix

          ./modules/nixos/core/stylix.nix
          ./hosts/laptop/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "hm-bak";
              users.${username} = import ./home/laptop/home.nix;
              extraSpecialArgs = specialArgs;
              sharedModules = [
                inputs.sops-nix.homeModules.sops
              ];
            };
          }
        ];
      };
    };
  };
}
