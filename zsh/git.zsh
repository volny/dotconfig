
# when i say git i mean hub
eval "$(hub alias -s)"

alias g="git"

alias ga="git add"
alias ga.="git add ."

alias gp='git push'
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpfom="git push -f origin master"
alias gpao="git push --all origin"
alias gpfao="git push -f --all origin"

alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gbD="git branch -D"
# remove fully merged branches both locally and on remote origin
# https://superuser.com/questions/7448/can-the-output-of-one-command-be-piped-to-two-other-commands
alias gbdm"git branch -r --merged | sed '/develop\|master\|HEAD\|upstream/d' |  sed 's/.*\///' | tee >(xargs git push --delete origin) >(xargs git branch -d)"

alias gs='git status -sb'

alias gc='git commit -m'
# don't validate commit
function gcn() {
  git commit -m "$1" -n
}
alias gca='git commit --amend'
alias gcan='git commit --amend -n'

alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gco='git checkout'

alias grb='git rebase'
alias grbi='git rebase -i'
alias grba='git rebase -abort'
alias grbc='git rebase -continue'

# clone and cd
function gcl() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

alias gl='git log --pretty=oneline -n 20 --graph --abbrev-commit'
# show me all commits
alias gla='git log --pretty=oneline --graph --abbrev-commit'
# show me details
alias gld="git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"

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
