# start a jupyter notebook server exposing the current working dir
alias notebook='docker run -p 8888:8888 -v "$PWD":/home/jovyan/work jupyter/minimal-notebook'

# run ipython in the command line via jupyter notebook image
function ipython() {
  id=$(docker run -it -d jupyter/minimal-notebook /bin/bash)
  docker exec -it $id ipython
}

# remove any stopped containers and all unused images
# https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
alias dpr='docker system prune -a'

