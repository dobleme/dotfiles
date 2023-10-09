{pkgs, ...}: {
    imports = [
        ./programs/git.nix
        ./programs/nvim.nix
        ./programs/alacritty.nix
        ./programs/zsh.nix
        ./programs/tmux.nix
    ];

    home.packages = [
        pkgs.bat
        pkgs.ripgrep
        pkgs.btop
        pkgs.iftop
    ];

    programs.home-manager.enable = true;
}
