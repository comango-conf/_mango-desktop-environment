{
  description = "NixOS configuration";

  inputs = {
    # nixpkgs.url = "nixpkgs/nixos-22.05"; 
    nixpkgs.url = "nixpkgs/nixos-unstable"; 
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable"; 
    snowcake.url = "github:HanLap/snowcake/main";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      # build with your own instance of nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, snowcake, hyprland }:
    let
      system = "x86_64-linux";
      overlay-unstable = final: prev: {
        #unstable = nixpkgs-unstable.legacyPackages.${prev.system};
        # use this variant if unfree packages are needed:
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
        ];
      };
    };
}

