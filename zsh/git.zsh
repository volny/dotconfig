
#  TODO: just an idea: just as entering a dir triggers `ls` ...
# ... entering any git command triggers a `gs` :)

#   http://defunkt.github.com/hub/
#hub_path=$(which hub)
#if (( $+commands[hub] ))
#then
#  alias git=$hub_path
#fi

alias g="git"

alias ga="git add"
alias ga.="git add ."

alias gp='git push'
alias gpo="git push origin"
alias gpao="git push --all origin"

alias gb="git branch"
alias gba="git branch -a"

alias gs='git status -sb'

alias gc='git commit -m'
alias gca='git commit --amend'

#alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
alias gd='git diff'

alias gco='git checkout'

alias gcl='git clone'

alias gl='git log --pretty=oneline -n 20 --graph --abbrev-commit'

alias grv='git remote -v'

function gpl() {
  git pull "$@";
  git submodule foreach git pull origin master "$@";
}

alias grh='git reset --hard'
# git update remote
alias gur='git remote set-url origin'
# git reset file
alias grf='git checkout HEAD --'
