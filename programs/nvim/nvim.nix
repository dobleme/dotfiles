{pkgs, ...}: {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        extraLuaConfig = ''
            ${builtins.readFile ./options.lua}
            ${builtins.readFile ./treesitter.lua}
            ${builtins.readFile ./telescope.lua}
            ${builtins.readFile ./gitsigns.lua}
            ${builtins.readFile ./whichkey.lua}
        '';
        plugins = with pkgs.vimPlugins; [
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
