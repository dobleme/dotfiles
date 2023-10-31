{ pkgs, lib, config, ... }: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    prefix = "C-Space";
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    baseIndex = 1;
    escapeTime = 0;
    newSession = false;
    historyLimit = 10000;
    mouse = true;
    clock24 = true;
    extraConfig = with config.colorScheme.colors; ''
      set -ag terminal-overrides ',xterm-256color:RGB'
      set -g focus-events on
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Reloading config..."
      set -g renumber-windows on

      # Theme
      set-option -g status-style "fg=#${base04},bg=#${base01}"
      set-window-option -g window-status-style "fg=#${base04},bg=default"
      set-window-option -g window-status-current-style "fg=#${base0A},bg=default"
      set-option -g pane-border-style "fg=#${base01}"
      set-option -g pane-active-border-style "fg=#${base02}"
      set-option -g message-style "fg=#${base05},bg=#${base01}"
      set-option -g display-panes-active-colour "#${base0B}"
      set-option -g display-panes-colour "#${base0A}"
      set-window-option -g clock-mode-colour "#${base0B}"
      set-window-option -g mode-style "fg=#${base04},bg=#${base02}"
      set-window-option -g window-status-bell-style "fg=#${base01},bg=#${base08}"
    '';
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = tmux-thumbs;
        extraConfig = ''
         set -g @thumbs-key F
         set -g @thumbs-reverse enabled
         set -g @thumbs-unique enabled
         set -g @thumbs-command 'echo -n {} | xclip -sel clip'
        '';
      }
    ];
  };
}
