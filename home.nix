{ pkgs, lib, config, nix-colors, ... }: {
  xdg.enable = true;
  targets.genericLinux.enable = true;
  fonts.fontconfig.enable = true;

  imports = [
    nix-colors.homeManagerModules.default
    ./modules
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
        # (nixGL pkgs.spotify)
        # (nixGL pkgs.vivaldi)
    ];

    programs.home-manager.enable = true;
}
