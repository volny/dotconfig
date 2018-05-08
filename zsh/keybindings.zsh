# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html

bindkey -v

# delay between switching modes (in ms) <-- keep this above 10 for sequences like 'jk' to work
export KEYTIMEOUT=10

# READLINE

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey '^w' backward-kill-word
bindkey '^e' end-of-line
bindkey '^a' beginning-of-line
bindkey '^f' forward-word

# actually I wanted this to be `gg`, but that seems not to be possible
bindkey '^s' clear-screen -s 'clear^M'
# would be nice to run `clear-screen` first, then `clear^M`, for mulitline prompt
# bindkey -s '^s' 'clear^M'

bindkey -M viins 'jk' vi-cmd-mode

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
