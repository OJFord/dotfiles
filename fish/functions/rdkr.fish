function rdkr
    set -Ux DOCKER_HOST (echo $RDKR_HOST)
    docker $argv
end
