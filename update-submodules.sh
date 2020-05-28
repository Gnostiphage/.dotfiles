#!/bin/bash
############################
# update-submodules.sh
# This script updates all the submodules, putting links in as necessary
############################
dir="$( cd "$( dirname "${BASH_SOURCE[0]}"   )" >/dev/null 2>&1 && pwd   )"

git submodule update --remote --recursive

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

# if any of the parent directories' submodules get updated,
# they'll need their plugin links again
if git submodule foreach 'git status' | grep -A2 "'oh-my-zsh'" | grep "up to date" ; then
    echo "oh-my-zsh is good"
else
    ln -s ../../../powerlevel10k $dir/oh-my-zsh/custom/themes/powerlevel10k
fi
if git submodule foreach 'git status' | grep -A2 "'oh-my-zsh'" | grep "up to date" ; then
    echo "oh-my-zsh is good"
else
    ln -s ../../../zsh-syntax-highlighting $dir/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi
if git submodule foreach 'git status' | grep -A2 "'oh-my-zsh'" | grep "up to date" ; then
    echo "oh-my-zsh is good"
else
    ln -s ../tmux-plugins $dir/tmux/plugins
fi
