# --------------------------------------------------------------------------------
# General Zsh Settings
# --------------------------------------------------------------------------------

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# --------------------------------------------------------------------------------
# Imports
# --------------------------------------------------------------------------------

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# https://github.com/mathiasbynens/dotfiles
source "${ZDOTDIR:-$HOME}/.aliases"
source "${ZDOTDIR:-$HOME}/.functions"
source "${ZDOTDIR:-$HOME}/.git-zsh-config"
source "${ZDOTDIR:-$HOME}/.vim-zsh-config"
source "${ZDOTDIR:-$HOME}/.keybindings"
# https://github.com/zsh-users/zsh-autosuggestions
source "${ZDOTDIR:-$HOME}/.zsh-autosuggestions"
source "${ZDOTDIR:-$HOME}/.prompt"
# https://cloud.google.com/functions/docs/quickstart
# source "${ZDOTDIR:-$HOME}/google-cloud-sdk/path.zsh.inc";
# source "${ZDOTDIR:-$HOME}/google-cloud-sdk/completion.zsh.inc";

export PATH="$HOME/.yarn/bin:$PATH"

# settings for ubuntu on windows
if [[ `uname` == 'Linux' ]]; then
    export DISPLAY=:0.0

    alias home='cd /mnt/c/Users/felix.volny/Desktop'
    alias www='cd /mnt/c/Users/felix.volny/www'

    export NVM_DIR="/home/felix/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

    # for external screen
    # alias t='gnome-terminal --geometry=194x62'
    alias t='gnome-terminal --geometry=213x59'
    # for internal screen
    alias t2='gnome-terminal --geometry=126x34'
fi
