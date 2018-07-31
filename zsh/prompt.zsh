# https://github.com/yardnsm/blox-zsh-theme
source "${ZDOTDIR:-$HOME}/.config/zsh/blox-zsh-theme/blox.zsh"

BLOX_SEG__UPPER_LEFT=( host cwd git )
# time disabled
BLOX_SEG__UPPER_RIGHT=( bgjobs nodejs )
BLOX_SEG__LOWER_LEFT=( symbol )
# TODO vi-mode is set below, but should be set here as a 'block'
BLOX_SEG__LOWER_RIGHT=( )

BLOX_BLOCK__SYMBOL_SYMBOL=λ

# show which vim mode we are in
precmd() {
  RPROMPT=""
}

zle-keymap-select() {
  RPROMPT=""
  [[ $KEYMAP = vicmd ]] && RPROMPT="[NORMAL]"
  () { return $__prompt_status }
  zle reset-prompt
}

zle-line-init() {
  typeset -g __prompt_status="$?"
}

zle -N zle-keymap-select
zle -N zle-line-init
