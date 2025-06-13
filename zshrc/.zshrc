export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.local/bin:$PATH"

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

setopt inc_append_history

autoload -U zle
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

