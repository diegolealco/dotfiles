# BASE CONFIG

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

if type brew &>/dev/null; then
  PATH="/usr/local/opt/python@3.7/bin:$PATH"
  FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
  chmod go-w "$(brew --prefix)/share"
  autoload -Uz compinit
fi

plugins=(git)
source $ZSH/oh-my-zsh.sh

# USER CONFIGURATION

if [[ "$(uname)" = "Darwin" ]]; then
  alias vim="mvim -v"
  export MANPATH="/usr/local/man:$MANPATH"
  # export WORKON_HOME="$HOME/.virtualenvs"
  # export PROJECT_HOME="$HOME/workspace"
  # export VIRTUALENVWRAPPER_PYTHON="/usr/local/opt/python@3.7/bin/python3.7"
  # source "/usr/local/bin/virtualenvwrapper.sh"
fi

alias la="ls -lAh"
export EDITOR='code'
export VISUAL="code"
export PATH="$HOME/.bin:$HOME/.fnm:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "`fnm env --multi`"

