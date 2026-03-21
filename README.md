# Dotfiles
## Installation
```
# for system level things; expected to be run locally for the
# first time, as well as for containers
$ bash install.sh

# for vscode stuff; to be run locally if you're just sshing into
# containers using extension
$ bash setup_vscode.sh
```
## Comments
- The main philosophy behind my toolstack is to rely on as few tools as possible in order to reduce the amount of dependencies. Therefore I only use what is absolutely necessary and try to use what is found on most systems by default. Another important factor is AI integration; since most AI IDEs are vscode based, makes sense to use it for future-proofing.
Final point is ease of setup and customization; vscode is easy to set up and customize, and can basically do 90% of what neovim can, IMO. I have used things like neovim, wezterm, starship, ble.sh, etc in the past but have found them to be too time consuming to setup and customize and to keep track of. For me they weren't really worth it.
- Vscode acts as both an editor and terminal emulator. I rely purely on the vscode-vim extension for vim functionalities. This is advantageous because then I can use all the vim extensions (such as sneak and surround) anywhere, whereas if I had a separate terminal emulator then whenver I do $vim then would not have access to the extensions. You can of course do $code instead but you dont want to be launching vscode all the time.
- A separate .vimrc so that in case I need to work under a minimal setup I still have a .vimrc file that I can use (although without any of the extensions). Also by doing so I can avoid cluttering up settins.json
- tmux for window and session management; I intentionally do not rely on the emulator and IDE for this. You actually end up having to use tmux in a lot of places so to me it makes sense to use it instead of other options. Plus tmux is everywhere by default.
- A custom prompt that does not rely on any external tools like starship; would rather not increase dependencies.
