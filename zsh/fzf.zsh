# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# use fd instead of find to make fzf respect gitignore!
# https://github.com/junegunn/fzf#respecting-gitignore
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# ctrl-o to open file in vim & always show preview
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvim {})+abort' --preview 'bat --color \"always\" {}'"
# don't show preview
# export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvim {})+abort'"

