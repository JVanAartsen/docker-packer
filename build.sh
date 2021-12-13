#!/bin/bash
export SCRIPTS_DIR=$(dirname $(readlink -f $0))

function setup() {
    mkdir -p .build .staging
}



function prefetch_dependencies() {
    wget https://releases.hashicorp.com/packer/1.7.8/packer_1.7.8_linux_amd64.zip --quiet -O .build/packer.zip
    unzip "${SCRIPTS_DIR}/.build/packer.zip" -d .staging/
}

function docker_build() {
    docker build -t packer:latest "${SCRIPTS_DIR}"
}

#setup
# prefetch_dependencies
docker_build
