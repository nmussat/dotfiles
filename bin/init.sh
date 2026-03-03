#!/bin/bash

set -eu

[[ ! -d "$HOME/.config" ]] && mkdir -p "$HOME/.config"

for source in $(find config/ -type d -depth 1 | xargs realpath); do
    target="$HOME/.config/$(basename "$source")";
    test -L "$target" && mv "$target"{,.bak}; # symlink
    test -e "$target" && mv "$target"{,.bak}; # regular file or folder
    ln -s "$source" "$target";
done;


for source in $(find dotfiles/ -type f -depth 1 | xargs realpath); do
    target="$HOME/$(basename "$source")";
    test -L "$target" && mv "$target"{,.bak}; # symlink
    test -e "$target" && mv "$target"{,.bak}; # regular file or folder
    ln -s "$source" "$target";
done;
