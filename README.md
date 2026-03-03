# Dotfiles

Manage dotfiles by symlinking them from a Git repo into `$HOME`.

## Structure

- `config/` — subfolders are symlinked into `$HOME/.config/`
- `dotfiles/` — files are symlinked into `$HOME/` (prefixed with `.`)

## Usage

```sh
make init          # create symlinks
make dry-run       # preview what init would do
make clean         # remove managed symlinks and restore backups
make clean-dry-run # preview what clean would do
```

## How it works

- **Idempotent**: re-running `make init` skips targets that are already correctly linked.
- **Safe backups**: existing files are renamed with a timestamped `.bak` suffix (e.g. `.gitconfig.20260303141500.bak`), so repeated runs never overwrite previous backups.
- **Reversible**: `make clean` removes managed symlinks and restores the latest backup if one exists.
- **Dry-run**: both `init` and `clean` support `--dry-run` to preview actions without touching the filesystem.

## Getting started

1. Clone this repo
2. Add config folders to `config/` and dotfiles to `dotfiles/`
3. Run `make dry-run` to preview, then `make init` to apply
