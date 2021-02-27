export ZSH="/home/dobleme/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting sudo docker docker-compose)

source $ZSH/oh-my-zsh.sh

# export PATH="$HOME/.local/bin:$PATH"
export GOPATH=$HOME/.go
export PATH="${GOPATH}:/usr/local/go/bin:${HOME}/.npm-global/bin:${PATH}"
# export NPM_CONFIG_PREFIX=~/.npm-global
export EDITOR="vim"

# Aliases
alias v="vim"
alias gti="git"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
