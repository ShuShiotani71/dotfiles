#!/usr/bin/env bash
set -e

# files (f flag replaces file if exists)
ln -sf ~/dotfiles/bash/bashrc ~/.bashrc             # only for containers
ln -sf ~/dotfiles/bash/bash_aliases ~/.bash_aliases # only for containers
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml

# directories (must remove directory manually first)
rm -rf ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim
rm -rf ~/.config/wezterm
ln -s ~/dotfiles/wezterm ~/.config/wezterm
