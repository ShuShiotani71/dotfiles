# the usual stuff
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'

# Navigate up directories quickly
alias ..='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias mkdir='mkdir -pv'
alias reload='. ~/.bashrc'
alias path='echo -e ${PATH//:/\\n}'
alias h='history'
alias c='code'
alias count_items='ls -1 | wc -l'
alias count_lines='find . -type f -exec wc -l {} +'

# Tmux
alias tm='tmux'
alias tma='tmux attach-session'
alias tmat='tmux attach-session -t'
alias tmka='tmux kill-session -a'
alias tmkt='tmux kill-session -t'
alias tml='tmux list-sessions'
alias tmn='tmux new-session -As' # attach if exists else create

# ssh
alias eval_ssh='eval "$(ssh-agent -s)"'
