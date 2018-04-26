HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# https://github.com/mathiasbynens/dotfiles
source "${ZDOTDIR:-$HOME}/.aliases"
source "${ZDOTDIR:-$HOME}/.functions"
source "${ZDOTDIR:-$HOME}/.git-zsh-config"
source "${ZDOTDIR:-$HOME}/.keybindings"
# https://github.com/zsh-users/zsh-autosuggestions
source "${ZDOTDIR:-$HOME}/.zsh-autosuggestions"
source "${ZDOTDIR:-$HOME}/.prompt"

export PATH="$HOME/.yarn/bin:$PATH"
