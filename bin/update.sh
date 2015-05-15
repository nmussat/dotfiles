#!/bin/bash

set -e
set -u

git submodule update --init --recursive

vim +PluginInstall +qall

cd dotfiles/vim/bundle/YouCompleteMe && ./install.sh

for file in $(find dotfiles/vim/bundle -name Makefile -maxdepth 2); do
    (cd $(dirname $file) && make);
done;

