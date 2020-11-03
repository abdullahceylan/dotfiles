#!/bin/bash

DOTFILES_PATH=~/.dotfiles
BASH_SRC_PATH=$DOTFILES_PATH/bash

#. "$BASH_SRC_PATH"/.prompt
. "$BASH_SRC_PATH"/.aliases
. "$BASH_SRC_PATH"/.functions

# System Specific
source "$BASH_SRC_PATH"/.profile
if [ -f "$BASH_SRC_PATH"/.git-completion.bash ]; then
  . "$BASH_SRC_PATH"/.git-completion.bash
fi

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# edit this folder (profile.dotfiles)
alias p.dot="cd ~/.dotfiles"
# reload (profile.reload)
alias p.rl="source ~/.profile; echo '~/.profile reloaded.'"


