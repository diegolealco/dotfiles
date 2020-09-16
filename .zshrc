export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
  MANPATH="/usr/local/man:$MANPATH"
fi

alias la="ls -lAh"
alias gamma="xrandr --output eDP-1 --gamma 0.8:0.8:0.8"

EDITOR='vim'
VISIAL="vim"
PATH="$HOME/.fnm:$PATH"
PATH="$HOME/.local/bin:$PATH"

# export WORKON_HOME="$HOME/.virtualenvs"
# export PROJECT_HOME="$HOME/workspace"
# export VIRTUALENVWRAPPER_PYTHON="/usr/local/opt/python@3.7/bin/python3.7"
# source "/usr/local/bin/virtualenvwrapper.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "`fnm env --multi`"

export PATH
export MANPATH
export EDITOR
export VISUAL

