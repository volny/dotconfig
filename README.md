# Development Environment Configuration

Defaults for getting up to speed with neovim, tmux, zsh, git, javascript

## Requirements

- MacOS. Apps are installed with Homebrew, which is MacOS only. If you run another OS you're welcome to swap it out for your package manager of choice. Except for Homebrew and iTerm2 things should work on Linux too.
- All other requirements should be installed automatically from Homebrew and npm.

## Installation

This repos is designed to be installed as the `~/.config` directory. If you already have that dir move it out of the way by doing something like `mv ~/.config ~/.config_old`. You can later merge it's contents back together.

- `git clone --recursive git@github.com:volny/dotconfig.git .config`. The `recursive` flag is needed to fetch [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) as a submodule.
- open `~/.config/git/gitconfig` in your editor of choice and swap out my credentials for yours. You might also want to go through the lists in `brew/` and remove/add applications to be installed
- run `./install.sh`

## Todo

- install a powerline font or make sure one is installed
- sync iterm2 settings
