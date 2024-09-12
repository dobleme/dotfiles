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
