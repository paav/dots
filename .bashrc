#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '

# Aliases
alias feh='feh -T default'
alias ls='ls -h --color'
alias less='less -r'
alias photoshop='wine .wine/drive_c/Program\ Files/Adobe/Adobe\ Photoshop\ CS2/Photoshop.exe >/dev/null 2>&1 &'

# Disable sofware flow control for using Ctrl+S
stty -ixon

export EDITOR="vim"

mupdf() {
    /usr/bin/mupdf "$@" &
}

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
export VIRTUALENVWRAPPER_VIRTUALENV=virtualenv2
source /usr/bin/virtualenvwrapper.sh

# Git autocomplete
. $HOME/scripts/git-completion.bash
