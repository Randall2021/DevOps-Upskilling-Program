#!/bin/bash
COMPOSE_DIR=/home/randall/tes-compose
check_docker_compose() {
    if ! [ -x "$(command -v docker-compose)" ]; then
        echo "Error: docker-compose is not installed."
        exit 1
    fi
}

deploy() {
    cd "$COMPOSE_DIR" || exit 1
    check_docker_compose
    docker-compose up -d --build
}

undeploy() {
    cd "$COMPOSE_DIR" || exit 1
    check_docker_compose
    docker-compose down
}

if [ "$1" == "deploy" ]; then
    deploy
elif [ "$1" == "undeploy" ]; then
    undeploy
else
    echo "Usage: $0 [deploy|undeploy]"
    exit 1
fi
