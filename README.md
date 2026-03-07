# Dotfiles
## Installation
```
$ bash install.sh
```
## Comments
- The main philosophy behind my toolstack is to rely on as few tools as possible in order to reduce the amount of dependencies. Therefore I only use what is absolutely necessary and try to use what is found on most systems by default.
- Vscode acts as both an editor and terminal emulator. I rely purely on the vscode-vim extension for vim functionalities. This is advantageous because then I can use all the vim extensions (such as sneak and surround) anywhere, whereas if I had a separate terminal emulator then whenver I do $vim then would not have access to the extensions. And you can do $code instead but you dont want to be launching vscode all the time.
- A separate .vimrc so that in case I need to work under a minimal setup I still have a .vimrc file that I can use (although without any of the extensions). Also by doing so I can avoid cluttering up settins.json
- tmux for window and session management; I intentionally do not rely on the emulator and IDE for this. You actually end up having to use tmux in a lot of places so to me it makes sense to use it instead of other options. Plus tmux is everywhere by default.
- A custom prompt that does not rely on any external tools like starship; would rather not increase dependencies.
