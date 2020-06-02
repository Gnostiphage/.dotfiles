#!/bin/bash
############################
# update-git.sh
# This script pulls the latest git revision, and initializes any plugins that 
# may have appeared
############################
dir="$( cd "$( dirname "${BASH_SOURCE[0]}"   )" >/dev/null 2>&1 && pwd   )"

git pull
git submodule update --init --recursive

if git submodule foreach 'git status' | grep -A2 "'fzf'" | grep "up to date" ; then
    echo "fzf is good"
else
    # fzf has actual binaries that need installing
    ~/.fzf/install
    # remove recursive links that fzf's install script creates (mistake? idk)
    rm -f $dir/tmux/tmux
    rm -f $dir/vim/vim
    rm -f $dir/oh-my-zsh/oh-my-zsh
fi
