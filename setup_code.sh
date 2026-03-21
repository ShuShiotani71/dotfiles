#!/usr/bin/env bash
set -e

ln -sf ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -sf ~/dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
while read line; do code --install-extension "$line"; done < vscode/extensions.txt
