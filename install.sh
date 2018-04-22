# HOMEBREW

echo -n "Do you want to install Homebrew? Answer no if you already have it. (y/n)? "
read installBrew

if [ "$installBrew" != "${installBrew#[Yy]}" ] ;then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install apps
xargs brew install < brew/brewlist
xargs brew cask install < brew/brewcasklist

# install font
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

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
ln -sf ~/.config/zsh/vim.zsh ~/.vim-zsh-config
ln -sf ~/.config/zsh/prompt.zsh ~/.prompt
ln -sf ~/.config/zsh/zlogin.zsh ~/.zlogin
ln -sf ~/.config/zsh/zlogout.zsh ~/.zlogout
ln -sf ~/.config/zsh/zpreztorc.zsh ~/.zpreztorc
ln -sf ~/.config/zsh/zprofile.zsh ~/.zprofile
ln -sf ~/.config/zsh/zshenv.zsh ~/.zshenv
ln -sf ~/.config/zsh/zshrc.zsh ~/.zshrc
ln -sf ~/.config/zsh/zsh-autosuggestions.zsh ~/.zsh-autosuggestions
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

