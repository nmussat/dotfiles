#!/bin/bash

set -e
set -u

git submodule update --init --recursive
for file in $(find dotfiles/vim/bundle -name Makefile -depth 2); do
    (cd $(dirname $file) && make);
done;

vim +PluginInstall +qall
cd dotfiles/vim/bundle/YouCompleteMe && ./install.sh
