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

alias e='exit'

alias cl='clear'

# don't use finder to trash files bc it will leave DS_Store files everywhere
alias trash='trash -a'

# as I'm switching to firefox for non-dev browsing I want chrome to always open with devtools
alias chrome='open -a "Google Chrome" --args --auto-open-devtools-for-tabs'
