# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# https://github.com/zsh-users/zsh-completions
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

# source zpresto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# source  prompt + customizations
source "${ZDOTDIR:-$HOME}/.config/zsh/prompt.zsh"
# https://github.com/zsh-users/zsh-autosuggestions
source "${ZDOTDIR:-$HOME}/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
#
# source nvm as a zsh plugin (https://github.com/lukechilds/zsh-nvm)
# source "${ZDOTDIR:-$HOME}/.config/zsh/zsh-nvm/zsh-nvm.plugin.zsh"

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

# to be able to use the same configuration from a terminal without true color support
if [[ $COLORTERM != (24bit|truecolor) && ${terminfo[colors]} -ne 16777216 ]]; then
  zmodload zsh/nearcolor
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
