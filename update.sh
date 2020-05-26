#!/bin/bash
############################
# update.sh
# This script updates all the submodules; I honestly don't know why it's necessary yet.
############################

git submodule update --remote --recursive

#fzf has actual binaries that need installing
~/.fzf/install
