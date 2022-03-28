#!/bin/zsh

[ -f $HOME/.zcreds ] && source $HOME/.zcreds

gpgconf --launch gpg-agent

[ -d $HOME/.rbenv ] && eval "$(rbenv init -)"
[ -f $HOME/.dir_colors ] && eval "$(gdircolors $HOME/.dir_colors)"
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

[ -f $HOME/.zaliases ] && source $HOME/.zaliases

export PATH=$HOME/bin:$PATH
