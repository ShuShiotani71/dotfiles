# Dotfiles
## Main idea
- The main philosophy behind my toolstack is to rely on as few tools as possible in order to reduce the amount of dependencies. Therefore I only use what is absolutely necessary and try to use what is found on most systems by default. Another important factor is AI integration; since most AI IDEs are vscode based, makes sense to use it for future-proofing.
Final point is ease of setup and customization; vscode is easy to set up and customize, and can basically do 90% of what neovim can, IMO. I have used things like neovim, wezterm, starship, ble.sh, etc in the past but have found them to be too time consuming to setup and customize and to keep track of. For me they weren't really worth it.
- Vscode acts as both an editor and terminal emulator. I rely purely on the vscode-vim extension for vim functionalities. This is advantageous because then I can use all the vim extensions (such as sneak and surround) anywhere, whereas if I had a separate terminal emulator then whenver I do $vim then would not have access to the extensions. You can of course do $code instead but you dont want to be launching vscode all the time.
- A separate .vimrc so that in case I need to work under a minimal setup I still have a .vimrc file that I can use (although without any of the extensions). Also by doing so I can avoid cluttering up settins.json
- tmux for window and session management; I intentionally do not rely on the emulator and IDE for this. You actually end up having to use tmux in a lot of places so to me it makes sense to use it instead of other options. Plus tmux is everywhere by default. Also by using tmux sessions you avoid overwhelming yourself with tabs which is nice.
- A custom prompt that does not rely on any external tools like starship; would rather not increase dependencies.

## Usage
1. If new laptop, do:
    ```
    # Linux
    $ bash install.sh && bash setup_vscode.sh

    # Windows
    .\setup_vscode.ps1 # powershell since vscode must exist on the windows side
    bash install.sh # WSL
    ```
1. If SSHing into local container, do:
    - ctrl+shift+p
    - Select: "Dev Containers: attach to running container"
    - After successfully SSHing you can clone this repo and run the following:
    ```
    $ bash install.sh && bash setup_vscode.sh
    ```
    For this, the **DevContainters** extension is required.
1. If SSHing into remote machine, do:
    - ctrl+shift+p
    - Select: "Remote-SSH: connect to host"
    - After successfully SSHing you can clone this repo and run the following:
    ```
    $ bash install.sh && bash setup_vscode
    ```
    For this, the  **Remote-SSH** extension is required.

Note that just SSHing does apply your local settings.json and keyboard.json automatically to the remote env, but does not automatically install your extensions; hence why its still required to run setup_vscode.sh (And you're right that the soft link bit isn't required but doesn't hurt so whatever).

## On Windows/WSL:
Definitely not my preference but might need to use Windows in certain situations in which case you would most likely be using WSL. Some notes on this:
- Not sure how but when you create symlink on windows side to settings.json which exists on the WSL side, the tilde symbol expands to the one on the WSL side, which is nice. So no need to worry about this.
- For $code command to work inside tmux sessions, you must first launch vscode with no tmux sessions running at all (just detaching is not enough). As long as you do that with the first vscode window, should be fine from then onward.
