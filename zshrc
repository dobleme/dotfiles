autoload -Uz compinit
compinit

imports=(envs aliases)
for import in $imports ; do
    [ -f ~/.config/me/$import ] && source ~/.config/me/$import
done

# History
setopt inc_append_history
setopt share_history
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt append_history

# ZSH plugin imports
# plugins=(fzf-completion fzf-key-bindings)
# for plugins in $plugins ; do
#     [ -f ~/.config/zsh/$plugin ] && source ~/.config/zsh/$plugin
# done

eval "$(starship init zsh)"

source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
