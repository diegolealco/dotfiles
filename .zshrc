# BASE CONFIG

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
  chmod go-w "$(brew --prefix)/share"
  autoload -Uz compinit
fi

plugins=(git)
source $ZSH/oh-my-zsh.sh

# USER CONFIGURATION

if [[ "$(uname)" = "Darwin" ]]; then
  export MANPATH="/usr/local/man:$MANPATH"
fi

export FZF_DEFAULT_COMMAND='fd --type f'
alias vim="nvim"
alias la="ls -lAh"
export EDITOR='nvim'
export VISUAL="nvim"
export PATH="$HOME/.bin:$HOME/.fnm:$PATH"
eval "`fnm env`"

