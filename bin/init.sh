#!/bin/bash

set -e
set -u

for file in dotfiles/*; do
    target="$HOME/.$(basename $file)";
    test -L $target && mv $target{,.bak}; # symlink
    test -e $target && mv $target{,.bak}; # regular file or folder
    ln -s $(pwd)/$file $target;
done;

