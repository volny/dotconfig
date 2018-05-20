HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# source zpresto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# source the blox prompt + customizations
source "${ZDOTDIR:-$HOME}/.prompt"
# https://github.com/zsh-users/zsh-autosuggestions
source "${ZDOTDIR:-$HOME}/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
# custom config
source "${ZDOTDIR:-$HOME}/.config/zsh/aliases.zsh"
source "${ZDOTDIR:-$HOME}/.config/zsh/functions.zsh"
source "${ZDOTDIR:-$HOME}/.config/zsh/git.zsh"
source "${ZDOTDIR:-$HOME}/.config/zsh/keybindings.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
