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

  echo -e "\033[1m\033[34m==> Installing command line apps\033[0m"
  xargs brew install < ~/.config/brew/brewlist

  echo -e "\033[1m\033[34m==> Installing GUI apps\033[0m"
  xargs brew cask install < ~/.config/brew/brewcasklist

  echo -e "\033[1m\033[34m==> Installing fonts\033[0m"
  brew tap caskroom/fonts
  brew cask install font-hack-nerd-font
fi

# GIT

ln -sf ~/.config/git/gitconfig ~/.gitconfig
ln -sf ~/.config/git/gitignore ~/.gitignore

# AG

# agignore = gitignore
ln -sf ~/.config/git/gitignore ~/.config/ag/ignore

# ZSH

ln -sf ~/.config/zsh/aliases.zsh ~/.aliases
ln -sf ~/.config/zsh/functions.zsh ~/.functions
ln -sf ~/.config/zsh/git.zsh ~/.git-zsh-config
ln -sf ~/.config/zsh/blox-zsh-theme/blox.zsh ~/.prompt
ln -sf ~/.config/zsh/zlogin.zsh ~/.zlogin
ln -sf ~/.config/zsh/zlogout.zsh ~/.zlogout
ln -sf ~/.config/zsh/zpreztorc.zsh ~/.zpreztorc
ln -sf ~/.config/zsh/zprofile.zsh ~/.zprofile
ln -sf ~/.config/zsh/zshenv.zsh ~/.zshenv
ln -sf ~/.config/zsh/zshrc.zsh ~/.zshrc
ln -sf ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ~/.zsh-autosuggestions
ln -sf ~/.config/zsh/keybindings.zsh ~/.keybindings

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

# NVIM

# install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vim plugins
nvim -E -c PlugInstall -c UpdateRemotePlugins -c qall

# ITERM2

# TODO

