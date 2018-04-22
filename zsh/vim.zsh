function v() {
  if [ $# -eq 0 ]; then
    nvim;
  else
    nvim "$@";
  fi;
}
