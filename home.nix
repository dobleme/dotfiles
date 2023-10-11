{pkgs, ...}: {
    imports = [
        ./programs/git.nix
        ./programs/nvim.nix
        ./programs/alacritty.nix
        ./programs/zsh.nix
        ./programs/tmux/tmux.nix
        ./programs/starship.nix
    ];

    home.packages = [
        pkgs.bat
        pkgs.ripgrep
        pkgs.btop
        pkgs.iftop
        pkgs.tig
    ];

    xdg.enable = true;
    targets.genericLinux.enable = true;

    programs.home-manager.enable = true;
}
