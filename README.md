# Dotfiles

Here is my new dotfiles management repository using [Chezmoi](https://github.com/twpayne/chezmoi)

## Install

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply anypot
```

Depending on the options selected during the installation, you may encounter errors
on the first run. If you encounter an error, run `chezmoi apply`.

## Daily Usage

After Chezmoi is installed, use the following commands.

```bash
# Initialize chezmoi configuration and apply the dotfiles (first run)
chezmoi init anypot

# Check for common problems.
chezmoi doctor

# Update dotfiles from the source directory.
chezmoi apply

# Pull the latest changes from your remote repo and runs chezmoi apply.
chezmoi update
```

Note that if chezmoi hangs waiting for user input, you will need to kill the process
(`killall chezmoi`) and run `apply` manually, because chezmoi locks the database.
