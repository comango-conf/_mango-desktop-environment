{
  description = "NixOS configuration";

  inputs = {
    # nixpkgs.url = "nixpkgs/nixos-22.05"; 
    nixpkgs.url = "nixpkgs/nixos-unstable"; 
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable"; 
    snowcake.url = "github:HanLap/snowcake/main";
    comango.url = "github:HanLap/comango/main";
    hmm.url = "git+https://git.wyvernscale.com/boonami/hmm";
    hyprland = {
      url = "github:HanLap/Hyprland";
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

  outputs = { self, nixpkgs, nixpkgs-unstable, snowcake, hyprland, hyprcontrib, hyprpaper, hyprpicker, hmm, comango }@attrs:
    let
      system = "x86_64-linux";
      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        snowcake = snowcake.legacyPackages.${prev.system};
      };
    in {
      nixosConfigurations."<#{DEVICE_NAME}#>" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { lib = nixpkgs.lib; };
        modules = [
          # Overlays-module makes "pkgs.unstable" available in configuration.nix
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          ./configuration.nix
          
          hyprland.nixosModules.default
          {programs.hyprland.enable = true;}
          {
	    environment.systemPackages = [ 
              comango.legacyPackages.${system}.comango
              hmm.legacyPackages.${system}.hmm
              hyprcontrib.packages.${system}.grimblast
              hyprpaper.packages.${system}.hyprpaper
	      hyprpicker.packages.${system}.hyprpicker
            ];
          }
        ];
      };
    };
}

