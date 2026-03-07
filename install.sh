#!/usr/bin/env bash
set -e

# bash
if [ -f ~/.bashrc ]; do
    echo ". ~/dotfiles/bash/.bashrc" >> ~/.bashrc
else
    ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
ln -sf ~/dotfiles/bash/.bash_aliases ~/.bash_aliases
ln -sf ~/dotfiles/bash/.inputrc ~/.inputrc

# others
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc

# vscode
ln -sf ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -sf ~/dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
while read line; do code --install-extension "$line"; done < vscode/extensions.txt
