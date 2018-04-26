bindkey -v

# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^e' end-of-line
bindkey '^a' beginning-of-line
bindkey '^f' forward-word
