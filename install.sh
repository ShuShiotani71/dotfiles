#!/usr/bin/env bash
set -e

# bash
if [ -f ~/.bashrc ]; then
    echo ". ~/dotfiles/bash/.bashrc" >> ~/.bashrc
else
    ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
fi
ln -sf ~/dotfiles/bash/.bash_aliases ~/.bash_aliases
ln -sf ~/dotfiles/bash/.inputrc ~/.inputrc

# others
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc

# apt
xargs -a apt/packages.txt sudo apt install -y
