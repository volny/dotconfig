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
# for test purposes - disable CORS and any other cross-origin protection, and launch chrome in isolation
alias chrome-insecure'open /Applications/Google\ Chrome.app --args --user-data-dir="/var/tmp/Chrome_dev_2" --disable-web-security --disable-site-isolation-trials'


alias cat='bat'
alias ping='prettyping --nolegend'
alias top="htop"

alias tmxu="tmux"
alias tmus="tmux"

alias deno="/Users/fnav/.deno/bin/deno"

# converts ocaml to reason
alias mlre="pbpaste | refmt --parse ml --print re --interface false | pbcopy"
# converts reason code into ocaml
alias reml="pbpaste | refmt --parse re --print ml --interface false | pbcopy"
