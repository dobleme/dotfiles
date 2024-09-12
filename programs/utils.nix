{pkgs, config, ...}: {
  home.packages = with pkgs; [
    ripgrep
    csvdiff
    xsv
    jaq
    fd
  ];
  
  programs.bat = {
    enable = true;
    config = { theme = "base16"; }; # This is not base 16 theme
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = ["-p 65%,45%"];
    };
    colors = with config.colorScheme.palette; {
      bg = "#${base00}"; "bg+" = "#${base01}";
      fg = "#${base04}"; "fg+" = "#${base06}";
      hl = "#${base0D}"; "hl+" = "#${base0D}";
      spinner = "#${base0C}";
      header = "#${base0D}";
      info = "#${base0A}";
      pointer = "#${base0C}";
      marker = "#${base0C}";
      prompt = "#${base0A}";
    };
  };
}
