[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_env ] && source ~/.bash_env

# custom prompt for displaying git branch
export OLD_PS1=$PS1
parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\] $(parse_git_branch)\[\033[00m\]'
BEGIN_YELLOW='\[\e[1;33m\]'
END_YELLOW='\[\e[m\]'
export PS1=${PS1}"\n${BEGIN_YELLOW}> ${END_YELLOW}"
