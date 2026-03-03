# Dotfiles management

Backup/Reuse dotfiles from a git repo.

- `config`: subfolders are symlinked in $HOME/.config/
- `dotfiles`: files are directly symlinked into $HOME/

Run `make init` to link files and folders.
Existing target files are renamed, not overwritten.

## TODO

- Indempotency: re-running `make init` should check if target is already properly symlinked to prevent recreating a temporary file.
- Backup will fail if the backup file already exists.
- Should list performed actions at the end of the script
- Eventually move from bash to higher level language (eg. python3?)

