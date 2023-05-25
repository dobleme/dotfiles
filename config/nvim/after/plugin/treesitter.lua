require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
      "lua", "vim", "vimdoc",
      "sql", "bash", "diff", 
      "python", "go", "gomod", "gosum",
      "yaml", "json", "toml", "ini", "make",
      "markdown", "latex", "bibtex"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
