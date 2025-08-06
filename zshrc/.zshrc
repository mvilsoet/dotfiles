# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
alias pia=~/Packages/pia-linux.run
alias neofetch='fastfetch'

export EDITOR="code --wait"
export VISUAL="code --wait"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
