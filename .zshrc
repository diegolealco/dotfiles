export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
  PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
  PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"
  chmod go-w "$(brew --prefix)/share"
  autoload -Uz compinit
  compinit
fi

plugins=(git)
source $ZSH/oh-my-zsh.sh

# USER CONFIGURATION

if [[ "$(uname)" = "Darwin" ]]; then
  alias vim="nvim -v"
  MANPATH="/usr/local/man:$MANPATH"
fi

alias la="ls -lAh"
alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

EDITOR='vim'
VISIAL="vim"
PATH="$HOME/.fnm:$PATH"
PATH="$HOME/.local/bin:$PATH"

# export WORKON_HOME="$HOME/.virtualenvs"
# export PROJECT_HOME="$HOME/workspace"
# export VIRTUALENVWRAPPER_PYTHON="/Library/Frameworks/Python.framework/Versions/3.7/bin/python3"
# source "/Library/Frameworks/Python.framework/Versions/3.7/bin/virtualenvwrapper.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "`fnm env --multi`"

export PATH
export MANPATH
export EDITOR
export VISUAL

