#!/usr/bin/env bash

set -eu

dry_run=false
[[ "${1:-}" == "--dry-run" ]] && dry_run=true

removed=0
restored=0
skipped=0

$dry_run && echo "Dry run mode — no changes will be made"

restore_backup() {
    local target="$1"
    # Find the latest .bak file by sorted timestamp in the filename
    local latest
    latest="$(ls -1 "$target".*.bak 2>/dev/null | sort -r | head -n1)"
    if [[ -n "$latest" ]]; then
        echo "  restore: $latest -> $target"
        $dry_run || mv "$latest" "$target"
        restored=$((restored + 1))
    fi
}

for source in config/*/; do
    [[ ! -d "$source" ]] && continue
    source="$(realpath "$source")"
    target="$HOME/.config/$(basename "$source")"
    if [[ "$(readlink "$target")" == "$source" ]]; then
        echo "  remove: $target"
        $dry_run || rm "$target"
        removed=$((removed + 1))
        restore_backup "$target"
    else
        echo "  skip: $target (not managed)"
        skipped=$((skipped + 1))
    fi
done

for source in dotfiles/*; do
    source="$(realpath "$source")"
    target="$HOME/.$(basename "$source")"
    if [[ "$(readlink "$target")" == "$source" ]]; then
        echo "  remove: $target"
        $dry_run || rm "$target"
        removed=$((removed + 1))
        restore_backup "$target"
    else
        echo "  skip: $target (not managed)"
        skipped=$((skipped + 1))
    fi
done

echo ""
echo "Done: $removed removed, $restored restored, $skipped skipped"
