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

# TODO
# https://www.google.co.th/search?q=zsh+vi-cmd-mode
# https://superuser.com/questions/151803/how-do-i-customize-zshs-vim-mode/156204#156204
# https://superuser.com/questions/351499/how-to-switch-comfortably-to-vi-command-mode-on-the-zsh-command-line#comment1047582_353127
# executes the current line, as you would expect <CR> - sadly doesn't work for keys without modifiers (?)
#bindkey '^k' accept-line
# enter command mode!
#bindkey '^j' vi-cmd-mode
#bindkey -M viins 'jj' vi-cmd-mode

