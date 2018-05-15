HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source "${ZDOTDIR:-$HOME}/.aliases"
source "${ZDOTDIR:-$HOME}/.functions"
source "${ZDOTDIR:-$HOME}/.git-zsh-config"
source "${ZDOTDIR:-$HOME}/.keybindings"
# https://github.com/zsh-users/zsh-autosuggestions
source "${ZDOTDIR:-$HOME}/.zsh-autosuggestions"
source "${ZDOTDIR:-$HOME}/.prompt"

export PATH="$HOME/.yarn/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
