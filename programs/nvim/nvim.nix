{ pkgs, lib, config, nix-colors, ...}: let
    colors-lib = nix-colors.lib.contrib { inherit pkgs; };
in {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        extraConfig = "colorscheme nix-${config.colorScheme.slug}";
        extraLuaConfig = ''
            ${builtins.readFile ./options.lua}
            ${builtins.readFile ./treesitter.lua}
            ${builtins.readFile ./telescope.lua}
            ${builtins.readFile ./gitsigns.lua}
            ${builtins.readFile ./whichkey.lua}
        '';
        plugins = with pkgs.vimPlugins; [
            (colors-lib.vimThemeFromScheme { scheme = config.colorScheme; } )
            telescope-nvim
            gitsigns-nvim
            which-key-nvim
            nvim-treesitter.withAllGrammars
        ];
        extraPackages = with pkgs; [
            gcc
            xclip
        ];
    };
}
