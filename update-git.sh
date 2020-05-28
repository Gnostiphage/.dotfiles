#!/bin/bash
############################
# update-submodules.sh
# This script updates all the submodules; I honestly don't know why it's necessary yet.
############################
dir="$( cd "$( dirname "${BASH_SOURCE[0]}"   )" >/dev/null 2>&1 && pwd   )"

git submodule update --remote --recursive

# fzf has actual binaries that need installing
~/.fzf/install

# remove recursive links that fzf's install script creates (mistake? idk)
rm -f $dir/tmux/tmux
rm -f $dir/vim/vim
rm -f $dir/oh-my-zsh/oh-my-zsh
rm -f $dir/tmux-plugins/tmux-plugins

# if any of the parent directories' submodules get updated,
# they'll need their plugin links again
ln -s ../../../powerlevel10k $dir/oh-my-zsh/custom/themes/powerlevel10k
ln -s ../../../zsh-syntax-highlighting $dir/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -s ../tmux-plugins $dir/tmux/plugins
