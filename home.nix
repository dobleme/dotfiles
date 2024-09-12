{ pkgs, lib, config, nix-colors, ... }: let
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

  caca = nixGL;

  imports = [
    nix-colors.homeManagerModules.default
    ./programs/zsh.nix
    ./programs/alacritty.nix
    ./programs/nvim/nvim.nix
    ./programs/tmux.nix
    ./programs/git.nix
    ./programs/starship.nix
    ./programs/utils.nix
  ];

    # Check available schemes at https://tinted-theming.github.io/base16-gallery
    colorScheme = nix-colors.colorSchemes.ayu-dark;

    home.file = {
      ".local/bin"= {
        source = ./scripts;
        recursive = true;
      };
    };

    home.packages = with pkgs; [
        gum
        btop
        iftop
        xclip
        (nerdfonts.override { fonts = [ "CascadiaCode" ]; })

        # GUI
        nixgl.nixGLIntel
        # (nixGL pkgs.spotify)
        # (nixGL pkgs.vivaldi)
    ];

    programs.home-manager.enable = true;
}
