autoload -Uz compinit
compinit

imports=(envs aliases)
for import in $imports ; do
    [ -f ~/.config/me/$import ] && source ~/.config/me/$import
done

# fzf zsh plugins
source ~/.config/zsh/plugins/fzf/shell/completion.zsh
source ~/.config/zsh/plugins/fzf/shell/key-bindings.zsh

# history
setopt inc_append_history
setopt share_history
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt append_history

# cd
setopt auto_cd

# key bindings
bindkey -e
bindkey -M emacs '^[[1;5B' beginning-of-line
bindkey -M emacs '^[[1;5A' end-of-line
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M emacs '^H' backward-kill-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M emacs '^R' fzf-history-widget
bindkey -M emacs '^F' fzf-file-widget
bindkey -M emacs '^[^F' fzf-cd-widget

eval "$(starship init zsh)"

# zsh syntax highlight plugin
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
