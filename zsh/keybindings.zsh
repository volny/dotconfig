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

# remove ctrl-r, we need it for fzf history search
bindkey -r "^r"

# bindkey '^s' clear-screen
# ok, so that's a hack - use vi bindings
bindkey -s '^s' 'jkddiclear^M'

bindkey -M viins 'jk' vi-cmd-mode

# dont unintentially kill my shell with ctrl-d
set -o ignoreeof
IGNOREEOF=10   # Shell only exists after the 10th consecutive Ctrl-d
