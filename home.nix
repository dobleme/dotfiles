{pkgs, ...}: {
    imports = [
        ./programs/git.nix
        ./programs/nvim.nix
        ./programs/alacritty.nix
        ./programs/zsh.nix
        ./programs/tmux/tmux.nix
    ];

    home.packages = [
        pkgs.bat
        pkgs.ripgrep
        pkgs.btop
        pkgs.iftop
        pkgs.tig
    ];

    #targets.genericLinux.enable = true;

    programs.home-manager.enable = true;
}
