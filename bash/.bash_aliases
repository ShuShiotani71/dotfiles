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

# Create nested directories with verbose output
alias mkdir='mkdir -pv'

# reload configuration
alias reload='. ~/.bashrc'

# Show $PATH in a readable format, with each path on a new line
alias path='echo -e ${PATH//:/\\n}'

# Safely prompt before overwriting, moving, or removing files
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Tmux
alias tm='tmux'
alias tma='tmux attach-session'
alias tmat='tmux attach-session -t'
alias tmka='tmux kill-session -a'
alias tmkt='tmux kill-session -t'
alias tml='tmux list-sessions'
# alias tmn='tmux new-session'
alias tmn='tmux new-session -As' # attach if exists else create

# ssh
alias eval_ssh='eval "$(ssh-agent -s)"'
