#
# ~/.bashrc
#
export PATH=~/.local/bin:/usr/local/bin:$PATH

source /usr/share/git/completion/git-prompt.sh
export PS1='\W$(__git_ps1)› '

set -o vi

export VISUAL=nvim
export EDITOR="$VISUAL"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vim='nvim'
alias x='exit'

export FZF_DEFAULT_COMMAND='fd --type f'
export PASSWORD_STORE_CLIP_TIME='10'