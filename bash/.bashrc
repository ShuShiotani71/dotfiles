# source some stuffs if exist
[ -f ~/.bash_aliases ] && source ~/.bash_aliases


# PS1
# not gonna use starship and stuff as I dont wanna introduce dependencies
generate_ps1() {
  # Load git prompt helper
  # Path varies by system; try common locations
  if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
  elif [ -f /usr/lib/git-core/git-sh-prompt ]; then
    source /usr/lib/git-core/git-sh-prompt
  else
    echo "git prompt not found!"
  fi

  # Colors
  CLR_GREEN='\[\033[01;32m\]'
  CLR_BLUE='\[\033[01;34m\]'
  CLR_RED='\[\033[01;31m\]'
  CLR_YELLOW='\[\e[1;33m\]'
  CLR_RESET='\[\033[00m\]'

  # Git prompt configuration
  # Shows:
  #   branch name
  #   * if dirty
  #   + if staged
  #   % if untracked files
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWSTASHSTATE=1

  # Build PS1
  PS1='${debian_chroot:+($debian_chroot)}'
  PS1+="${CLR_GREEN}\u@\h${CLR_RESET}:"
  PS1+="${CLR_BLUE}\w${CLR_RESET}"
  if declare -F __git_ps1 >/dev/null; then
    PS1+="${CLR_RED}\$(__git_ps1 ' (%s)')${CLR_RESET}"
  fi
  PS1+="\n${CLR_YELLOW}> ${CLR_RESET}"

  export PS1
}
generate_ps1


# start tmux automatically if interactive shell
if [[ $- == *i* ]] && [ -z "$TMUX" ]; then
  tmux new-session
fi


# use vim keybindings in terminal prompt
set -o vi
