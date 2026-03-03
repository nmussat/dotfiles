#!/bin/bash

set -eu

dry_run=false
[[ "${1:-}" == "--dry-run" ]] && dry_run=true

bak_suffix=".bak.$(date +%Y%m%d%H%M%S)"
linked=0
skipped=0
backed_up=0

$dry_run && echo "Dry run mode — no changes will be made"

$dry_run || [[ -d "$HOME/.config" ]] || mkdir -p "$HOME/.config"

for source in config/*/; do
    # Only process directory from the config/ folder
    [[ ! -d "$source" ]] && continue
    source="$(realpath "$source")"
    target="$HOME/.config/$(basename "$source")";
    if [[ "$(readlink "$target")" == "$source" ]]; then
        echo "  skip: $target (already linked)"
        ((skipped++))
        continue
    fi
    if [[ -L "$target" || -e "$target" ]]; then
        echo "  backup: $target -> $target$bak_suffix"
        $dry_run || mv "$target" "$target$bak_suffix"
        ((backed_up++))
    fi
    echo "  link: $target -> $source"
    $dry_run || ln -s "$source" "$target";
    ((linked++))
done;


for source in dotfiles/*; do
    # Process both files and folders from the dotfiles directory
    source="$(realpath "$source")"
    target="$HOME/.$(basename "$source")";
    if [[ "$(readlink "$target")" == "$source" ]]; then
        echo "  skip: $target (already linked)"
        ((skipped++))
        continue
    fi
    if [[ -L "$target" || -e "$target" ]]; then
        echo "  backup: $target -> $target$bak_suffix"
        $dry_run || mv "$target" "$target$bak_suffix"
        ((backed_up++))
    fi
    echo "  link: $target -> $source"
    $dry_run || ln -s "$source" "$target";
    ((linked++))
done;

echo ""
echo "Done: $linked linked, $skipped skipped, $backed_up backed up"
