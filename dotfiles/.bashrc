# if not running interactively, do nothing
[ -z "$PS1" ] && return

# disable ctrl-s and ctrl-q
stty -ixon

HISTCONTROL=ignoreboth # ignoredups, ignorespace
HISTTIMEFORMAT="%h %d %H:%M:%S> "
HISTSIZE= HISTFILESIZE= # Infinite history
HISTIGNORE="history*"

# append to the history file, do not overwrite it
shopt -s histappend

# update $LINES and $COLUMNS baseed on the size of the window
shopt -s checkwinsize

# bash completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# make less more friendly for non-text input files, see lesspipe(1)
if [ -x "/usr/bin/lesspipe" ]; then
    eval "$(SHELL=/bin/sh lesspipe)"
fi

# prompt
PS1="\n \[\033[01;34m\]\w \[\033[00m\]\$ "
PROMPT_DIRTRIM=2

# directory and list colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ "$(uname)" = "Darwin" ]; then
    VISUAL="mvim -v"

    if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
        . "$(brew --prefix)/etc/bash_completion"
    elif [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]; then
        . "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
    fi

    if [ -d "$(brew --prefix coreutils)/libexec/gnubin" ]; then
        export PATH="$PATH:$(brew --prefix coreutils)/libexec/gnubin"
    fi

    export WORKON_HOME="$HOME/.virtualenvs"
    export PROJECT_HOME="$HOME/Desktop"
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ "$(uname)" = "Linux" ]; then
    VISUAL="vim"

    open () {
        xdg-open "$@" &>/dev/null
    }
fi

if [ -x /usr/bin/dircolors ]; then
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ls='ls --color=auto'
fi

alias vim="$VISUAL"
alias la="ls -gGAh"
alias ll="la"
alias df="df -h"
alias du="du -ch"
alias bc="bc -l"
alias free="free -m"
alias tree="tree -FC"
alias cd..="cd .."
alias ..="cd .."
alias bashrc="$VISUAL $HOME/.bashrc && . $HOME/.bashrc"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias python=python3
alias pip=pip3

export VISUAL
export EDITOR="$VISUAL"
export PATH="$HOME/workspace/monorepo/bin:$PATH"

# fnm
export PATH=/home/diego/.fnm:$PATH
eval "`fnm env --multi`"

