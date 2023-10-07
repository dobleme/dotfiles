{
    description = "My home configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =  {}: let
        system = "x86_64-linux";
    in {
        dev = home-manager.lib.homeManagerConfiguration {
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
    };
}
