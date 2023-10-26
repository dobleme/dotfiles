{
    description = "My home configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixgl = {
            url = "github:guibou/nixGL";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =  { self, nixgl, nixpkgs, home-manager, ... }: let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            overlays = [ nixgl.overlay ];
            config = { allowUnfree = true; };
        };
        common = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
                ./home.nix
                {
                    home = {
                        homeDirectory = "/home/dev";
                        username = "dev";
                        stateVersion = "23.11";
                    };
                }
            ];
        };

    in {
        defaultPackage.x86_64-linux = common.activationPackage;
        homeConfigurations.dev = common;
    };
}
