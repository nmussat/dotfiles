#!/bin/bash

set -eu

[[ ! -d "$HOME/.config" ]] && mkdir -p "$HOME/.config"

for source in config/*/; do
    # Only process directory from the config/ folder
    [[ ! -d "$source" ]] && continue
    source="$(realpath "$source")"
    target="$HOME/.config/$(basename "$source")";
    test -L "$target" && mv "$target"{,.bak}; # symlink
    test -e "$target" && mv "$target"{,.bak}; # regular file or folder
    ln -s "$source" "$target";
done;


for source in dotfiles/*; do
    # Process both files and folders from the dotfiles directory
    source="$(realpath "$source")"
    target="$HOME/$(basename "$source")";
    test -L "$target" && mv "$target"{,.bak}; # symlink
    test -e "$target" && mv "$target"{,.bak}; # regular file or folder
    ln -s "$source" "$target";
done;
