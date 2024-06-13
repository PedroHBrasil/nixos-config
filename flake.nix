{
  description = "My NixOS System Configuration Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        phawm15r3nixos = lib.nixosSystem {
	  inherit system;
	  modules = [
	    ./modules/system.nix
	  ];
        };
      };
      homeConfigurations = {
        pedrohbrasil = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
	    ./modules/home.nix
	  ];
        };
      };
    };
}
