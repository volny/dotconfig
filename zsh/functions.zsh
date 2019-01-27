# my ip on the network
function ip() {
  ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
  echo $ip
}

# use silver-searcher to search for file names (respects .agignore!)
#function agf() {
#  ag $2 -l -g $1
#}
alias agf='ag -l -g'


function killonport() {
  lsof -ti tcp:"$@" -sTCP:LISTEN | xargs kill
}

function cd() {
  builtin cd "$@";
  tree -aC -L 1 -I '.git|node_modules' --dirsfirst . | less -FRNX;
}

function v() {
  if [ $# -eq 0 ]; then
    nvim;
  else
    nvim "$@";
  fi;
}

function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}

# Create a new directory and enter it
function mcd() {
  mkdir -p "$@" && cd "$_";
}

# alias l is created by zpresto
unalias l 2>/dev/null
unalias ll 2>/dev/null
function l() {
  tree -aC -L 1 -I '.git|node_modules' --dirsfirst "$@" | less -FRNX;
}
function ll() {
  tree -aC -L 2 -I '.git|node_modules' --dirsfirst "$@" | less -FRNX;
}
function lll() {
  tree -aC -L 3 -I '.git|node_modules' --dirsfirst "$@" | less -FRNX;
}
function llll() {
  tree -aC -L 4 -I '.git|node_modules' --dirsfirst "$@" | less -FRNX;
}
function lllll() {
  tree -aC -L 5 -I '.git|node_modules' --dirsfirst "$@" | less -FRNX;
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

function extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
  local tmpFile="${@%/}.tar";
  tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

  size=$(
    stat -f"%z" "${tmpFile}" 2> /dev/null; # macOS `stat`
    stat -c"%s" "${tmpFile}" 2> /dev/null;  # GNU `stat`
  );

  local cmd="";
  if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
    # the .tar file is smaller than 50 MB and Zopfli is available; use it
    cmd="zopfli";
  else
    if hash pigz 2> /dev/null; then
      cmd="pigz";
    else
      cmd="gzip";
    fi;
  fi;

  echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…";
  "${cmd}" -v "${tmpFile}" || return 1;
  [ -f "${tmpFile}" ] && rm "${tmpFile}";

  zippedSize=$(
    stat -f"%z" "${tmpFile}.gz" 2> /dev/null; # macOS `stat`
    stat -c"%s" "${tmpFile}.gz" 2> /dev/null; # GNU `stat`
  );

  echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully.";
}

# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh;
  else
    local arg=-sh;
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@";
  else
    du $arg .[^.]* ./*;
  fi;
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
  if [ -t 0 ]; then # argument
    python -mjson.tool <<< "$*" | pygmentize -l javascript;
  else # pipe
    python -mjson.tool | pygmentize -l json;
  fi;
}
