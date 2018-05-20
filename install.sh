# ask for password upfront
sudo -v

# HOMEBREW

read -p "
Do you want to install command line and GUI apps with Homebrew?
[y/N]: " -r Install_Apps
Install_Apps=${Install_Apps:-n}
if [[ "$Install_Apps" =~ ^(y|Y)$ ]]; then
  echo -e "\033[1m\033[34m==> Installing brew\033[0m"
  if [[ $(which brew) == "/usr/local/bin/brew" ]]
  then
      echo "Brew installed already, skipping"
  else
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  echo -e "\033[1m\033[34m==> Installing brew formulas\033[0m"
  brew bundle --file=~/.config/Brewfile
fi

# GIT

ln -sf ~/.config/git/gitconfig ~/.gitconfig
ln -sf ~/.config/git/gitignore ~/.gitignore

# AG

# agignore = gitignore
ln -sf ~/.config/git/gitignore ~/.agignore

# ZSH

# install sorin-ionescu/prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -sf ~/.config/zsh/zlogin.zsh ~/.zlogin
ln -sf ~/.config/zsh/zlogout.zsh ~/.zlogout
ln -sf ~/.config/zsh/zpreztorc.zsh ~/.zpreztorc
ln -sf ~/.config/zsh/zprofile.zsh ~/.zprofile
ln -sf ~/.config/zsh/zshenv.zsh ~/.zshenv
ln -sf ~/.config/zsh/zshrc.zsh ~/.zshrc

# change shell to zsh
# echo $(which zsh) >> /etc/shells
# chsh -s $(which zsh)
sudo dscl . -create /Users/$USER UserShell $(which zsh)

# JAVASCRIPT

ln -sf ~/.config/javascript/editorconfig ~/.editorconfig
ln -sf ~/.config/javascript/prettierignore ~/.prettierignore
ln -sf ~/.config/javascript/eslintignore ~/.eslintignore
ln -sf ~/.config/javascript/eslintrc ~/.eslintrc
ln -sf ~/.config/javascript/prettierrc ~/.prettierrc

# install global JS dependencies
cd ~/.config/yarn/global && yarn

# TMUX

ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/.config/tmux/tmux.conf.local ~/.tmux.conf.local

# install tmux plugins
tmux start-server
tmux new-session -d
~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server

# NVIM

# install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vim plugins
nvim -E -c PlugInstall -c qall
# vim needs to restart and run UpdateRemotePlugins
nvim -E -c UpdateRemotePlugins -c qall

# dependencies for nvim (confirm with `nvim -c checkhealth` that all is ok)
# NOTE needs `gem`, `python@2` and `python@3` from brew, `neovim` from yarn
pip2 install --user --upgrade neovim
pip3 install --user --upgrade neovim
gem install neovim
# yarn global add neovim

# ITERM2

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.config/iterm"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
