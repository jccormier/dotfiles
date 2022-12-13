#!/bin/zsh 

#export PATH=$HOME/bin:$PATH
export GPG_TTY="$(tty)"
export VIMCONFIG=$HOME/.vim
export FZF_DEFAULT_COMMAND="ag -u --nogroup --nocolor --column -g ''"
export JAVA_HOME=$(/usr/libexec/java_home -v 17)

