# export PATH=/usr/local/bin:$PATH
export VISUAL=nvim
export EDITOR="$VISUAL"
export FZF_DEFAULT_COMMAND='fd --type f'

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

zstyle :compinstall filename '/home/personal/.zshrc'

autoload -Uz compinit vcs_info
compinit

# Vim mode
bindkey -v

ins_cursor() {
  echo -ne '\e[6 q'
}

cmd_cursor() {
  echo -ne '\e[2 q'
}

zle-keymap-select() {
  if [[ $KEYMAP == vicmd ]]; then
    cmd_cursor
  else
    ins_cursor
  fi
}

zle -N zle-keymap-select

# Backward history search
bindkey "^R" history-incremental-search-backward

# vcs info
function prompt() {
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%1~ ($vcs_info_msg_0_)› "
  else
    echo "%1~ › "
  fi
}

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
precmd_functions+=( ins_cursor )
setopt prompt_subst

PROMPT='$(prompt)'
zstyle ':vcs_info:git:*' formats '%b'

# snippets
function x() {
  exit
}

function l() {
  exa $@
}

function ll() {
  exa -la $@
}

function d() {
  git diff --name-only --diff-filter=d | xargs bat --diff
}

function ac() {
  git add .
  git commit -a -m "$1"
}

function p() {
  if [ -z "$1" ]; then
    git push
  else
    git push origin $1
  fi
}

function acp() {
  ac "$1"
  p
}

function cl() {
  clear
}
