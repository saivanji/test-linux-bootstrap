#
# ~/.bashrc
#
source /usr/share/git/completion/git-prompt.sh
export PS1='\W$(__git_ps1):\\$ '

set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vim='nvim'