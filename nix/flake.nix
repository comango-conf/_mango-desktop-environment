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
  };

  outputs = { self, nixpkgs, snowcake, comango }@attrs:
    let
      system = "x86_64-linux";
      pkg-overlay = final: prev: {
        snowcake = snowcake.legacyPackages.${prev.system};
        comango = comango.legacyPackages.${prev.system};
#        hmm = import hmm {
#          system = prev.system;
#          config.allowUnfree = true;
#        };
      };
      pkgs = import nixpkgs { 
        inherit system;
        config = { 
          allowUnfree = true; 
          permittedInsecurePackages = [
            "electron-24.8.6"
            "electron-25.9.0"
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

          ({ pkgs, ... }:
          {
            environment.systemPackages = [ 
              pkgs.comango.comango
            ];
          })
        ];
      };
    };
}

