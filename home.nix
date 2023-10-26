{ pkgs, lib, ... }: let
    nixGL = pkg: pkgs.runCommand "${pkg.name}-nixgl-wrapper" {} ''
	mkdir $out
	ln -s ${pkg}/* $out
	rm $out/bin
    	mkdir $out/bin
    	for bin in ${pkg}/bin/*; do
     	    wrapped_bin=$out/bin/$(basename $bin)
     	    echo "exec ${lib.getExe pkgs.nixgl.nixGLIntel} $bin \$@" > $wrapped_bin
            chmod +x $wrapped_bin
	done
    '';
in {
    xdg.enable = true;
    targets.genericLinux.enable = true;
    fonts.fontconfig.enable = true;

    imports = [
        ./programs/git.nix
        ./programs/nvim/nvim.nix
        ./programs/zsh.nix
        ./programs/starship.nix
    ];

    home.packages = [
        pkgs.bat
        pkgs.ripgrep
        pkgs.btop
        pkgs.iftop
        pkgs.tig
        (pkgs.nerdfonts.override { fonts = [ "CascadiaCode" ]; })

        # GUI
        pkgs.nixgl.nixGLIntel
        # (nixGL pkgs.spotify)
        # (nixGL pkgs.vivaldi)
    ];

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
        # tmux = {
        #     enableShellIntegration = true;
        # };
    };

    programs.alacritty = {
        enable = true;
        package = nixGL pkgs.alacritty;
    };

    programs.tmux.enable = true;

    xdg.configFile = {
        "alacritty/alacritty.yml".source = pkgs.substituteAll {
            name = "alacritty.yml";
            src = ./programs/alacritty.yml;
            shell = "${pkgs.zsh}/bin/zsh";
        };
        "tmux/tmux.conf".source = pkgs.substituteAll {
            name = "tmux.conf";
            src = ./programs/tmux.conf;
            shell = "${pkgs.zsh}/bin/zsh";
        };
    };

    programs.home-manager.enable = true;
}
