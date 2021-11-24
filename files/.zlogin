#!/bin/zsh

export PATH=$HOME/bin:$PATH
export GPG_TTY="$(tty)"

[ -f $HOME/.zcreds ] && source $HOME/.zcreds

