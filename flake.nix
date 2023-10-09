{
    description = "My home configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =  { self, nixpkgs, home-manager, ... }: let
        system = "x86_64-linux";
        common = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
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
