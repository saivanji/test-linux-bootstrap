export PATH=/usr/local/bin:$PATH
export VISUAL=nvim
export EDITOR="$VISUAL"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/personal/.zshrc'

autoload -Uz compinit vcs_info
compinit
# End of lines added by compinstall


precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'
