#!/bin/bash

set -eu

bak_suffix=".bak.$(date +%Y%m%d%H%M%S)"

[[ ! -d "$HOME/.config" ]] && mkdir -p "$HOME/.config"

for source in config/*/; do
    # Only process directory from the config/ folder
    [[ ! -d "$source" ]] && continue
    source="$(realpath "$source")"
    target="$HOME/.config/$(basename "$source")";
    if [[ -L "$target" || -e "$target" ]]; then
        mv "$target" "$target$bak_suffix"
    fi
    ln -s "$source" "$target";
done;


for source in dotfiles/*; do
    # Process both files and folders from the dotfiles directory
    source="$(realpath "$source")"
    target="$HOME/$(basename "$source")";
    if [[ -L "$target" || -e "$target" ]]; then
        mv "$target" "$target$bak_suffix"
    fi
    ln -s "$source" "$target";
done;
