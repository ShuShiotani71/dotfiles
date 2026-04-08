# change paths as needed
Remove-Item -Path "C:\Users\s.shiotani\AppData\Roaming\Code\User\settings.json" -Force
Remove-Item -Path "C:\Users\s.shiotani\AppData\Roaming\Code\User\keybindings.json" -Force
New-Item -ItemType SymbolicLink -Target "\\wsl.localhost\Ubuntu-24.04\home\sshiotani\dotfiles\vscode\settings.json" -Path "C:\Users\s.shiotani\AppData\Roaming\Code\User\settings.json"
New-Item -ItemType SymbolicLink -Target "\\wsl.localhost\Ubuntu-24.04\home\sshiotani\dotfiles\vscode\keybindings.json" -Path "C:\Users\s.shiotani\AppData\Roaming\Code\User\keybindings.json"

Get-Content -Path "\\wsl.localhost\Ubuntu-24.04\home\sshiotani\dotfiles\vscode\extensions.txt" | ForEach-Object {
    code --install-extension $_ --force
}
