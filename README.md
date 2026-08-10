# dotfiles

Personal macOS & Linux dotfiles, managed with [mise](https://mise.jdx.dev/).

## What's here

| Path | Purpose |
| --- | --- |
| `common/` | Shell config, scripts, and app configs shared across platforms (zsh, nvim, ghostty, lazygit, starship, etc.) |
| `macos/` | macOS-specific dotfiles (Aerospace, gitignore, lazygit path overrides) |
| `mise.toml` | Shared tools, symlink mappings, and setup tasks |
| `mise.macos.toml` | macOS-only packages, dotfiles, and system defaults |
| `mise.linux.toml` | Linux-only packages and dotfiles |

## Install

1. [Install mise](https://mise.jdx.dev/getting-started.html)
2. Clone this repo to `~/code/dotfiles`
3. Run the installer:

   ```sh
   mise run install
   ```

This bootstraps packages, symlinks dotfiles into place, and configures git, tmux, and rust.

## Notes

- Dependency versions are kept up to date automatically via [Renovate](https://docs.renovatebot.com/).
