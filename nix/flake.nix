{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable"; 
    snowcake = {
      url = "github:HanLap/snowcake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    comango = {
      url = "github:HanLap/comango/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hmm = {
      url = "/home/hannah/repositories/hmm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland/51a930f802c71a0e67f05e7b176ded74e8e95f87"; # v0.26.0
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprcontrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, snowcake, hyprland, hyprcontrib, hyprpaper, hyprpicker, hmm, comango }@attrs:
    let
      system = "x86_64-linux";
      pkg-overlay = final: prev: {
        snowcake = snowcake.legacyPackages.${prev.system};
        comango = comango.legacyPackages.${prev.system};
        hmm = hmm.legacyPackages.${prev.system};
#        hmm = import hmm {
#          system = prev.system;
#          config.allowUnfree = true;
#        };
        hyprcontrib = hyprcontrib.packages.${prev.system};
        hyprpaper = hyprpaper.packages.${prev.system};
	hyprpicker = hyprpicker.packages.${prev.system};
        hyprland = hyprland.packages.${prev.system};
      };
      pkgs = import nixpkgs { 
        inherit system;
        config = { 
          allowUnfree = true; 
          permittedInsecurePackages = [
            "electron-24.8.6"
          ];
        }; 
        overlays = [ 
          pkg-overlay 
        ];
      };
    in
    {
      nixosConfigurations."<#{DEVICE_NAME}#>" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit pkgs; lib = nixpkgs.lib; };
        modules = [
          ({ lib, ... }: { 
#            nixpkgs = {
#              overlays = [ pkg-overlay ]; 
#            };
          })

          ./configuration.nix

#          hyprland.nixosModules.default

#          {programs.hyprland.enable = true;}

          ({ pkgs, ... }:
          {
            environment.systemPackages = [ 
              pkgs.comango.comango
              pkgs.hmm.hmm
#              pkgs.hyprcontrib.grimblast
#              pkgs.hyprpaper.hyprpaper
#              pkgs.hyprpicker.hyprpicker
#              pkgs.hyprland.waybar-hyprland
            ];
          })
        ];
      };
    };
}

