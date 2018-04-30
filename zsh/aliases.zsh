alias '.=cd .'
alias '..=cd ..'
alias '...=cd ../..'
alias '....=cd ../../..'
alias '.....=cd ../../../..'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Airport CLI alias
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

alias md="mkdir"

alias updateVim="vim +BundleInstall! +BundleClean +qall"

# https://github.com/github/hub
#alias git=hub

# require silver searcher ignore globally
alias ag='ag --ignore-dir ~/.config/ag/ignore'

alias e='exit'

alias cl='clear'
