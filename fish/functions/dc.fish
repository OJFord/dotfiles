function dc
    set -e DOCKER_HOST
    docker-compose $argv
end
