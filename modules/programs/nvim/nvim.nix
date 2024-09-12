{ pkgs, config, nix-colors, ...}: let
      nix-colors-lib = nix-colors.lib.contrib { inherit pkgs; };
in {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        extraLuaConfig = ''
            ${builtins.readFile ./options.lua}
            vim.cmd.colorscheme "nix-${config.colorScheme.slug}"

            ${builtins.readFile ./treesitter.lua}
            ${builtins.readFile ./telescope.lua}
            ${builtins.readFile ./gitsigns.lua}
            ${builtins.readFile ./whichkey.lua}
            ${builtins.readFile ./cmp.lua}
        '';
        plugins = with pkgs.vimPlugins; [
            (nix-colors-lib.vimThemeFromScheme { scheme = config.colorScheme; })
            telescope-nvim
            gitsigns-nvim
            which-key-nvim
            vim-nix
            nvim-treesitter.withAllGrammars

            # cmp
            cmp-buffer
            cmp-path
            cmp-cmdline
            nvim-cmp

            # vsnip
            cmp-vsnip
            vim-vsnip
            friendly-snippets
        ];
        extraPackages = with pkgs; [
            lua-language-server
            gcc
        ];
    };
}
