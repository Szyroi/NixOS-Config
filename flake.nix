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

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    username = "szyroi";
    pkgs = nixpkgs.legacyPackages.${system};
    specialArgs = {inherit inputs system username;}; # SpecialArgs for both Configs

    # NixOS Defaults
    nixDefaultsModule = {...}: {
      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = ["nix-command" "flakes"];
    };
  in {
    # NixOS Configuration
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = specialArgs;
        modules = [
          nixDefaultsModule
          inputs.stylix.nixosModules.stylix

          ./modules/nixos/core/stylix.nix
          ./hosts/desktop/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm-bak";
            home-manager.users.${username} = import ./home/home.nix;
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.sharedModules = [
              inputs.nixvim.homeModules.nixvim
              inputs.sops-nix.homeModules.sops
            ];
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
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm-bak";
            home-manager.users.${username} = import ./home/home.nix;
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.sharedModules = [
              inputs.nixvim.homeModules.nixvim
              inputs.sops-nix.homeModules.sops
            ];
          }
        ];
      };
    };

    formatter.${system} = pkgs.alejandra;
  };
}
