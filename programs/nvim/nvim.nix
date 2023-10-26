{pkgs, ...}: {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        extraLuaConfig = ''
            ${builtins.readFile ./options.lua}
            ${builtins.readFile ./telescope.lua}
            ${builtins.readFile ./gitsigns.lua}
            ${builtins.readFile ./whichkey.lua}
        '';
        plugins = with pkgs.vimPlugins; [
            telescope-nvim
            gitsigns-nvim
            which-key-nvim
            (nvim-treesitter.withPlugins (p: [ p.lua p.nix p.go p.python ]))
        ];
        extraPackages = with pkgs; [
            xclip
        ];
    };
}
