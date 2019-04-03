
# when i say git i mean hub
eval "$(hub alias -s)"

alias g="git"

# ---------- ADD ----------
alias ga="git add"
alias ga.="git add ."

# ---------- PUSH ----------
alias gp='git push'
alias gpo="git push origin"
alias gpfo="git push -f origin"
alias gpom="git push origin master"
alias gpfom="git push -f origin master"
alias gpao="git push --all origin"
alias gpfao="git push -f --all origin"
alias gpd="git push --delete"
alias gpod="git push origin --delete"

# ---------- PULL ----------
alias gpl='git pull'
alias gpla='git pull --all'
alias gplo='git pull origin'
alias gplr='git pull --rebase'
alias gplro='git pull --rebase origin'
function gpls() {
  git pull "$@";
  git submodule foreach git pull origin master "$@";
}

# ---------- FETCH ----------
alias gf='git fetch'
alias gfa='git fetch --all'
alias gfo='git fetch origin'

# ---------- BRANCH ----------
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gub="git remote update origin --prune && echo '\nNew Branch List:\n' &&git branch --all"

# ---------- STATUS ----------
alias gs='git status -sb'

# ---------- COMMIT ----------
alias gc='git commit --cleanup=scissors -m'
# don't validate commit
function gcn() {
  git commit --cleanup=scissors -m "$1" -n
}
alias gca='git commit --cleanup=scissors --amend'
alias gcan='git commit --cleanup=scissors --amend -n'

# ---------- DIFF ----------
alias gd='git diff'

# ---------- CHECKOUT ----------
alias gco='git checkout'
alias gcob='git checkout -b'

# ---------- REBASE ----------
alias grb='git rebase'
alias grbi='git rebase --interactive'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'

# ---------- MERGE ----------
alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gms='git merge --squash'

# ---------- CLONE ----------
# clone and cd
function gcl() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# ---------- LOG ----------
alias glog='git log --graph -n 30'
# alias gl='git log --pretty=oneline -n 20 --graph --abbrev-commit'
alias gl='git log --graph -n 30'
# show me all commits
alias gla='git log --graph'
# show me details
alias gld="git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"

# ---------- REMOTE ----------
alias grv='git remote -v'
# git update remote
alias gurl='git remote set-url origin'

# ---------- RESET ----------
alias gr='git reset'
alias gr.='git reset .'
# throw away changes since commit
alias grh='git reset --hard'
# throw away changes since commit on <path>
alias grf='git checkout HEAD --'

# ---------- CHERRY PICK ----------
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick -- continue'
alias gcpa='git cherry-pick --abort'

# ---------- BROWSE ----------
alias gbr='git browse'
