{ pkgs, config, nix-colors, ...}: let
  nix-colors-lib = nix-colors.lib.contrib { inherit pkgs; };
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      vim.cmd.colorscheme "nix-${config.colorScheme.slug}"

      vim.g.palette_base00 = "#${config.colorScheme.palette.base00}"
      vim.g.palette_base01 = "#${config.colorScheme.palette.base01}"
      vim.g.palette_base02 = "#${config.colorScheme.palette.base02}"
      vim.g.palette_base03 = "#${config.colorScheme.palette.base03}"
      vim.g.palette_base04 = "#${config.colorScheme.palette.base04}"
      vim.g.palette_base05 = "#${config.colorScheme.palette.base05}"
      vim.g.palette_base06 = "#${config.colorScheme.palette.base06}"
      vim.g.palette_base07 = "#${config.colorScheme.palette.base07}"
      vim.g.palette_base08 = "#${config.colorScheme.palette.base08}"
      vim.g.palette_base09 = "#${config.colorScheme.palette.base09}"
      vim.g.palette_base0A = "#${config.colorScheme.palette.base0A}"
      vim.g.palette_base0B = "#${config.colorScheme.palette.base0B}"
      vim.g.palette_base0C = "#${config.colorScheme.palette.base0C}"
      vim.g.palette_base0D = "#${config.colorScheme.palette.base0D}"
      vim.g.palette_base0E = "#${config.colorScheme.palette.base0E}"
      vim.g.palette_base0F = "#${config.colorScheme.palette.base0F}"
   
      ${builtins.readFile ./plugins.lua}
      '';
    extraPackages = with pkgs; [
      lua-language-server
      go 
      nil
      gcc
    ];
    plugins = with pkgs.vimPlugins; [
      (nix-colors-lib.vimThemeFromScheme { scheme = config.colorScheme; })
      nvim-treesitter.withAllGrammars
      gitsigns-nvim
      telescope-nvim
      which-key-nvim
      lualine-nvim
      nui-nvim
      noice-nvim

      #vim-nix
 
      ## cmp
      #cmp-buffer
      #cmp-path
      #cmp-cmdline
      #nvim-cmp
 
      ## vsnip
      #cmp-vsnip
      #vim-vsnip
      #friendly-snippets
    ];
  };
}
