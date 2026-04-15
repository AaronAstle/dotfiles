# Dotfiles Quick Start

This repo contains two main parts:

1. `vimfiles/` for Vim config, plugins, and install/update scripts.
2. `copilot/` for portable Copilot skills and MCP markdown files.

## Quick setup

Use Git Bash/WSL and run:

```bash
git clone https://github.com/AaronAstle/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/vimfiles ~/vimfiles
bash ~/dotfiles/vimfiles/bin/install
```

`vimfiles/bin/install` will:

1. Ensure `~/_vimrc` points to `~/vimfiles/vimrc`
2. Install/update Vim plugins
3. Prompt to sync Copilot assets into the active `~/.copilot` directory

## Copilot sync commands

Copy repo-managed Copilot files to the active Copilot home:

```bash
bash ~/dotfiles/copilot/bin/sync-to-copilot-home --prompt
```

Pull current Copilot skills/MCP markdown from `~/.copilot` back into this repo:

```bash
bash ~/dotfiles/copilot/bin/sync-from-copilot-home --prompt
```

## Vim maintenance

Update Vim config and plugins:

```bash
bash ~/dotfiles/vimfiles/bin/update
```

One-time cleanup path for older vim setups:

```bash
bash ~/dotfiles/vimfiles/bin/upgrade
```

For full plugin details and advanced Vim usage, see `vimfiles/README.md`.
