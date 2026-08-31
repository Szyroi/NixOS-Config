{
  description = "NixOS with Home Manager & Multi-Device Architecture";

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

    qylock = {
      url = "github:Darkkal44/qylock";
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
    nixland = {
      url = "github:Szyroi/nixland";
    };

    sqldeveloper = {
      url = "github:Szyroi/SQLDeveloper-Flake";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    username = "szyroi";

    supportedSystems = ["x86_64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    # pkgs für das spezifische System erstellen
    pkgsFor = forAllSystems (system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });

    # Global NixOS settings (System wide)
    nixDefaultsModule = {
      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = ["nix-command" "flakes"];
    };
  in {
    # Formatter for nix fmt
    formatter = forAllSystems (system: pkgsFor.${system}.alejandra);

    nixosConfigurations = {
      # ================= DESKTOP CONFIGURATION =================

      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs username;
        };
        modules = [
          nixDefaultsModule
          inputs.qylock.nixosModules.default
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
              extraSpecialArgs = {
                inherit inputs username;
              };
              sharedModules = [
                inputs.sops-nix.homeModules.sops
                inputs.nixland.homeManagerModules.default
              ];
            };
          }
        ];
      };

      # ================= LAPTOP CONFIGURATION =================

      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs username;
        };
        modules = [
          nixDefaultsModule
          inputs.qylock.nixosModules.default
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
              extraSpecialArgs = {
                inherit inputs username;
              };
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
