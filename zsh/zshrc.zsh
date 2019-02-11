# https://github.com/zsh-users/zsh-completions
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

# source zpresto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# source the blox prompt + customizations
source "${ZDOTDIR:-$HOME}/.config/zsh/prompt.zsh"
# https://github.com/zsh-users/zsh-autosuggestions
source "${ZDOTDIR:-$HOME}/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
# source nvm as a zsh plugin (https://github.com/lukechilds/zsh-nvm)
source "${ZDOTDIR:-$HOME}/.config/zsh/zsh-nvm/zsh-nvm.plugin.zsh"

# custom config
source "${ZDOTDIR:-$HOME}/.config/zsh/aliases.zsh"
source "${ZDOTDIR:-$HOME}/.config/zsh/functions.zsh"
source "${ZDOTDIR:-$HOME}/.config/zsh/keybindings.zsh"
source "${ZDOTDIR:-$HOME}/.config/zsh/git.zsh"
source "${ZDOTDIR:-$HOME}/.config/zsh/docker.zsh"
source "${ZDOTDIR:-$HOME}/.config/zsh/fzf.zsh"
source "${ZDOTDIR:-$HOME}/.config/zsh/autojump.zsh"

# override prezto and plugins here
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory autocd extendedglob nomatch notify nosharehistory incappendhistory
unsetopt beep

