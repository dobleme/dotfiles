{ pkgs, lib, config, ...}: let
    colors = with config.colorScheme.colors; pkgs.substituteAll {
        src = ./colors.lua;
        base00 = base00; base01 = base01; base02 = base02; base03 = base03;
        base04 = base04; base05 = base05; base06 = base06; base07 = base07;
        base08 = base08; base09 = base09; base0A = base0A; base0B = base0B;
        base0C = base0C; base0D = base0D; base0E = base0E; base0F = base0F;
    };
in {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        extraLuaConfig = ''
            ${builtins.readFile ./options.lua}
            ${builtins.readFile colors}
            ${builtins.readFile ./treesitter.lua}
            ${builtins.readFile ./telescope.lua}
            ${builtins.readFile ./gitsigns.lua}
            ${builtins.readFile ./whichkey.lua}
        '';
        plugins = with pkgs.vimPlugins; [
            nvim-base16
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
